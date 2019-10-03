package com.ko.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ko.service.FriendService;

@Controller
@RequestMapping("/friend/*")
public class FriendController {
	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private FriendService service;
	
	@RequestMapping(value="follow",method=RequestMethod.POST)
	public ResponseEntity<Boolean> follow(
			int follow,
			int follower){
		logger.info("------------------------------follow");
		ResponseEntity<Boolean> entity = null;
		
		try {
			service.insertFriend(follow, follower);
			entity = new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@RequestMapping(value="request",method=RequestMethod.POST)
	public ResponseEntity<Boolean> request(
			int follow,
			int follower){
		logger.info("------------------------------request");
		ResponseEntity<Boolean> entity = null;
		
		try {
			service.deleteFriend(follow, follower);
			entity = new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
