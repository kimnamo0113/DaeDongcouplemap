package com.ko.service;

import javax.servlet.http.HttpServletResponse;

import com.ko.domain.Guest;

public interface GuestService {
	public Guest selectById(String gId);
	
	//회원가입 중복체크용
	public int selectIdCheck(String gId);
	public int selectEmailCheck(String gEmail);
	
	//회원가입후 insert:기본, update:추가기입
	public void insertJoinDefault(Guest guest);
	public void updateJoinPlus(Guest guest);
	//비번찾기
	public void find_pw(HttpServletResponse response, Guest guest) throws Exception;
}
