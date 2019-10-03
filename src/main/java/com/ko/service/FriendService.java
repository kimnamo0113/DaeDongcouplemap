package com.ko.service;

import java.util.Map;

import com.ko.domain.Friend;

public interface FriendService {
	public void insertFriend(int follow, int follower);
	public void deleteFriend(int follow, int follower);
	public Friend selectFriend(int follow, int follower);
	public int selectFlat(int follow, int follower);
	public int selectFollowCount(int gNo);
	public int selectFollowerCount(int gNo);
}
