package com.ko.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Guest;
import com.ko.persistence.GuestDao;

@Repository
public class GuestServiceImpl implements GuestService{
	
	@Autowired
	GuestDao dao;

	@Override
	public Guest selectById(String gId) {
		return dao.selectById(gId);
	}

	@Override
	public int selectIdCheck(String gId) {
		return dao.selectIdCheck(gId);
	}

	@Override
	public int selectEmailCheck(String gEmail) {
		return dao.selectEmailCheck(gEmail);
	}

	@Override
	public void insertJoinDefault(Guest guest) {
		dao.insertJoinDefault(guest);
	}

	@Override
	public void updateJoinPlus(Guest guest) {
		dao.updateJoinPlus(guest);
	}
}
