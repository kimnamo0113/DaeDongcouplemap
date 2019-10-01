package com.ko.persistence;

import com.ko.domain.Board;

public interface LikeDao {
	public int selectLikeCount(int bNo);

	public void insertLike(Board board);
}
