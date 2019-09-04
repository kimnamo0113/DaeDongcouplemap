package com.ko.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	
}
