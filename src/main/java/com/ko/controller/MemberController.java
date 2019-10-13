package com.ko.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ko.domain.Guest;
import com.ko.domain.SearchCriteria;
import com.ko.domain.Auth;
import com.ko.service.FriendService;
import com.ko.service.GuestService;
import com.ko.service.LikeService;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	GuestService gService;
	
	@Autowired
	FriendService fService;
	
	@Autowired
	LikeService lService;
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public void loginFormGet() {
		logger.info("-------------------loginGet");
	}
	
	@RequestMapping(value="loginPost",method=RequestMethod.POST)
	public void loginPOST(Guest guest, Model model) {
		logger.info("-------------------login POST,"+guest);
		
		Guest dbguest = gService.selectByEmailAndPassword(guest.getgEmail(), guest.getgPassword());
		if(dbguest==null) {
			logger.info("loginPOST...login fail,not member");
			return;
		}
		model.addAttribute("guest",dbguest);

		Auth auth = new Auth();
		auth.setUserid(dbguest.getgId());
		auth.setUsername(dbguest.getgName());
		auth.setUseremail(guest.getgEmail());
		auth.setUserimage(dbguest.getgImage());
		auth.setUserno(dbguest.getgNo());
		
		model.addAttribute("loginDTO",auth);
	}
	
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("logout ......");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="join",method=RequestMethod.GET)
	public void joinFormGet() {
		logger.info("-------------------joinGet");
	}
	
	@RequestMapping(value="join",method=RequestMethod.POST)
	public String joinFormPost(Guest guest,Model model) throws Exception {
		logger.info("-------------------joinPost guest="+guest);
		
		gService.insertJoinDefault(guest);
		
		return "redirect:/member/noCertification";
	}
	@RequestMapping(value="noCertification",method=RequestMethod.GET)
	public String noCertification(Model model) {
		model.addAttribute("message","이메일 인증후 로그인해 주시기 바랍니다.");
		model.addAttribute("url","login");
		return "member/alertPage";
	}
	
	@RequestMapping(value="joinNext",method=RequestMethod.GET)
	public String joinNextPost(Guest guest) throws Exception {
		logger.info("-------------------joinNext");
		return "member/joinNext";
	}
	@RequestMapping(value="joinNext",method=RequestMethod.POST)
	public String joinNextPput(Guest guest, HttpSession session) throws Exception {
		logger.info("-------------------joinNext PUT");
		guest.setgCertification("true");
		Auth auth = (Auth)session.getAttribute("Auth");
		guest.setgNo(gService.selectById(auth.getUserid()).getgNo());
		gService.updateJoinPlus(guest);
		return "redirect:/";
	}
	
	
	@RequestMapping(value="loginCertification",method=RequestMethod.POST)
	public String loginCertificationPost(Guest guest,Model model) throws Exception {
		logger.info("-------------------loginCertificationPost guest="+guest);
		
		model.addAttribute("message","인증이 완료되었습니다.");
		model.addAttribute("url","login");
		
		gService.updateCertification(guest,"false");
		
		return "member/alertPage";
	}
	
	
	@RequestMapping(value="forgotPassWord",method=RequestMethod.GET)
	public String forgotPassGet() {
		logger.info("--------------------forgotPassGet");
		return "member/forgotPassGet";
	}
	
	
	@RequestMapping(value="tempPassWord",method=RequestMethod.POST)
	public String forgotPassPOST(Guest guest, Model model) {
		logger.info("--------------------forgotPassPOST guest : "+guest);
		
		Guest dbguest = gService.selectByEmailAndPassword(guest.getgEmail(), guest.getgPassword());
		if(dbguest==null) {
			logger.info("loginPOST...login fail,not member");
			return null;
		}
		model.addAttribute("guest",dbguest);
		model.addAttribute("update",true);
		Auth auth = new Auth();
		auth.setUserid(dbguest.getgId());
		auth.setUsername(dbguest.getgName());
		auth.setUseremail(guest.getgEmail());
		auth.setUserimage(dbguest.getgImage());
		auth.setUserno(dbguest.getgNo());
		
		model.addAttribute("loginDTO",auth);
		return "member/updatePassword";
	}
	@RequestMapping(value="updatePassword",method=RequestMethod.GET)
	public void updatePassword() {
		logger.info("-----------------updatePassword");
	}
	
	
	@RequestMapping(value="searchFriend",method=RequestMethod.GET)
	public ResponseEntity<List<Guest>> searchFriend(Model model,@ModelAttribute("cri") SearchCriteria cri) {
		logger.info("---------------- searchFriend");
		ResponseEntity<List<Guest>> entity = null;
				
		try {
			List<Guest> guests = gService.selectSearchGIdAll(cri.getKeyword());
			entity = new ResponseEntity<List<Guest>>(guests,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Guest>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
