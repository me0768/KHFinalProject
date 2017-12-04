package com.kh.fitnessground.community.qnaComment.model.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kh.fitnessground.community.qnaComment.model.vo.CommunityComment;

@Repository("QnACommentDao")
public class QnACommentDao {

	public ArrayList<CommunityComment> communityCommentList(int mbc_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insertComment(int mb_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}

	public void deleteComment(int mbc_no, int mb_no, int user_no) {
		// TODO Auto-generated method stub
		
	}

	public void updateComment(int mb_no, int mbc_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}

}
