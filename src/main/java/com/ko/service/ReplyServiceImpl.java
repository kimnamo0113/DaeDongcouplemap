package com.ko.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ko.domain.Criteria;
import com.ko.domain.Reply;
import com.ko.persistence.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDao dao;
	
	@Override
	public void insertReply(Reply reply) {
		dao.insertReply(reply);
	}

	@Override
	public List<Reply> selectPageByBNoPage(int bNo, Criteria cri) {
		return dao.selectPageByBNoPage(bNo,cri);
	}

	@Override
	public int selectReplyCount(int bNo) {
		return dao.selectReplyCount(bNo);
	}

	@Override
	public List<Reply> selectBoardAlarmLimit10(Criteria cri, int gNo) {
		return dao.selectBoardAlarmLimit10(cri,gNo);
	}

	@Override
	public int selectBoardAlarmCount(int gNo) {
		return dao.selectBoardAlarmCount(gNo);
	}

	@Override
	public void updateReplyRead(int rNo, int read) {
		dao.updateReplyRead(rNo,read);
	}

	@Override
	public int selectByRNoOrderBNo(int bNo, int rNo) {
		return dao.selectByRNoOrderBNo(bNo,rNo);
	}


	
}
