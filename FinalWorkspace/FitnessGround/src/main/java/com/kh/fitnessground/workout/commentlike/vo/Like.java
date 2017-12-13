package com.kh.fitnessground.workout.commentlike.vo;

import java.sql.Date;

public class Like {
	private int v_no;
	private int user_no;
	private String category1;
	private String category2;
	private Date like_date;
	
	public Like() {
		super();
	}

	public int getV_no() {
		return v_no;
	}

	public void setV_no(int v_no) {
		this.v_no = v_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getCategory1() {
		return category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getCategory2() {
		return category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public Date getLike_date() {
		return like_date;
	}

	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}

	@Override
	public String toString() {
		return "Like [v_no=" + v_no + ", user_no=" + user_no + ", category1=" + category1 + ", category2=" + category2
				+ ", like_date=" + like_date + "]";
	}
	
	
	
	
}

