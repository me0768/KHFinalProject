package com.kh.fitnessground.user.model.vo;

import java.sql.Date;

public class User {
	private int user_no;
	private String email;
	private String pwd;
	private String name;
	private String nickname;
	private String phone;
	private int user_level;
	private Date delete_date;
	private int tmppwd_tf;
	private String original_image;
	private String rename_image;
	
	public User() {}

	public User(int user_no, String email, String pwd, String name, String nickname, String phone, int user_level,
			Date delete_date, int tmppwd_tf, String original_image, String rename_image) {
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
		this.original_image = original_image;
		this.rename_image = rename_image;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
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

	public String getOriginal_image() {
		return original_image;
	}

	public void setOriginal_image(String original_image) {
		this.original_image = original_image;
	}

	public String getRename_image() {
		return rename_image;
	}

	public void setRename_image(String rename_image) {
		this.rename_image = rename_image;
	}

	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", email=" + email + ", pwd=" + pwd + ", name=" + name + ", nickname="
				+ nickname + ", phone=" + phone + ", user_level=" + user_level + ", delete_date=" + delete_date
				+ ", tmppwd_tf=" + tmppwd_tf + ", original_image=" + original_image + ", rename_image=" + rename_image
				+ "]";
	}
}