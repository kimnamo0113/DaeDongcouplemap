package com.ko.persistence;

import com.ko.domain.Guest;

public interface GuestDao {
	public Guest selectById(String gId);
	
	//회원가입시 중복확인용
	public int selectIdCheck(String gId);
	public int selectEmailCheck(String gEmail);

	public void insertJoinDefault(Guest guest);
	public void updateJoinPlus(Guest guest);
}
