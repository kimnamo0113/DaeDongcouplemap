package com.ko.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ko.persistence.BoardDao;
@Repository
public class BoardServiceImpl {
	@Autowired
	BoardDao dao;
	
}
