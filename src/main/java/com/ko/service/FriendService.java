package com.ko.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ko.domain.Friend;

public interface FriendService {
	public void insertFriend(int follow, int follower,int fRead);
	public void deleteFriend(int follow, int follower);
	public Friend selectFriend(int follow, int follower);
	public int selectFlag(int follow, int follower);
	public int selectFollowCount(int gNo);
	public int selectFollowerCount(int gNo);
	public int selectFriendAlarmCount(int gNo);
	public List<Friend> selectAlarmList(int gNo);
	public void updateFrined(int follow, int follower, Date date, int fRead);
	public List<Friend> selectFollowerList(int gNo,HttpSession session);
	public List<Friend> selectFollowList(int gNo,HttpSession session);
	public List<Friend> selectFolloingList(int userno);
	public List<Friend> selectFollowerNameORId(int gNo, String name);
}
