package com.ko.persistence;

import java.util.List;

import com.ko.domain.Criteria;
import com.ko.domain.Reply;
public interface ReplyDao {
	public void insertReply(Reply reply);
	public List<Reply> selectReplyLimit5(int bNo);
	public int selectReplyCount(int bNo);
	public List<Reply> selectPageByBNoPage(int bNo, Criteria cri);
}
