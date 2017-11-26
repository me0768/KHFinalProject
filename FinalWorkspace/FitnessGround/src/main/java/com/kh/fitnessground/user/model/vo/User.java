package com.kh.fitnessground.user.model.vo;

import java.sql.Date;

public class User {
	private int user_no;
	private String email;
	private String pwd;
	private String name;
	private String nickname;
	private int phone;
	private int user_level;
	private Date delete_date;
	private int tmppwd_tf;
	
	public User() {}

	public User(int user_no, String email, String pwd, String name, String nickname, int phone, int user_level,
			Date delete_date, int tmppwd_tf) {
		super();
		this.user_no = user_no;
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.user_level = user_level;
		this.delete_date = delete_date;
		this.tmppwd_tf = tmppwd_tf;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getUser_level() {
		return user_level;
	}

	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}

	public Date getDelete_date() {
		return delete_date;
	}

	public void setDelete_date(Date delete_date) {
		this.delete_date = delete_date;
	}

	public int getTmppwd_tf() {
		return tmppwd_tf;
	}

	public void setTmppwd_tf(int tmppwd_tf) {
		this.tmppwd_tf = tmppwd_tf;
	}

	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", email=" + email + ", pwd=" + pwd + ", name=" + name + ", nickname="
				+ nickname + ", phone=" + phone + ", user_level=" + user_level + ", delete_date=" + delete_date
				+ ", tmppwd_tf=" + tmppwd_tf + "]";
	}	
}
