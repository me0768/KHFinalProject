package com.kh.fitnessground.community.model.vo;

import java.sql.Date;

public class CommunityAndMeeting implements Comparable<CommunityAndMeeting>{
	private int board_no; // 글번호
	private int category_no; // 카테고리, 0후기, 1qna, 2운동모임
	private int user_no; // 작성자
	private String title; // 제목
	private Date upload_date; // 작성일자
	
	public CommunityAndMeeting() {
		super();
		this.category_no = 2;
	}
	public CommunityAndMeeting(int board_no, int category_no, int user_no, String title, Date upload_date) {
		super();
		this.board_no = board_no;
		this.category_no = category_no;
		this.user_no = user_no;
		this.title = title;
		this.upload_date = upload_date;
	}
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	
	@Override
	public String toString() {
		return this.board_no + ", " + this.category_no + ", " + this.user_no + ", " + this.title + ", " + this.upload_date;
	}
	@Override
	public int compareTo(CommunityAndMeeting o) {
		int result = 0;
		if(upload_date.after(o.getUpload_date()))
			result = -1;
		else if(upload_date.before(o.getUpload_date()))
			result = 1;
		return result;
	}
}
