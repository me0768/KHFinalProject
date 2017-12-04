package com.kh.fitnessground.community.reviewBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;
import com.kh.fitnessground.community.reviewBoard.model.dao.ReviewBoardDao;

@Service("ReviewBoardService")
public class ReviewBoardServiceImpl implements ReviewBoardService {

	@Autowired
	ReviewBoardDao reviewBoardDao;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return reviewBoardDao.ListCount();
	}

	@Override
	public ArrayList<CommunityBoard> reviewListView(int page, int limit) {
		// TODO Auto-generated method stub
		return reviewBoardDao.reviewListView(page,limit);
	}

	@Override
	public int reviewInsert(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return reviewBoardDao.reviewInsert(communityboard);
	}

	@Override
	public int reviewDelete(int mb_no) {
		// TODO Auto-generated method stub
		return reviewBoardDao.reviewDelete(mb_no);
	}

	@Override
	public int reviewUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return reviewBoardDao.reviewUpdate(communityboard);
	}

	@Override
	public CommunityBoard reviewDetail(int mb_no) {
		// TODO Auto-generated method stub
		return reviewBoardDao.reviewDetail(mb_no);
	}

	@Override
	public ArrayList<CommunityBoard> reviewSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return reviewBoardDao.reviewSearch(page,limit,findType,searchKey);
	}
}
