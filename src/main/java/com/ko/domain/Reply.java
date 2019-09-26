package com.ko.domain;

import java.util.Date;

public class Reply {
	private int rNo;
	private int bNo;
	private int gNo;
	private int mNo;
	
	private String rContent;
	private Date rWritetime;
	private int rDelete;
	private int rGood;
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reply(int rNo, int bNo, int gNo, int mNo, String rContent, Date rWritetime, int rDelete, int rGood) {
		super();
		this.rNo = rNo;
		this.bNo = bNo;
		this.gNo = gNo;
		this.mNo = mNo;
		this.rContent = rContent;
		this.rWritetime = rWritetime;
		this.rDelete = rDelete;
		this.rGood = rGood;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public Date getrWritetime() {
		return rWritetime;
	}
	public void setrWritetime(Date rWritetime) {
		this.rWritetime = rWritetime;
	}
	public int getrDelete() {
		return rDelete;
	}
	public void setrDelete(int rDelete) {
		this.rDelete = rDelete;
	}
	public int getrGood() {
		return rGood;
	}
	public void setrGood(int rGood) {
		this.rGood = rGood;
	}
	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", bNo=" + bNo + ", gNo=" + gNo + ", mNo=" + mNo + ", rContent=" + rContent
				+ ", rWritetime=" + rWritetime + ", rDelete=" + rDelete + ", rGood=" + rGood + "]";
	}
	
	
	
}
