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
		System.out.println(board);
		cDao.insertContent(board,imgNameList);
	}

	@Override
	public List<Board> selectAll() {
		return dao.selectAll();
	}
	
	@Transactional
	@Override
	public List<Board> selectLimit10(int i) {
		List<Board> boards = dao.selectLimit10(i);
		
		for(int j=0; j<boards.size(); j++) {
			int bNo=boards.get(j).getbNo();
			boards.get(j).setReplys(rDao.selectBoardLimit10(bNo));
			boards.get(j).setReplyCount(rDao.selectReplyCount(bNo));
		}
		
		return boards;
	}

	
}
