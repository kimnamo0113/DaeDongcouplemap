package com.ko.service;

import java.util.List;

import com.ko.domain.Like;

public interface LikeService {
	public Like selectLikeByBNoGNo(int bNo,int gNo);

	public void insertLike(int bNo, int gNo);

	public void deleteLike(int bNo, int gNo);

	public int selectLikeAlarmCount(int gNo);

	public List<Like> selectLikeList(int gNo);
}
