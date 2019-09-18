package com.ko.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ko.domain.Guest;
import com.ko.domain.Auth;
import com.ko.service.GuestService;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	GuestService service;
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public void loginFormGet() {
		logger.info("-------------------loginGet");
	}
	
	@RequestMapping(value="loginPost",method=RequestMethod.POST)
	public void loginPOST(Guest guest, Model model) {
		logger.info("-------------------login POST,"+guest);
		
		Guest dbguest = service.selectByEmailAndPassword(guest.getgEmail(), guest.getgPassword());
		if(dbguest==null) {
			logger.info("loginPOST...login fail,not member");
			return;
		}
		model.addAttribute("guest",dbguest);

		Auth dto = new Auth();
		dto.setUserid(dbguest.getgId());
		dto.setUsername(dbguest.getgPassword());
		model.addAttribute("loginDTO",dto);
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
		
		service.insertJoinDefault(guest);
		
		return "redirect:/member/noCertification";
	}
	@RequestMapping(value="noCertification",method=RequestMethod.GET)
	public String noCertification(Model model) {
		model.addAttribute("message","이메일 인증후 로그인해 주시기 바랍니다.");
		model.addAttribute("url","login");
		return "member/alertPage";
	}
	
	@RequestMapping(value="joinNext",method=RequestMethod.GET)
	public String joinNextPost(Guest guest,Model model) throws Exception {
		logger.info("-------------------joinNext");
		return "member/joinNext";
	}
	
	
	@RequestMapping(value="loginCertification",method=RequestMethod.POST)
	public String loginCertificationPost(Guest guest,Model model) throws Exception {
		logger.info("-------------------loginCertificationPost guest="+guest);
		
		model.addAttribute("message","인증이 완료되었습니다.");
		model.addAttribute("url","login");
		
		service.updateCertification(guest,"false");
		
		return "member/alertPage";
	}
	
	
	@RequestMapping(value="forgotPassWord",method=RequestMethod.GET)
	public String forgotPassGet() {
		return "member/forgotPassGet";
	}
	
	
	@RequestMapping(value="forgotPassWord",method=RequestMethod.PUT)
	public String forgotPassPOST() {
		
		return "member/forgotPassGet";
	}
	
}
