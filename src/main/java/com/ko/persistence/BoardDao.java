package com.ko.persistence;

import java.util.List;

import com.ko.domain.Board;

public interface BoardDao {
	public void insertBoard(Board board);
	public List<Board> selectAll();
}
