package com.kh.fitnessground.community.model.vo;
import java.sql.Date;

public class CommunityComment {
	private int cbc_no;				//커뮤니티게시판 댓글 번호
	private int cb_no;				//커뮤니티게시글 번호
	private int user_no;			//작성자
	private String content;			//댓글 내용
	private Date upload_date;		//작성일자
	
	public CommunityComment() {
		super();
	}

	public CommunityComment(int cbc_no, int cb_no, int user_no, String content, Date upload_date) {
		super();
		this.cbc_no = cbc_no;
		this.cb_no = cb_no;
		this.user_no = user_no;
		this.content = content;
		this.upload_date = upload_date;
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

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	
	@Override
	public String toString(){
		return this.cbc_no + " , " + this.cb_no + " , " + this.user_no + " , " 
				+ this.content + " , " + this.upload_date;
	}
	
}

