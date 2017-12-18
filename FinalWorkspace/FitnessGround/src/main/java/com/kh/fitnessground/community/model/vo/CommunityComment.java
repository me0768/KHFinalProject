package com.kh.fitnessground.community.model.vo;
import java.sql.Date;

public class CommunityComment {
	private int cbc_no;				//커뮤니티게시판 댓글 번호
	private int cb_no;				//커뮤니티게시글 번호
	private int user_no;			//작성자
	private String content;			//댓글 내용
	private Date reply_date;		//작성일자
	private String name;
	public CommunityComment() {
		super();
	}
	public CommunityComment(int cbc_no, int cb_no, int user_no, String content, Date reply_date, String name) {
		super();
		this.cbc_no = cbc_no;
		this.cb_no = cb_no;
		this.user_no = user_no;
		this.content = content;
		this.reply_date = reply_date;
		this.name = name;
	}
	public int getCbc_no() {
		return cbc_no;
	}
	public void setCbc_no(int cbc_no) {
		this.cbc_no = cbc_no;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
		return "CommunityComment [cbc_no=" + cbc_no + ", cb_no=" + cb_no + ", user_no=" + user_no + ", content="
				+ content + ", reply_date=" + reply_date + ", name=" + name + "]";
	}
	
	
}

