package com.ko.domain;

public class Content {
	private int cNo;
	private int bNo;
	private String cContents;
	private String cImage;
	public Content() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Content(int cNo, int bNo, String cContents, String cImage) {
		super();
		this.cNo = cNo;
		this.bNo = bNo;
		this.cContents = cContents;
		this.cImage = cImage;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getcContents() {
		return cContents;
	}
	public void setcContents(String cContents) {
		this.cContents = cContents;
	}
	public String getcImage() {
		return cImage;
	}
	public void setcImage(String cImage) {
		this.cImage = cImage;
	}
	@Override
	public String toString() {
		return "Content [cNo=" + cNo + ", bNo=" + bNo + ", cContents=" + cContents + ", cImage=" + cImage + "]";
	}

	
}
