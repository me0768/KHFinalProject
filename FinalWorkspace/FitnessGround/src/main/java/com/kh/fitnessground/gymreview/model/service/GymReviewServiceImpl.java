package com.kh.fitnessground.gymreview.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.fitnessground.gymreview.model.vo.GymReview;

@Service("gymReviewService")
public class GymReviewServiceImpl implements GymReviewService{

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<GymReview> selectList(int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int enrollReview(GymReview gymreview) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int gcno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(int gcno, GymReview gymreview) {
		// TODO Auto-generated method stub
		return 0;
	}

}
