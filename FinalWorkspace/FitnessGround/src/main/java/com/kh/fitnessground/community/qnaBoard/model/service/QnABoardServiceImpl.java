package com.kh.fitnessground.community.qnaBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;
import com.kh.fitnessground.community.qnaBoard.model.dao.QnABoardDao;

@Service("QnABoardService")
public class QnABoardServiceImpl implements QnABoardService{
	
	@Autowired
	QnABoardDao qnaBoardDao;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return qnaBoardDao.ListCount();
	}

	@Override
	public ArrayList<CommunityBoard> qnaListView(int page, int limit) {
		// TODO Auto-generated method stub
		return qnaBoardDao.qnaListView(page, limit);
	}

	@Override
	public int qnaInsert(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return qnaBoardDao.qnaInsert(communityboard);
	}

	@Override
	public int qnaDelete(int mb_no) {
		// TODO Auto-generated method stub
		return qnaBoardDao.qnaDelete(mb_no);
	}

	@Override
	public int qnaUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return qnaBoardDao.qnaUpdate(communityboard);
	}

	@Override
	public CommunityBoard qnaDetail(int mb_no) {
		// TODO Auto-generated method stub
		return qnaBoardDao.qnadDtail(mb_no);
	}

	@Override
	public ArrayList<CommunityBoard> qnaSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return qnaBoardDao.qnaSearch(page,limit,findType,searchKey);
	}
}
