package com.ko.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Board;

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

}
