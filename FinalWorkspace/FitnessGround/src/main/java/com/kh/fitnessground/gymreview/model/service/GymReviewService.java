package com.kh.fitnessground.gymreview.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.gymreview.model.vo.GymReview;

public interface GymReviewService {
	// 게시글 개수
	int getListCount();
	// 목록 가져오기
	ArrayList<GymReview> selectList(int limit);
	//등록
	int enrollReview(GymReview gymreview);
	//삭제
	int deleteReview(int gcno);
		//수정
	int updateReview(int gcno, GymReview gymreview);
	
}
