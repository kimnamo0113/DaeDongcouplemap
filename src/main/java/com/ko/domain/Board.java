package com.ko.domain;

public class Board {
	private int bNo;
	private int gNo;
	private int mNo;
	private String bPlace;
	private String bTitle;
	private String bContent;
	private String bWritetime;
	private String bDelete;
	private String bFlat;
	private int bGood;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int bNo, int gNo, int mNo, String bPlace, String bTitle, String bContent, String bWritetime,
			String bDelete, String bFlat, int bGood) {
		super();
		this.bNo = bNo;
		this.gNo = gNo;
		this.mNo = mNo;
		this.bPlace = bPlace;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWritetime = bWritetime;
		this.bDelete = bDelete;
		this.bFlat = bFlat;
		this.bGood = bGood;
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
	public String getbPlace() {
		return bPlace;
	}
	public void setbPlace(String bPlace) {
		this.bPlace = bPlace;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbWritetime() {
		return bWritetime;
	}
	public void setbWritetime(String bWritetime) {
		this.bWritetime = bWritetime;
	}
	public String getbDelete() {
		return bDelete;
	}
	public void setbDelete(String bDelete) {
		this.bDelete = bDelete;
	}
	public String getbFlat() {
		return bFlat;
	}
	public void setbFlat(String bFlat) {
		this.bFlat = bFlat;
	}
	public int getbGood() {
		return bGood;
	}
	public void setbGood(int bGood) {
		this.bGood = bGood;
	}
	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", gNo=" + gNo + ", mNo=" + mNo + ", bPlace=" + bPlace + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", bWritetime=" + bWritetime + ", bDelete=" + bDelete + ", bFlat=" + bFlat
				+ ", bGood=" + bGood + "]";
	}
	
	
}
