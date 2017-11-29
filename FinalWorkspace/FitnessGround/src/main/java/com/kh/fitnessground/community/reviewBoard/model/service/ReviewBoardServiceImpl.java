package com.kh.fitnessground.community.reviewBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;
import com.kh.fitnessground.community.reviewBoard.model.dao.ReviewBoardDao;

@Service("ReviewBoardService")
public class ReviewBoardServiceImpl implements ReviewBoardService {

	@Autowired
	ReviewBoardDao ReviewBoardDao;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<CommunityBoard> ReviewlistView(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int ReviewInsert(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ReviewDelete(int mb_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ReviewUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CommunityBoard ReviewDetail(int mb_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<CommunityBoard> ReviewSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}
}
