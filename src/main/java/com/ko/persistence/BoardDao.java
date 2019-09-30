package com.ko.persistence;

import java.util.List;

import com.ko.domain.Board;

public interface BoardDao {
	public void insertBoard(Board board);
	public List<Board> selectAll();
	public List<Board> selectLimit10(int i);
	public List<Board> selectBygNoLimit24(int page, int gNo);
	public int selectBygNoBoardCount(int gNo);
}
