package com.ko.persistence;

import java.util.Date;
import java.util.List;

import com.ko.domain.Friend;

public interface FriendDao {
	public void insertFriend(int follow,int follower,int fRead);

	public void deleteFriend(int follow, int follower);

	public Friend selectFriend(int follow, int follower);

	public int selectFollowCount(int follow);

	public int selectFollowerCount(int follow);

	public int selectFriendAlarmCount(int gNo);

	public List<Friend> selectAlarmList(int gNo);

	public void updateFrined(int follow, int follower, Date date, int fRead);
}
