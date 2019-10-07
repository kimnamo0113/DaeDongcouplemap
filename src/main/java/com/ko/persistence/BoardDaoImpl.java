package com.ko.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Board;
import com.ko.domain.SearchCriteria;

@Repository
public class BoardDaoImpl implements BoardDao{
	private static final String namespace = "com.ko.mapper.BoardMapper";
	
	
	
//	/*싱글톤 처리를 빈에 등록하고 autowired해서 받아오면됨*/
//	private static BoardDaoImpl instance = new BoardDaoImpl();
//	private BoardDaoImpl() {}
//	public static BoardDaoImpl getInstance() {
//		return instance;
//	}
	
	@Autowired
	SqlSession sqlSession;


	@Override
	public void insertBoard(Board board) {
		sqlSession.insert(namespace+".insertBoard",board);
	}


	@Override
	public List<Board> selectAll() {
		return sqlSession.selectList(namespace+".selectAll");
	}


	@Override
	public List<Board> selectLimit10(SearchCriteria cri) {
		return sqlSession.selectList(namespace+".selectLimit10",cri);
	}


	@Override
	public List<Board> selectBygNoLimit24(int page, int gNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("gNo", gNo);
		return sqlSession.selectList(namespace+".selectBygNoLimit24",map);
	}


	@Override
	public int selectBygNoBoardCount(int gNo) {
		return sqlSession.selectOne(namespace+".selectBygNoBoardCount",gNo);
	}


	@Override
	public Board selectByBNo(int bNo) {
		return sqlSession.selectOne(namespace+".selectByBNo",bNo);
	}


	@Override
	public void updateBoard(Board board) {
		sqlSession.update(namespace+".updateBoard",board);
	}
	
	
}
