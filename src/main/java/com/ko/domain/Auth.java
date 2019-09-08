package com.ko.domain;

public class Auth {
	private int aNo;
	private String aName;
	private String aId;
	private boolean aIsMgr; //1=관리자, 0=guest
	public Auth() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Auth(int aNo, String aName, String aId, boolean aIsMgr) {
		super();
		this.aNo = aNo;
		this.aName = aName;
		this.aId = aId;
		this.aIsMgr = aIsMgr;
	}
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public boolean isaIsMgr() {
		return aIsMgr;
	}
	public void setaIsMgr(boolean aIsMgr) {
		this.aIsMgr = aIsMgr;
	}
	@Override
	public String toString() {
		return "Auth [aNo=" + aNo + ", aName=" + aName + ", aId=" + aId + ", aIsMgr=" + aIsMgr + "]";
	}
	
	
}
