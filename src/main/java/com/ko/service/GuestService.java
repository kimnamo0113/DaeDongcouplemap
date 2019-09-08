package com.ko.service;

import com.ko.domain.Guest;

public interface GuestService {
	public Guest selectById(String gId);
	public int selectIdCheck(String gId);
	public int selectEmailCheck(String gEmail);
}
