package com.ko.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.ko.domain.Guest;

public interface GuestService {
	public Guest selectById(String gId);
	
	//회원가입 중복체크용
	public int selectIdCheck(String gId);
	public int selectEmailCheck(String gEmail);
	
	//회원가입후 insert:기본, update:추가기입
	public void insertJoinDefault(Guest guest) throws Exception;
	public void updateJoinPlus(Guest guest);
	//비번찾기
	public boolean find_pw(HttpServletResponse response, Guest guest) throws Exception;
	
	public Guest selectByEmailAndPassword(String gEmail,String gPassword);

	public String create_key();

	public void updateCertification(Guest guest,String check) throws Exception;
	
	public void updatePassWord(Guest guest) throws Exception;

	public void updateGuestImg(String savedName);

	public void updateAll(Guest guest);

	public Guest selectByGNo(int gNo);

	public List<Guest> selectSearchGIdAll(String keyword);
}
