package com.ko.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ko.domain.Area;
import com.ko.domain.Board;
import com.ko.domain.Reply;
import com.ko.persistence.BoardDao;
import com.ko.persistence.ContentDao;
import com.ko.persistence.ReplyDao;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDao dao;
	
	@Autowired
	ContentDao cDao;
	
	@Autowired
	ReplyDao rDao;
	
	@Transactional
	@Override
	public void insertBoard(Board board, ArrayList<Map<String, String>> imgNameList) {
		dao.insertBoard(board);
		cDao.insertContent(board,imgNameList);
	}

	@Override
	public List<Board> selectAll() {
		return dao.selectAll();
	}
	
	@Transactional
	@Override
	public List<Board> selectLimit10(int page) {
		List<Board> boards = dao.selectLimit10(page);
		
		for(int i=0; i<boards.size(); i++) {
			int bNo=boards.get(i).getbNo();
			boards.get(i).setReplys(rDao.selectReplyLimit5(bNo));
			boards.get(i).setReplyCount(rDao.selectReplyCount(bNo));
		}
		
		return boards;
	}

	@Override
	public List<Board> selectBygNoLimit24(int page, int gNo) {
		List<Board> boards = dao.selectBygNoLimit24(page,gNo);
		for(int i=0; i<boards.size(); i++) {
			int bNo=boards.get(i).getbNo();
			boards.get(i).setReplyCount(rDao.selectReplyCount(bNo));
		}
		
		return boards;
	}

	@Override
	public int selectBygNoBoardCount(int gNo) {
		return dao.selectBygNoBoardCount(gNo);
	}

	
}
