package com.ko.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ko.domain.Area;
import com.ko.domain.Auth;
import com.ko.domain.Board;
import com.ko.domain.Reply;
import com.ko.service.BoardService;
import com.ko.service.ReplyService;
import com.ko.util.UploadFileUtils;
import com.ko.util.UploadServerFileUrl;






@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private BoardService bService;
	
	@Autowired
	private ReplyService rService;
	
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
	
	@RequestMapping(value = "insertBoard", method = RequestMethod.POST)
    public String insertBoard(String editor,Board board,String hash, Area area,HttpSession session) {
		logger.info("------------------insertBoard");
		
		Auth auth=(Auth)session.getAttribute("Auth");
        
        board.setbContents(editor);
        board.setbPlace(area.getStrChange());
        board.setgNo(auth.getUserno());
        /*service.insertBoard(board);*/
        return "redirect:/";
    }
	
	@RequestMapping(value="list",method=RequestMethod.GET)
	public void list(Model model) {
		logger.info("---------------- list");
		List<Board> boards = bService.selectLimit10(0);
		
		for(Board board : boards) {
			System.out.println(board.getContents());
			System.out.println(board.getReplys());
		}
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
	public ResponseEntity<Reply> insertReply(@RequestBody Reply reply){
		logger.info("--------------- insertReply reply : "+reply);
		ResponseEntity<Reply> entity=null;
		rService.insertReply(reply);
		return entity;
	}
	
}
