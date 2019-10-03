package com.ko.persistence;

import com.ko.domain.Friend;

public interface FriendDao {
	public void insertFriend(int follow,int follower);

	public void deleteFriend(int follow, int follower);

	public Friend selectFriend(int follow, int follower);

	public int selectFollowCount(int follow);

	public int selectFollowerCount(int follow);
}
