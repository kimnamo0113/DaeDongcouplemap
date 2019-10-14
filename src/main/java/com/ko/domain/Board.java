package com.ko.domain;

import java.util.List;

public class Board {
	private int bNo;
	private Guest bGNo;
	private int mNo;
	private String bPlace;
	private String bTitle;
	private String bHash;
	private String bContents;
	private String bWritetime;
	private String bDelete;
	private String bFlag;
	private int bGood;
	private int replyCount;
	
	private List<Content> contents;
	private List<Guest> friendTags;
	private List<Reply> replys;
	private List<Like> likes;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int bNo, Guest bGNo, int mNo, String bPlace, String bTitle, String bHash, String bContents,
			String bWritetime, String bDelete, String bFlag, int bGood, int replyCount, List<Content> contents,
			List<Guest> friendTags, List<Reply> replys, List<Like> likes) {
		super();
		this.bNo = bNo;
		this.bGNo = bGNo;
		this.mNo = mNo;
		this.bPlace = bPlace;
		this.bTitle = bTitle;
		this.bHash = bHash;
		this.bContents = bContents;
		this.bWritetime = bWritetime;
		this.bDelete = bDelete;
		this.bFlag = bFlag;
		this.bGood = bGood;
		this.replyCount = replyCount;
		this.contents = contents;
		this.friendTags = friendTags;
		this.replys = replys;
		this.likes = likes;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public Guest getbGNo() {
		return bGNo;
	}
	public void setbGNo(Guest bGNo) {
		this.bGNo = bGNo;
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
	public String getbFlag() {
		return bFlag;
	}
	public void setbFlag(String bFlag) {
		this.bFlag = bFlag;
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
	public List<Guest> getFriendTags() {
		return friendTags;
	}
	public void setFriendTags(List<Guest> friendTags) {
		this.friendTags = friendTags;
	}
	public List<Reply> getReplys() {
		return replys;
	}
	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}
	public List<Like> getLikes() {
		return likes;
	}
	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}
	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bGNo=" + bGNo + ", mNo=" + mNo + ", bPlace=" + bPlace + ", bTitle=" + bTitle
				+ ", bHash=" + bHash + ", bContents=" + bContents + ", bWritetime=" + bWritetime + ", bDelete="
				+ bDelete + ", bFlag=" + bFlag + ", bGood=" + bGood + ", replyCount=" + replyCount + ", contents="
				+ contents + ", friendTags=" + friendTags + ", replys=" + replys + ", likes=" + likes + "]";
	}
	
	
}
