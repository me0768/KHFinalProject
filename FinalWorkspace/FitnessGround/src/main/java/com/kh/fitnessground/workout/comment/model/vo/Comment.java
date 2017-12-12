package com.kh.fitnessground.workout.comment.model.vo;

import java.sql.Date;


public class Comment {
	private int vb_no;
	private int v_no;
	private int user_no;
	private String content;
	private String nickname;
	private String name;
	private Date reply_date;
	private String stringReplyDate;
	
	public Comment() {
		super();
	}

	public Comment(int vb_no, int v_no, int user_no, String content, String nickname, String name, Date reply_date) {
		super();
		this.vb_no = vb_no;
		this.v_no = v_no;
		this.user_no = user_no;
		this.content = content;
		this.nickname = nickname;
		this.name = name;
		this.reply_date = reply_date;
	}

	public int getVb_no() {
		return vb_no;
	}

	public void setVb_no(int vb_no) {
		this.vb_no = vb_no;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
	
	public String getStringReplyDate() {
		return stringReplyDate;
	}

	public void setStringReplyDate(String stringReplyDate) {
		this.stringReplyDate = stringReplyDate;
	}

	@Override
	public String toString() {
		return "Comment [vb_no=" + vb_no + ", v_no=" + v_no + ", user_no=" + user_no + ", content=" + content
				+ ", nickname=" + nickname + ", name=" + name + ", reply_date=" + reply_date + "]";
	}
	
		
		
	
	
	
}
