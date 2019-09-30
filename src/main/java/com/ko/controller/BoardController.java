package com.ko.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ko.domain.Auth;
import com.ko.domain.Board;
import com.ko.domain.Criteria;
import com.ko.domain.Guest;
import com.ko.domain.PageMaker;
import com.ko.domain.Reply;
import com.ko.service.BoardService;
import com.ko.service.GuestService;
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
	GuestService gService;
	
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
	public void list(Model model) {
		logger.info("---------------- list");
		List<Board> boards = bService.selectLimit10(0);
		
		model.addAttribute("boards",boards);
	}
	
	@ResponseBody
	@RequestMapping(value="listAdd",method=RequestMethod.GET)
	public ResponseEntity<List<Board>> listAdd(int startPage) {
		logger.info("---------------- list");
		
		List<Board> boards = bService.selectLimit10(startPage);
		
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
			
			System.out.println(replys.size());
			
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
	
	@RequestMapping(value="timeLine",method=RequestMethod.GET)
	public void timeLineGET(Model model,HttpSession session) {
		logger.info("-------------------- timeLine");
		Auth dto = (Auth)session.getAttribute("Auth");
		Guest guest = gService.selectById(dto.getUserid());
		
		model.addAttribute("guest",guest);
		List<Board> boards=bService.selectBygNoLimit24(0,guest.getgNo());
		model.addAttribute("boards",boards);
		model.addAttribute("bCount",bService.selectBygNoBoardCount(guest.getgNo()));
	}
}
