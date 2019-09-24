package com.ko.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ko.domain.Board;

public interface ContentDao {

	void insertContent(Board board, ArrayList<Map<String, String>> imgNameList);
}
