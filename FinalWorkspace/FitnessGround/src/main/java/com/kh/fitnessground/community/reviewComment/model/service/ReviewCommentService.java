package com.kh.fitnessground.community.reviewComment.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.community.qnaComment.model.vo.CommunityComment;

public interface ReviewCommentService {

	
	//댓글 불러오기
	 ArrayList<CommunityComment> communityCommentList(int mbc_no);
	//댓글 입력
	 void insertComment(int mb_no, int user_no, String content);
	//댓글 삭제
	 void deleteComment(int mbc_no, int mb_no, int user_no);
	//댓글 수정
	 void updateComment(int mb_no, int mbc_no, int user_no, String content);
}
