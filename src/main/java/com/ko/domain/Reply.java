package com.ko.domain;

import java.util.Date;

public class Reply {
	private int rNo;
	private Board rBNo;
	private Guest rGNo;
	private Manager rMNo;
	
	private String rContent;
	private Date rWritetime;
	private int rDelete;
	private int rGood;
	private int rRead;
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reply(int rNo, Board rBNo, Guest rGNo, Manager rMNo, String rContent, Date rWritetime, int rDelete,
			int rGood, int rRead) {
		super();
		this.rNo = rNo;
		this.rBNo = rBNo;
		this.rGNo = rGNo;
		this.rMNo = rMNo;
		this.rContent = rContent;
		this.rWritetime = rWritetime;
		this.rDelete = rDelete;
		this.rGood = rGood;
		this.rRead = rRead;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public Board getrBNo() {
		return rBNo;
	}
	public void setrBNo(Board rBNo) {
		this.rBNo = rBNo;
	}
	public Guest getrGNo() {
		return rGNo;
	}
	public void setrGNo(Guest rGNo) {
		this.rGNo = rGNo;
	}
	public Manager getrMNo() {
		return rMNo;
	}
	public void setrMNo(Manager rMNo) {
		this.rMNo = rMNo;
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
	public int getrRead() {
		return rRead;
	}
	public void setrRead(int rRead) {
		this.rRead = rRead;
	}
	@Override
	public String toString() {
		return "Reply [rNo=" + rNo + ", rBNo=" + rBNo + ", rGNo=" + rGNo + ", rMNo=" + rMNo + ", rContent=" + rContent
				+ ", rWritetime=" + rWritetime + ", rDelete=" + rDelete + ", rGood=" + rGood + ", rRead=" + rRead + "]";
	}
	
	
	
}
