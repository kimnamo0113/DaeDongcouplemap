package com.ko.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ko.domain.Guest;
import com.ko.service.GuestService;



@RestController
@RequestMapping("/member/join/*")
public class JoinRestController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private GuestService service;
	
	//중복체크용
	@RequestMapping(value="id",method=RequestMethod.POST)
	public ResponseEntity<Integer> id(@RequestParam("gId") String gId){
		logger.info("----------------idPOST id="+gId);
		ResponseEntity<Integer> entity = null;
		
		try {
			int res = service.selectIdCheck(gId);
			logger.info("res="+res);
			entity = new ResponseEntity<>(res,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(0,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="email",method=RequestMethod.POST)
	public ResponseEntity<Integer> email(@RequestParam("gEmail") String gEmail){
		logger.info("----------------gEmailPOST gmail="+gEmail);
		ResponseEntity<Integer> entity = null;
		
		try {
			int res = service.selectEmailCheck(gEmail);
			logger.info("res="+res);
			entity = new ResponseEntity<>(res,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(0,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
