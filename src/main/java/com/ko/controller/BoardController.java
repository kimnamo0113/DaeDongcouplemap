package com.ko.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ko.domain.Auth;
import com.ko.domain.Board;
import com.ko.domain.Criteria;
import com.ko.domain.Guest;
import com.ko.domain.Like;
import com.ko.domain.PageMaker;
import com.ko.domain.Reply;
import com.ko.domain.SearchCriteria;
import com.ko.service.BoardService;
import com.ko.service.FriendService;
import com.ko.service.GuestService;
import com.ko.service.LikeService;
import com.ko.service.ReplyService;

 
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private BoardService bService;
	
	@Autowired
	private ReplyService rService;
	
	
	@Autowired
	private GuestService gService;
	
	@Autowired
	private FriendService fService;
	
	@Autowired
	private LikeService lService;
	
/*	@RequestMapping(value="write",method=RequestMethod.GET)
	public void writeGET() {
		logger.info("--------------------board/write");
	}
*/	
	
	@RequestMapping(value = "coding")
	public String coding() {
		logger.info("------------------coding");
	    return "index";
	 }
	
	/*@RequestMapping(value = "insertBoard", method = RequestMethod.POST)
    public String insertBoard(String editor,Board board,String hash, Area area,HttpSession session) {
		logger.info("------------------insertBoard");
		
		Auth auth=(Auth)session.getAttribute("Auth");
        
        board.setbContents(editor);
        board.setbPlace(area.getStrChange());
        board.setgNo(auth.getUserno());
        service.insertBoard(board);
        return "redirect:/";
    }*/
	
	@RequestMapping(value="list",method=RequestMethod.GET)
	public void list(Model model,@ModelAttribute("cri") SearchCriteria cri, HttpSession session) {
		logger.info("---------------- list");
		List<Board> boards = bService.selectLimit10(cri);
		
		
		Auth auth = (Auth)session.getAttribute("Auth");
		List<Like> likeList = new ArrayList<>();
		if(auth!=null) {
			for(int i = 0; i < boards.size(); i++) {
				likeList.add(lService.selectLikeByBNoGNo(boards.get(i).getbNo(), auth.getUserno()));
			}
		}
		
		model.addAttribute("likeList",likeList);
		model.addAttribute("boards",boards);
	}
	
	@RequestMapping(value="searchBoard",method=RequestMethod.GET)
	public void searchBoard(Model model,@ModelAttribute("cri") SearchCriteria cri) {
		logger.info("---------------- searchBoard");
		cri.setPerPageNum(24);
		System.out.println(cri);
		List<Board> boards = bService.selectLimit10(cri);
		
		model.addAttribute("boards",boards);
	}
	@RequestMapping(value="searchBoard",method=RequestMethod.POST)
	public ResponseEntity<List<Board>> searchBoardPOST(SearchCriteria cri) {
		logger.info("---------------- searchBoard POST");
		ResponseEntity<List<Board>> entity =null;
		cri.setPerPageNum(24);
		try {
			List<Board> boards = bService.selectLimit10(cri);
			entity = new ResponseEntity<>(boards,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	@RequestMapping(value="selectlist",method=RequestMethod.GET)
	public void selectlist(Model model) {
		logger.info("---------------- list");
		
	}
	
	@ResponseBody
	@RequestMapping(value="listAdd",method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listAdd(SearchCriteria cri,HttpSession session) {
		logger.info("---------------- list");
		ResponseEntity<Map<String,Object>> entity = null;
		try {
			List<Board> boards = bService.selectLimit10(cri);
			Map<String, Object> map = new HashMap<>();
			map.put("boards", boards);
			
			Auth auth = (Auth)session.getAttribute("Auth");
			List<Like> likeList = new ArrayList<>();
			if(auth!=null) {
				for(int i = 0; i < boards.size(); i++) {
					likeList.add(lService.selectLikeByBNoGNo(boards.get(i).getbNo(), auth.getUserno()));
				}
			}
			map.put("likeList", likeList);
			
			
			entity=new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return entity;
	}
	
	@RequestMapping(value="timeLine",method=RequestMethod.GET)
	public void timeLineGET(Model model,Guest guest, HttpSession session) {
		logger.info("-------------------- timeLine");
		Auth auth=(Auth)session.getAttribute("Auth");
		guest = gService.selectByGNo(guest.getgNo());
		//flag(버튼) = 0:관계x(팔로워) 1:요청됨 2:팔로워 3:팔로잉
		if(auth!=null) {
			int flag = fService.selectFlag(auth.getUserno(), guest.getgNo());
			model.addAttribute("flag",flag);
		}
		//guest board뽑기
		List<Board> boards=bService.selectBygNoLimit24(0,guest.getgNo());
		int followCount = fService.selectFollowCount(guest.getgNo());
		int followerCount = fService.selectFollowerCount(guest.getgNo());
		model.addAttribute("followCount", followCount);
		model.addAttribute("followerCount",followerCount);
		model.addAttribute("guest",guest);
		
		model.addAttribute("boards",boards);
		model.addAttribute("bCount",bService.selectBygNoBoardCount(guest.getgNo()));
	}
	
	@RequestMapping(value="timelineListAdd",method=RequestMethod.GET)
	public ResponseEntity<List<Board>> timelineListAdd(int page, int gNo) {
		logger.info("---------------- timelineListAdd");
		
		List<Board> boards = bService.selectBygNoLimit24(page, gNo);
		ResponseEntity<List<Board>> entity = null;
		
		entity=new ResponseEntity<List<Board>>(boards,HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="insertReply",method=RequestMethod.POST)
	public ResponseEntity<Boolean> insertReply(@RequestBody Reply reply){
		logger.info("--------------- insertReply reply : "+reply);
		ResponseEntity<Boolean> entity=null;
		try {
			rService.insertReply(reply);
			entity=new ResponseEntity<>(true,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(true,HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="selectReply",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> selectReply(int bNo,int page){
		logger.info("--------------------- selectReply");
		ResponseEntity<Map<String,Object>> entity = null;
		Criteria cri = new Criteria();
		cri.setPage(page);
		try {
			List<Reply> replys = rService.selectPageByBNoPage(bNo,cri);
			
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			pageMaker.setTotalCount(rService.selectReplyCount(bNo));
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("replys", replys);
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		
		
		
		return entity;
	}
	@RequestMapping(value="boardDetail",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> boardDetail(int bNo,Criteria cri,int rNo,HttpSession session){
		logger.info("---------------------- boardDetail");
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String, Object> map = new HashMap<>();
		try {
			if(rNo!=0) {
				int page = rService.selectByRNoOrderBNo(bNo,rNo);
				page=(page-1)/10;
				
				cri.setPage(page+1);
			}
			Board board = bService.selectBNoReplyLimit10(bNo,cri);
			
			Auth auth = (Auth)session.getAttribute("Auth");
			Like like = null;
			if(auth!=null) {
				like=lService.selectLikeByBNoGNo(bNo, auth.getUserno());
			}
			
			
			map.put("board", board);
			map.put("cri", cri);
			map.put("like", like);
			entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="insertHeart",method=RequestMethod.POST)
	public ResponseEntity<Boolean> insertHeart(int bNo, int gNo){
		logger.info("--------------------insertHeart");
		ResponseEntity<Boolean> entity = null;
		try {
			lService.insertLike(bNo,gNo);
			entity=new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="deleteHeart",method=RequestMethod.POST)
	public ResponseEntity<Boolean> deleteHeart(int bNo, int gNo){
		logger.info("------------------------- deleteHeart");
		ResponseEntity<Boolean> entity = null;
		try {
			lService.deleteLike(bNo,gNo);
			entity=new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="alarmList",method=RequestMethod.POST)
	public ResponseEntity<List<Reply>> alarmList(Criteria cri,int gNo){
		logger.info("------------------------- alarmList");
		ResponseEntity<List<Reply>> entity = null;
		try {
			List<Reply> replies = rService.selectBoardAlarmLimit10(cri,gNo);
			entity = new ResponseEntity<List<Reply>>(replies,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Reply>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@RequestMapping(value="likeRead",method=RequestMethod.POST)
	public ResponseEntity<Boolean> likeRead(int lNo,int read){
		logger.info("------------------------- likeRead");
		ResponseEntity<Boolean> entity = null;
		System.out.println(lNo);
		System.out.println(read);
		try {
			lService.updateLikeRead(lNo,read);
			entity = new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@RequestMapping(value="replyRead",method=RequestMethod.POST)
	public ResponseEntity<Boolean> replyRead(int rNo,int read){
		logger.info("------------------------- likeRead");
		ResponseEntity<Boolean> entity = null;
		System.out.println(rNo);
		System.out.println(read);
		try {
			rService.updateReplyRead(rNo,read);
			entity = new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
