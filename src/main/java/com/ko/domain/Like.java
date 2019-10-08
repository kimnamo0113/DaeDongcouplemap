package com.ko.domain;

import java.util.Date;

public class Like {
	private int lNo;
	private Board lBNo;
	private Guest lGNo;
	private Date lDate;
	private int lRead;
	public Like() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Like(int lNo, Board lBNo, Guest lGNo, Date lDate, int lRead) {
		super();
		this.lNo = lNo;
		this.lBNo = lBNo;
		this.lGNo = lGNo;
		this.lDate = lDate;
		this.lRead = lRead;
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
	public Date getlDate() {
		return lDate;
	}
	public void setlDate(Date lDate) {
		this.lDate = lDate;
	}
	public int getlRead() {
		return lRead;
	}
	public void setlRead(int lRead) {
		this.lRead = lRead;
	}
	@Override
	public String toString() {
		return "Like [lNo=" + lNo + ", lBNo=" + lBNo + ", lGNo=" + lGNo + ", lDate=" + lDate + ", lRead=" + lRead + "]";
	}
	
	
}
