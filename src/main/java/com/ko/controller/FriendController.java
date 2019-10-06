package com.ko.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ko.domain.Auth;
import com.ko.domain.Friend;
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
			service.insertFriend(follow, follower,0);
			entity = new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@RequestMapping(value="followAccept",method=RequestMethod.POST)
	public ResponseEntity<Boolean> followAccept(
			int follow,
			int follower,
			int fRead,
			HttpSession session
			){
		logger.info("------------------------------follow");
		System.out.println(follow);
		System.out.println(follower);
		System.out.println(fRead);
		ResponseEntity<Boolean> entity = null;
		if(fRead==0) {
			Auth auth = (Auth)session.getAttribute("Auth");
			auth.setFriendAlarm(auth.getFriendAlarm()-1);
			session.setAttribute("Auth", auth);
		}
		try {
			service.insertFriend(follow, follower,3);
			service.updateFrined(follower,follow,new Date(),4);
			
			entity = new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@RequestMapping(value="followUpdate",method=RequestMethod.POST)
	public ResponseEntity<Boolean> followUpdate(
			int follow,
			int follower,
			int fRead,
			HttpSession session
			){
		logger.info("------------------------------followUpdate");
		ResponseEntity<Boolean> entity = null;
		Auth auth = (Auth)session.getAttribute("Auth");
		auth.setFriendAlarm(auth.getFriendAlarm()-1);
		session.setAttribute("Auth", auth);
		try {
			service.updateFrined(follower,follow,new Date(),fRead);
			
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
	
	@RequestMapping(value="alarmList",method=RequestMethod.POST)
	public ResponseEntity<List<Friend>> alarmList(int gNo){
		logger.info("---------------------- alarmList");
		ResponseEntity<List<Friend>> entity = null;
		try {
			List<Friend> folloRequest = service.selectAlarmList(gNo);
			entity = new ResponseEntity<List<Friend>>(folloRequest,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Friend>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="followerList",method=RequestMethod.POST)
	public ResponseEntity<List<Friend>> followerList(int gNo){
		logger.info("---------------------- alarmList");
		ResponseEntity<List<Friend>> entity = null;
		try {
			List<Friend> folloRequest = service.selectFollowerList(gNo);
			entity = new ResponseEntity<List<Friend>>(folloRequest,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Friend>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="followList",method=RequestMethod.POST)
	public ResponseEntity<List<Friend>> followList(int gNo){
		logger.info("---------------------- alarmList");
		ResponseEntity<List<Friend>> entity = null;
		try {
			List<Friend> folloRequest = service.selectFollowList(gNo);
			entity = new ResponseEntity<List<Friend>>(folloRequest,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Friend>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
