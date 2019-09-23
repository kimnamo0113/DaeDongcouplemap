package com.ko.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ko.domain.Auth;
import com.ko.domain.Guest;
import com.ko.service.GuestService;
import com.ko.util.UploadFileUtils;

@RestController
@RequestMapping("/member/*")
public class MemberRestController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private GuestService service;
	
	// 중복체크용
	@RequestMapping(value = "join/id", method = RequestMethod.POST)
	public ResponseEntity<Integer> id(@RequestParam("gId") String gId) {
		logger.info("----------------idPOST id=" + gId);
		ResponseEntity<Integer> entity = null;

		try {
			int res = service.selectIdCheck(gId);
			logger.info("res=" + res);
			entity = new ResponseEntity<>(res, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(0, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 중복체크용
	@RequestMapping(value = "join/email", method = RequestMethod.POST)
	public ResponseEntity<Integer> email(@RequestParam("gEmail") String gEmail) {
		logger.info("----------------gEmailPOST gmail=" + gEmail);
		ResponseEntity<Integer> entity = null;

		try {
			int res = service.selectEmailCheck(gEmail);
			logger.info("res=" + res);
			entity = new ResponseEntity<>(res, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(0, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "forgotPassWord", method = RequestMethod.PUT)
	public ResponseEntity<Boolean> forgotPassWordPUT(@RequestBody Guest guest,HttpServletResponse response) throws Exception {
		logger.info("--------------------forgotPassWordPUT");
		logger.info("--------------------guest : " + guest);
		boolean check=service.find_pw(response, guest);
		return new ResponseEntity<Boolean>(check,HttpStatus.OK);
	}
	
	@RequestMapping(value="updatePassword", method=RequestMethod.POST)
	public ResponseEntity<Boolean> updatePasswordPOST(@RequestBody Map<String, Object> map,HttpSession session) throws Exception {
		logger.info("---------------------updatePassword");
		Auth auth=(Auth)session.getAttribute("Auth");
		Guest guest=service.selectByEmailAndPassword(auth.getUseremail(), (String)map.get("gPassword"));
		String changePassword=(String)map.get("gPassword1");
		
		if(guest==null) {
			return new ResponseEntity<Boolean>(false,HttpStatus.OK);
		}
		else {
			guest.setgPassword(changePassword);
			service.updatePassWord(guest);
			return new ResponseEntity<Boolean>(true,HttpStatus.OK);
		}
		
		
	}

	

}
