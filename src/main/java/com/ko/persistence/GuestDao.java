package com.ko.persistence;

import com.ko.domain.Guest;

public interface GuestDao {
	public Guest selectById(String gId);
	public Guest selectByEmail(String gEmail) throws Exception;
	
	//회원가입시 중복확인용
	public int selectIdCheck(String gId);
	public int selectEmailCheck(String gEmail);

	public void insertJoinDefault(Guest guest) throws Exception;
	public void updateJoinPlus(Guest guest);
	
	//비번찾기
	public void send_mail(Guest guest, String div) throws Exception;
	
	//임시비밀번호
	//발급받기
	public void updatePassWord(Guest guest) throws Exception;
	public Guest selectByEmailAndPassword(String gEmail, String gPassword);
	public void updateCertification(Guest guest, String check);
	
	public void updateCertification(Guest guest) throws Exception;
}
