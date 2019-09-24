package com.ko.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.domain.Board;

@Repository
public class ContentDaoImpl implements ContentDao{

	private static final String namespace = "com.ko.mapper.ContentMapper";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insertContent(Board board, ArrayList<Map<String, String>> imgNameList) {
		Map<String, Object> map= new HashMap<String, Object>();
		
		map.put("bNo", board.getbNo());
		map.put("list", imgNameList);
		sqlSession.insert(namespace+".insertContent",map);
	}

}
