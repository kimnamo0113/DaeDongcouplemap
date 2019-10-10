package com.ko.service;

import java.util.List;

import com.ko.domain.Criteria;
import com.ko.domain.Reply;

public interface ReplyService {
	public void insertReply(Reply reply);
	List<Reply> selectPageByBNoPage(int bNo, Criteria cri);
	int selectReplyCount(int bNo);
	public List<Reply> selectBoardAlarmLimit10(Criteria cri, int gNo);
	
}
