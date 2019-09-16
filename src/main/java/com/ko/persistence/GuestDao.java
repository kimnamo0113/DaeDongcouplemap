package com.ko.persistence;

import com.ko.domain.Guest;

public interface GuestDao {
	public Guest selectById(String gId);
	public Guest selectByEmail(String gEmail) throws Exception;
	
	//회원가입시 중복확인용
	public int selectIdCheck(String gId);
	public int selectEmailCheck(String gEmail);

	public void insertJoinDefault(Guest guest);
	public void updateJoinPlus(Guest guest);
	
	//비번찾기
	public void send_mail(Guest guest, String div) throws Exception;
	
	//임시비밀번호
	//발급받기
	public void updateTempPassWord(Guest guest) throws Exception;
	
}
