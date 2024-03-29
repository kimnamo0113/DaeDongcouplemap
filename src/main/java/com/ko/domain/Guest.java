package com.ko.domain;

import java.util.Date;

public class Guest {
	private int gNo;
	private String gId;
	private String gPassword;
	private String gName;
	private int gTel;
	private String gEmail;
	private Date gBirth;
	private Date gJoin;
	private String gMemo;
	private Boolean gGender;
	private int gDelete;
	private String gAddr;
	private String gAddr2;
	private String gAddr3;
	private String gImage;
	private String gCertification;
	public Guest() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Guest(int gNo) {
		super();
		this.gNo = gNo;
	}

	public Guest(int gNo, String gId, String gPassword, String gName, int gTel, String gEmail, Date gBirth, Date gJoin,
			String gMemo, Boolean gGender, int gDelete, String gAddr, String gAddr2, String gAddr3, String gImage,
			String gCertification) {
		super();
		this.gNo = gNo;
		this.gId = gId;
		this.gPassword = gPassword;
		this.gName = gName;
		this.gTel = gTel;
		this.gEmail = gEmail;
		this.gBirth = gBirth;
		this.gJoin = gJoin;
		this.gMemo = gMemo;
		this.gGender = gGender;
		this.gDelete = gDelete;
		this.gAddr = gAddr;
		this.gAddr2 = gAddr2;
		this.gAddr3 = gAddr3;
		this.gImage = gImage;
		this.gCertification = gCertification;
	}
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public String getgId() {
		return gId;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public String getgPassword() {
		return gPassword;
	}
	public void setgPassword(String gPassword) {
		this.gPassword = gPassword;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public int getgTel() {
		return gTel;
	}
	public void setgTel(int gTel) {
		this.gTel = gTel;
	}
	public String getgEmail() {
		return gEmail;
	}
	public void setgEmail(String gEmail) {
		this.gEmail = gEmail;
	}
	public Date getgBirth() {
		return gBirth;
	}
	public void setgBirth(Date gBirth) {
		this.gBirth = gBirth;
	}
	public Date getgJoin() {
		return gJoin;
	}
	public void setgJoin(Date gJoin) {
		this.gJoin = gJoin;
	}
	public String getgMemo() {
		return gMemo;
	}
	public void setgMemo(String gMemo) {
		this.gMemo = gMemo;
	}
	public Boolean getgGender() {
		return gGender;
	}
	public void setgGender(Boolean gGender) {
		this.gGender = gGender;
	}
	public int getgDelete() {
		return gDelete;
	}
	public void setgDelete(int gDelete) {
		this.gDelete = gDelete;
	}
	public String getgAddr() {
		return gAddr;
	}
	public void setgAddr(String gAddr) {
		this.gAddr = gAddr;
	}
	public String getgAddr2() {
		return gAddr2;
	}
	public void setgAddr2(String gAddr2) {
		this.gAddr2 = gAddr2;
	}
	public String getgAddr3() {
		return gAddr3;
	}
	public void setgAddr3(String gAddr3) {
		this.gAddr3 = gAddr3;
	}
	public String getgImage() {
		return gImage;
	}
	public void setgImage(String gImage) {
		this.gImage = gImage;
	}
	public String getgCertification() {
		return gCertification;
	}
	public void setgCertification(String gCertification) {
		this.gCertification = gCertification;
	}
	@Override
	public String toString() {
		return "Guest [gNo=" + gNo + ", gId=" + gId + ", gPassword=" + gPassword + ", gName=" + gName + ", gTel=" + gTel
				+ ", gEmail=" + gEmail + ", gBirth=" + gBirth + ", gJoin=" + gJoin + ", gMemo=" + gMemo + ", gGender="
				+ gGender + ", gDelete=" + gDelete + ", gAddr=" + gAddr + ", gAddr2=" + gAddr2 + ", gAddr3=" + gAddr3
				+ ", gImage=" + gImage + ", gCertification=" + gCertification + "]";
	}
	
	
	
}
