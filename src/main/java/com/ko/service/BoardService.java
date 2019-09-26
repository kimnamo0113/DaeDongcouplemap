package com.ko.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ko.domain.Area;
import com.ko.domain.Board;

public interface BoardService {
	/*public void insertBoard(Board board, ArrayList<String> imgNameList, List<String> cContents);*/

	public void insertBoard(Board board, ArrayList<Map<String, String>> imgNameList);
	public List<Board> selectAll();
	public List<Board> selectLimit10(int i);
}
