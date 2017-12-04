package com.kh.fitnessground.community.reviewBoard.model.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;

@Repository("ReviewBoardDao")
public class ReviewBoardDao {

	public int ListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<CommunityBoard> reviewListView(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	public int reviewInsert(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int reviewDelete(int mb_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int reviewUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public CommunityBoard reviewDetail(int mb_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<CommunityBoard> reviewSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}

}
