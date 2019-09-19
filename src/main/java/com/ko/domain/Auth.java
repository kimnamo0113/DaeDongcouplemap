package com.ko.domain;

public class Auth {
	private String userid;
	private String username;
	private String useremail;
	public Auth() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Auth(String userid, String username, String useremail) {
		super();
		this.userid = userid;
		this.username = username;
		this.useremail = useremail;
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
	@Override
	public String toString() {
		return "Auth [userid=" + userid + ", username=" + username + ", useremail=" + useremail + "]";
	}
	
	
	
}
