package com.ko.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Board;
import com.ko.domain.Like;

@Repository
public class LikeDaoImpl implements LikeDao{
	private static final String namespace = "com.ko.mapper.LikeMapper";
	
	@Autowired
	SqlSession sqlSession;

	
	@Override
	public int selectLikeCount(int bNo) {
		return sqlSession.selectOne(namespace+".selectLikeCount",bNo);
	}


	@Override
	public void insertLike(Board board) {
		sqlSession.insert(namespace+".insertLike",board);
	}


	@Override
	public Like selectLikeByBNoGNo(int bNo, int gNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bNo", bNo);
		map.put("gNo", gNo);
		return sqlSession.selectOne(namespace+".selectLikeByBNoGNo",map);
	}


	@Override
	public void insertLike(int bNo, int gNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("bNo", bNo);
		map.put("gNo", gNo);
		sqlSession.insert(namespace+".insertLike",map);
	}


	@Override
	public void deleteLike(int bNo, int gNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("bNo", bNo);
		map.put("gNo", gNo);
		sqlSession.insert(namespace+".deleteLike",map);
	}


	@Override
	public int selectLikeAlarmCount(int gNo) {
		return sqlSession.selectOne(namespace+".selectLikeAlarmCount",gNo);
	}


	@Override
	public List<Like> selectLikeList(int gNo) {
		return sqlSession.selectList(namespace+".selectLikeList",gNo);
	}

}
