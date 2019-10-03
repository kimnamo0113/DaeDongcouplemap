package com.ko.domain;

import java.util.Date;

public class Friend {
	private int fNo;
	private Guest follow;
	private Guest follower;
	private Date fDate;
	private Boolean fRead;
	public Friend() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Friend(int fNo, Guest follow, Guest follower, Date fDate, Boolean fRead) {
		super();
		this.fNo = fNo;
		this.follow = follow;
		this.follower = follower;
		this.fDate = fDate;
		this.fRead = fRead;
	}
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public Guest getFollow() {
		return follow;
	}
	public void setFollow(Guest follow) {
		this.follow = follow;
	}
	public Guest getFollower() {
		return follower;
	}
	public void setFollower(Guest follower) {
		this.follower = follower;
	}
	public Date getfDate() {
		return fDate;
	}
	public void setfDate(Date fDate) {
		this.fDate = fDate;
	}
	public Boolean getfRead() {
		return fRead;
	}
	public void setfRead(Boolean fRead) {
		this.fRead = fRead;
	}
	@Override
	public String toString() {
		return "Friend [fNo=" + fNo + ", follow=" + follow + ", follower=" + follower + ", fDate=" + fDate + ", fRead="
				+ fRead + "]";
	}
	
	
	
	
}
