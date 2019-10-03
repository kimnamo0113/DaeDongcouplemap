package com.ko.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Friend;

@Repository
public class FriendDaoImpl implements FriendDao{
	
	private static final String namespace = "com.ko.mapper.FriendMapper";
	
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public void insertFriend(int follow, int follower) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("follow", follow);
		map.put("follower", follower);
		sqlSession.insert(namespace+".insertFriend",map);
	}


	@Override
	public void deleteFriend(int follow, int follower) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("follow", follow);
		map.put("follower", follower);
		sqlSession.insert(namespace+".deleteFriend",map);
	}


	@Override
	public Friend selectFriend(int follow, int follower) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("follow", follow);
		map.put("follower", follower);
		return sqlSession.selectOne(namespace+".selectFriend",map);
	}


	@Override
	public int selectFollowCount(int gNo) {
		return sqlSession.selectOne(namespace+".selectFollowCount",gNo);
	}


	@Override
	public int selectFollowerCount(int gNo) {
		return sqlSession.selectOne(namespace+".selectFollowerCount",gNo);
	}


}
