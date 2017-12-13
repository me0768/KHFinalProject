package com.kh.fitnessground.user.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UserSchedule implements Serializable {
	private static final long serialVersionUID = 1221L;
	
	private int s_no;
	private int v_no;
	private int user_no;
	private String title;
	private String url;
	private String content;
	private String title_content;
	private Date upload_date;
	private String category1;
	
	public UserSchedule() {
		super();
	}	
	public UserSchedule(int s_no, int v_no, int user_no, String title, String url, String content, String title_content,
			Date upload_date, String category1) {
		super();
		this.s_no = s_no;
		this.v_no = v_no;
		this.user_no = user_no;
		this.title = title;
		this.url = url;
		this.content = content;
		this.title_content = title_content;
		this.upload_date = upload_date;
		this.category1 = category1;
	}	
	public UserSchedule(int user_no, String content, Date upload_date) {
		super();
		this.user_no = user_no;
		this.content = content;
		this.upload_date = upload_date;
	}
	
	
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getTitle_content() {
		return title_content;
	}
	public void setTitle_content(String title_content) {
		this.title_content = title_content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
		return "s_no="+this.s_no+", v_no="+this.v_no+", user_no"+this.user_no+", content="+this.content+", date="+this.upload_date+", title="+this.title+", title_content="+this.title_content+", url="+this.url;
	}
}
