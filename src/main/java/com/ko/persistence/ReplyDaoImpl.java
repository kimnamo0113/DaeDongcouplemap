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
	public List<Reply> selectReplyLimit5(int bNo) {
		return sqlSession.selectList(namespace+".selectBoardLimit5",bNo);
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

	@Override
	public List<Reply> selectBoardAlarmLimit10(Criteria cri, int gNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("gNo", gNo);
		return sqlSession.selectList(namespace+".selectBoardAlarmLimit10",map);
	}

	@Override
	public int selectBoardAlarmCount(int gNo) {
		List<Reply> list = sqlSession.selectList(namespace+".selectBoardAlarmCount",gNo);
		int result = 0;
		for(Reply r : list) {
			result += r.getrNo();
		}
		return result;
	}

	@Override
	public void updateReplyRead(int rNo, int read) {
		Map<String, Integer> map = new HashMap<>();
		map.put("rNo", rNo);
		map.put("read", read);
		sqlSession.update(namespace+".updateReplyRead",map);
	}

	@Override
	public int selectByRNoOrderBNo(int bNo, int rNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("bNo", bNo);
		map.put("rNo", rNo);
		
		return sqlSession.selectOne(namespace+".selectByRNoOrderBNo",map);
	}

	
}
