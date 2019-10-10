package com.ko.service;

import com.ko.domain.Like;

public interface LikeService {
	public Like selectLikeByBNoGNo(int bNo,int gNo);

	public void insertLike(int bNo, int gNo);

	public void deleteLike(int bNo, int gNo);

	public int selectLikeAlarmCount(int gNo);

	public void updateLikeRead(int lNo,int read);

}
