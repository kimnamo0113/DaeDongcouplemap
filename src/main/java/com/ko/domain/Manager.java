package com.ko.domain;

public class Manager {
	private int mNo;
	private String mId;
	private String mPassword;
	private String mName;
	public Manager() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Manager(int mNo, String mId, String mPassword, String mName) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPassword = mPassword;
		this.mName = mName;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	@Override
	public String toString() {
		return "Manager [mNo=" + mNo + ", mId=" + mId + ", mPassword=" + mPassword + ", mName=" + mName + "]";
	}
	
	
}
