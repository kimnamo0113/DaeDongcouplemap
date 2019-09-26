package com.ko.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Board;

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
	public List<Board> selectLimit10(int i) {
		return sqlSession.selectList(namespace+".selectLimit10",i);
	}
	
	
}
