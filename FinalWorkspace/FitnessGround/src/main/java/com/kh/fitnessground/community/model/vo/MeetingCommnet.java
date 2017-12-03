package com.kh.fitnessground.community.model.vo;

import java.sql.Date;

public class MeetingCommnet {
	private int mbc_no; //게시판 댓글 번호
	private int mb_no; //운동 하자 게시글 번호
	private String content;	//댓글 내용
	private int user_no;	//작성자
	private Date Reply_date;	//작성일자
}
