package com.ko.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ko.domain.Area;
import com.ko.domain.Board;
import com.ko.persistence.BoardDao;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDao dao;

	@Override
	public void insertBoard(Board board) {
		dao.insertBoard(board);
	}
	
	
	
}
