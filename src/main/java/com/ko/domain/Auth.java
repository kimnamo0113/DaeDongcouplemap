package com.ko.domain;

public class Auth {
	private int userno;
	private String userid;
	private String username;
	private String useremail;
	private String userimage;
	private int friendAlarm;
	public Auth() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Auth(int userno, String userid, String username, String useremail, String userimage, int friendAlarm) {
		super();
		this.userno = userno;
		this.userid = userid;
		this.username = username;
		this.useremail = useremail;
		this.userimage = userimage;
		this.friendAlarm = friendAlarm;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserimage() {
		return userimage;
	}
	public void setUserimage(String userimage) {
		this.userimage = userimage;
	}
	public int getFriendAlarm() {
		return friendAlarm;
	}
	public void setFriendAlarm(int friendAlarm) {
		this.friendAlarm = friendAlarm;
	}
	@Override
	public String toString() {
		return "Auth [userno=" + userno + ", userid=" + userid + ", username=" + username + ", useremail=" + useremail
				+ ", userimage=" + userimage + ", friendAlarm=" + friendAlarm + "]";
	}
	
	
	
	
}
