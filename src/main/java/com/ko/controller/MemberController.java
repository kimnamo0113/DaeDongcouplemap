package com.ko.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ko.domain.Guest;
import com.ko.service.GuestService;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	GuestService gService;
	
	@RequestMapping(value="login",method=RequestMethod.GET)
	public void loginFormGet() {
		logger.info("-------------------loginGet");
	}
	@RequestMapping(value="login",method=RequestMethod.POST)
	public void loginFormPost() {
		logger.info("-------------------loginPost");
	}
	
	@RequestMapping(value="join",method=RequestMethod.GET)
	public void joinFormGet() {
		logger.info("-------------------joinGet");
	}
	@RequestMapping(value="join",method=RequestMethod.POST)
	public String joinFormPost(Guest guest) {
		logger.info("-------------------joinPost guest="+guest);
		return "member/joinNext";
	}
	
	
}
