package com.ko.domain;

public class Auth {
	private String userid;
	private String username;
	public Auth() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Auth(String userid, String username) {
		super();
		this.userid = userid;
		this.username = username;
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
	@Override
	public String toString() {
		return "LoginDTO [userid=" + userid + ", username=" + username + "]";
	}
	
	
}
