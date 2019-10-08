package com.ko.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ko.domain.Board;
import com.ko.domain.Like;
import com.ko.persistence.BoardDao;
import com.ko.persistence.LikeDao;

@Service
public class LikeServiceImpl implements LikeService{
	@Autowired
	LikeDao dao;
	
	@Autowired
	BoardDao bDao;
	
	@Override
	public Like selectLikeByBNoGNo(int bNo, int gNo) {
		return dao.selectLikeByBNoGNo(bNo,gNo);
	}

	@Override
	public void insertLike(int bNo, int gNo) {
		dao.insertLike(bNo,gNo);
		Board board = bDao.selectByBNo(bNo);
		board.setbGood(board.getbGood()+1);
		bDao.updateBoard(board);
	}

	@Override
	public void deleteLike(int bNo, int gNo) {
		dao.deleteLike(bNo,gNo);
		Board board = bDao.selectByBNo(bNo);
		board.setbGood(board.getbGood()-1);
		bDao.updateBoard(board);
	}

	@Override
	public int selectLikeAlarmCount(int gNo) {
		return dao.selectLikeAlarmCount(gNo);
	}

}
