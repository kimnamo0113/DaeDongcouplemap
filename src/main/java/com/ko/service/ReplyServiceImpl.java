package com.ko.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
