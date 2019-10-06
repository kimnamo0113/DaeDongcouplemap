package com.ko.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ko.domain.Friend;
import com.ko.persistence.FriendDao;

@Service
public class FriendServiceImpl implements FriendService{
	@Autowired
	FriendDao dao;
	
	@Override
	public void insertFriend(int follow, int follower,int fRead) {
		dao.insertFriend(follow, follower, fRead);
	}

	@Override
	public void deleteFriend(int follow, int follower) {
		dao.deleteFriend(follow, follower);
	}

	@Override
	public int selectFlag(int follow, int follower) {
		Friend friend=dao.selectFriend(follow,follower);
		Friend friend2=dao.selectFriend(follower,follow);
		//flag 버튼 = 0:관계x(팔로워) 1:요청됨 2:팔로워 3:팔로잉
		int flag=0;
		
		if(friend!=null && friend2==null)
			flag=1;
		else if(friend==null && friend2!=null)
			flag=2;
		else if(friend!=null && friend2!=null)
			flag=3;

		return flag; 
	}

	@Override
	public Friend selectFriend(int follow, int follower) {
		return dao.selectFriend(follow, follower);
	}

	@Override
	public int selectFollowCount(int gNo) {
		return dao.selectFollowCount(gNo);
	}

	@Override
	public int selectFollowerCount(int gNo) {
		return dao.selectFollowerCount(gNo);
	}

	@Override
	public int selectFriendAlarmCount(int gNo) {
		return dao.selectFriendAlarmCount(gNo);
	}

	@Override
	public List<Friend> selectAlarmList(int gNo) {
		List<Friend> list =dao.selectAlarmList(gNo);
		
		return list;
	}

	@Override
	public void updateFrined(int follow, int follower, Date date, int fRead) {
		dao.updateFrined(follow,follower,date,fRead);
	}

	@Override
	public List<Friend> selectFollowerList(int gNo) {
		return dao.selectFollowerList(gNo);
	}

	@Override
	public List<Friend> selectFollowList(int gNo) {
		return dao.selectFollowList(gNo);
	}

	
}
