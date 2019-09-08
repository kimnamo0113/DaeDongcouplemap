package com.ko.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Guest;

@Repository
public class GuestDaoImpl implements GuestDao{

	private static final String namespace = "com.ko.mapper.GuestMapper";
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Guest selectById(String gId) {
		return sqlSession.selectOne(namespace+".selectById",gId);
	}

	@Override
	public int selectIdCheck(String gId) {
		return sqlSession.selectOne(namespace+".selectIdCheck", gId);
	}

	@Override
	public int selectEmailCheck(String gEmail) {
		return sqlSession.selectOne(namespace+".selectEmailCheck", gEmail);
	}

}
