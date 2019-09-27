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

	
}
