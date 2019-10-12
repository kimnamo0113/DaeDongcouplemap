package com.ko.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ko.domain.Board;
import com.ko.domain.Criteria;
import com.ko.domain.SearchCriteria;

public interface BoardService {
	/*public void insertBoard(Board board, ArrayList<String> imgNameList, List<String> cContents);*/

	public int selectBygNoBoardCount(int gNo);
	public void insertBoard(Board board, ArrayList<Map<String, String>> imgNameList);
	public List<Board> selectAll();
	public List<Board> selectLimit10(SearchCriteria cri);
	public List<Board> selectBygNoLimit24(int page, int gNo);
	public Board selectBNoReplyLimit10(int bNo, Criteria cri);
	public Board selectByBNo(int bNo);
	public List<Board> selectActivityLimit10(int gNo, Criteria cri);
	public int selectActivityCount(int gNo);
}
