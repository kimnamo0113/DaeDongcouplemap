package com.ko.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ko.domain.Auth;
import com.ko.domain.Friend;
import com.ko.domain.Like;
import com.ko.service.FriendService;
import com.ko.service.LikeService;

public class RefreshIntercepter extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(RefreshIntercepter.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return super.preHandle(request, response, handler);
	}
	
	@Autowired
	FriendService fService;

	@Autowired
	LikeService lService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		logger.info("RefreshIntercepter...........postHandler");
		Auth auth = (Auth)session.getAttribute("Auth");
		
		List<Friend> friends=null;
		List<Like> likes=null;
		
		if(auth!=null) {
			auth.setFriendAlarm(fService.selectFriendAlarmCount(auth.getUserno()));
			auth.setBoardAlarm(lService.selectLikeAlarmCount(auth.getUserno()));

			friends = fService.selectFolloingList(auth.getUserno());
			likes=lService.selectLikeList(auth.getUserno());
			
			request.setAttribute("friends", friends);
			request.setAttribute("likes", likes);
			
			
		}
		
	}
}
