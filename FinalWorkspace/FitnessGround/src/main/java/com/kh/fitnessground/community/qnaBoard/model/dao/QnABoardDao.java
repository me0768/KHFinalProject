package com.kh.fitnessground.community.qnaBoard.model.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;

@Repository("QnABoardDao")
public class QnABoardDao {

	public int ListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int qnaInsert(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<CommunityBoard> qnaListView(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	public int qnaDelete(int mb_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int qnaUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public CommunityBoard qnadDtail(int mb_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<CommunityBoard> qnaSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}

}
