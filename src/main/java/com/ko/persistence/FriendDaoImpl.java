package com.ko.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
	public void insertFriend(int follow, int follower,int fRead) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("follow", follow);
		map.put("follower", follower);
		map.put("fRead", fRead);
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


	@Override
	public int selectFriendAlarmCount(int gNo) {
		return sqlSession.selectOne(namespace+".selectFriendAlarmCount",gNo);
	}


	@Override
	public List<Friend> selectAlarmList(int gNo) {
		return sqlSession.selectList(namespace+".selectAlarmList",gNo);
	}


	@Override
	public void updateFrined(int follow, int follower, Date date, int fRead) {
		Map<String, Object> map = new HashMap<>();
		map.put("follow", follow);
		map.put("follower", follower);
		map.put("date", date);
		map.put("fRead", fRead);
		sqlSession.update(namespace+".updateFrined",map);
	}


}
