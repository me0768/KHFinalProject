package com.kh.fitnessground.user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UserSchedule implements Serializable {
	private static final long serialVersionUID = 1221L;
	
	private int s_no;
	private int v_no;
	private int user_no;
	private String content;
	private Date upload_date;
	
	public UserSchedule() {
		super();
	}
	public UserSchedule(int s_no, int v_no, int user_no, String content, Date upload_date) {
		super();
		this.s_no = s_no;
		this.v_no = v_no;
		this.user_no = user_no;
		this.content = content;
		this.upload_date = upload_date;
	}
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	
	@Override
	public String toString() {
		return this.s_no+", "+this.v_no+", "+this.user_no+", "+this.content+", "+this.upload_date;
	}
}
