package com.ko.persistence;

import java.util.List;

import com.ko.domain.Board;
import com.ko.domain.Like;

public interface LikeDao {
	public int selectLikeCount(int bNo);

	public void insertLike(Board board);

	public Like selectLikeByBNoGNo(int bNo, int gNo);

	public void insertLike(int bNo, int gNo);

	public void deleteLike(int bNo, int gNo);

	public int selectLikeAlarmCount(int gNo);

	public List<Like> selectLikeList(int gNo);
}
