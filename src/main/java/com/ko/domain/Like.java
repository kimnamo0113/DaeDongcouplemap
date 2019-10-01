package com.ko.domain;

public class Like {
	private int lNo;
	private Board lBNo;
	private Guest lGNo;
	public Like() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Like(int lNo, Board lBNo, Guest lGNo) {
		super();
		this.lNo = lNo;
		this.lBNo = lBNo;
		this.lGNo = lGNo;
	}
	public int getlNo() {
		return lNo;
	}
	public void setlNo(int lNo) {
		this.lNo = lNo;
	}
	public Board getlBNo() {
		return lBNo;
	}
	public void setlBNo(Board lBNo) {
		this.lBNo = lBNo;
	}
	public Guest getlGNo() {
		return lGNo;
	}
	public void setlGNo(Guest lGNo) {
		this.lGNo = lGNo;
	}
	@Override
	public String toString() {
		return "Like [lNo=" + lNo + ", lBNo=" + lBNo + ", lGNo=" + lGNo + "]";
	}
	
	
}
