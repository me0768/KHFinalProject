package com.kh.fitnessground.community.model.vo;

import java.sql.Date;

public class CommunityBoard {
	
	private int cb_no;			//게시글번호
	private int user_no;		//작성자
	private String name; // 작성자명
	private String title;		//게시글 제목
	private String content;		//게시글 내용
	private int board_property;	//게시판특성 0=후기 / 1=Q&A
	private Date upload_date;   //작성일자
	private int readcount;		//조회수	
	private String email;
	
	
	public CommunityBoard() {
		super();
	}


	public CommunityBoard(int cb_no, int user_no, String name, String title, String content, int board_property,
			Date upload_date, int readcount, String email) {
		super();
		this.cb_no = cb_no;
		this.user_no = user_no;
		this.name = name;
		this.title = title;
		this.content = content;
		this.board_property = board_property;
		this.upload_date = upload_date;
		this.readcount = readcount;
		this.email = email;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getCb_no() {
		return cb_no;
	}


	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getBoard_property() {
		return board_property;
	}


	public void setBoard_property(int board_property) {
		this.board_property = board_property;
	}


	public Date getUpload_date() {
		return upload_date;
	}


	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}


	public int getReadcount() {
		return readcount;
	}


	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}


	@Override
	public String toString() {
		return "CommunityBoard [cb_no=" + cb_no + ", user_no=" + user_no + ", name=" + name + ", title=" + title
				+ ", content=" + content + ", board_property=" + board_property + ", upload_date=" + upload_date
				+ ", readcount=" + readcount + "]";
	}
	
	
}

