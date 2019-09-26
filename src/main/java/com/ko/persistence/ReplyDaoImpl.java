package com.ko.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao{
	private static final String namespace = "com.ko.mapper.ReplyMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertReply(Reply reply) {
		sqlSession.insert(namespace+".insertReply",reply);
	}
	
}
