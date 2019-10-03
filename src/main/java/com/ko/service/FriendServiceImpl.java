package com.ko.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ko.domain.Friend;
import com.ko.persistence.FriendDao;

@Service
public class FriendServiceImpl implements FriendService{
	@Autowired
	FriendDao dao;
	
	@Override
	public void insertFriend(int follow, int follower) {
		dao.insertFriend(follow, follower);
	}

	@Override
	public void deleteFriend(int follow, int follower) {
		dao.deleteFriend(follow, follower);
	}

	@Override
	public int selectFlat(int follow, int follower) {
		Friend friend=dao.selectFriend(follow,follower);
		Friend friend2=dao.selectFriend(follower,follow);
		//flat 버튼 = 0:관계x(팔로워) 1:요청됨 2:팔로워 3:팔로잉
		int flat=0;
		
		if(friend!=null && friend2==null)
			flat=1;
		else if(friend==null && friend2!=null)
			flat=2;
		else if(friend!=null && friend2!=null)
			flat=3;

		return flat; 
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

	
}
