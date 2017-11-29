package com.kh.fitnessground.community.qnaBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;
import com.kh.fitnessground.community.qnaBoard.model.dao.QnABoardDao;

@Service("QnABoardService")
public class QnABoardServiceImpl implements QnABoardService{
	
	@Autowired
	QnABoardDao QnABoardDao;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<CommunityBoard> QnAListView(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int QnAInsert(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int QnADelete(int mb_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int QnAUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CommunityBoard QnADetail(int mb_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<CommunityBoard> QnASearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}
}
