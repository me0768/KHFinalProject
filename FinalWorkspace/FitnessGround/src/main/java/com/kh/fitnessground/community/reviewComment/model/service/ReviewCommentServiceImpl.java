package com.kh.fitnessground.community.reviewComment.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.qnaComment.model.vo.CommunityComment;
import com.kh.fitnessground.community.reviewComment.model.dao.ReviewCommentDao;

@Service("ReviewCommentService")
public class ReviewCommentServiceImpl implements ReviewCommentService{

	@Autowired
	ReviewCommentDao ReviewCommentDao;
	
	@Override
	public ArrayList<CommunityComment> communityCommentList(int mbc_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertComment(int mb_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComment(int mbc_no, int mb_no, int user_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComment(int mb_no, int mbc_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}

}
