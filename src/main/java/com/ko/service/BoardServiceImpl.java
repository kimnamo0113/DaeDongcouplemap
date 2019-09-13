package com.ko.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ko.persistence.BoardDao;

@Service
public class BoardServiceImpl {
	@Autowired
	BoardDao dao;
	
}
