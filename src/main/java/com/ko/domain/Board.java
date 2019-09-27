package com.ko.domain;

import java.util.List;

public class Board {
	private int bNo;
	private int gNo;
	private int mNo;
	private String bPlace;
	private String bTitle;
	private String bHash;
	private String bContents;
	private String bWritetime;
	private String bDelete;
	private String bFlat;
	private int bGood;
	private int replyCount; 
	private List<Content> contents;
	private List<Reply> replys;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int bNo, int gNo, int mNo, String bPlace, String bTitle, String bHash, String bContents,
			String bWritetime, String bDelete, String bFlat, int bGood, int replyCount, List<Content> contents,
			List<Reply> replys) {
		super();
		this.bNo = bNo;
		this.gNo = gNo;
		this.mNo = mNo;
		this.bPlace = bPlace;
		this.bTitle = bTitle;
		this.bHash = bHash;
		this.bContents = bContents;
		this.bWritetime = bWritetime;
		this.bDelete = bDelete;
		this.bFlat = bFlat;
		this.bGood = bGood;
		this.replyCount = replyCount;
		this.contents = contents;
		this.replys = replys;
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
	public String getbHash() {
		return bHash;
	}
	public void setbHash(String bHash) {
		this.bHash = bHash;
	}
	public String getbContents() {
		return bContents;
	}
	public void setbContents(String bContents) {
		this.bContents = bContents;
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
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public List<Content> getContents() {
		return contents;
	}
	public void setContents(List<Content> contents) {
		this.contents = contents;
	}
	public List<Reply> getReplys() {
		return replys;
	}
	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}
	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", gNo=" + gNo + ", mNo=" + mNo + ", bPlace=" + bPlace + ", bTitle=" + bTitle
				+ ", bHash=" + bHash + ", bContents=" + bContents + ", bWritetime=" + bWritetime + ", bDelete="
				+ bDelete + ", bFlat=" + bFlat + ", bGood=" + bGood + ", replyCount=" + replyCount + ", contents="
				+ contents + ", replys=" + replys + "]";
	}
	
	
}
