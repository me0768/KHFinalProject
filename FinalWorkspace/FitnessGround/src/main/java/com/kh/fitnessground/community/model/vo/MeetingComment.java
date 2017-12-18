package com.kh.fitnessground.community.model.vo;

import java.sql.Date;

public class MeetingComment {
	private int mbc_no; //게시판 댓글 번호
	private int mb_no; //운동 하자 게시글 번호
	private String content;	//댓글 내용
	private int user_no;	//작성자
	private Date reply_date;	//작성일자
	private String name; //작성자
		
	public MeetingComment() {
		super();
	}

	public MeetingComment(int mbc_no, int mb_no, String content, int user_no, Date reply_date, String name) {
		super();
		this.mbc_no = mbc_no;
		this.mb_no = mb_no;
		this.content = content;
		this.user_no = user_no;
		this.reply_date = reply_date;
		this.name = name;
	}

	public int getMbc_no() {
		return mbc_no;
	}

	public void setMbc_no(int mbc_no) {
		this.mbc_no = mbc_no;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "MeetingComment [mbc_no=" + mbc_no + ", mb_no=" + mb_no + ", content=" + content + ", user_no=" + user_no
				+ ", Reply_date=" + reply_date + ", name=" + name + "]";
	}
	

	
	
}
