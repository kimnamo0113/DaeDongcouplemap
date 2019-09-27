package com.ko.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Criteria;
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

	@Override
	public List<Reply> selectBoardLimit10(int bNo) {
		return sqlSession.selectList(namespace+".selectBoardLimit10",bNo);
	}

	@Override
	public int selectReplyCount(int bNo) {
		return sqlSession.selectOne(namespace+".selectReplyCount",bNo);
	}

	@Override
	public List<Reply> selectPageByBNoPage(int bNo,Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bNo", bNo);
		map.put("cri", cri);
		return sqlSession.selectList(namespace+".selectPageByBNoPage",map);
	}
	
}
