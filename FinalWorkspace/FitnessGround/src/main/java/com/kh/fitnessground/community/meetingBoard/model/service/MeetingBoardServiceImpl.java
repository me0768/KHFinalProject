package com.kh.fitnessground.community.meetingBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.mainBoard.model.vo.MeetingBoard;
import com.kh.fitnessground.community.meetingBoard.model.dao.MeetingBoardDao;

@Service("MeetingBoardService")
public class MeetingBoardServiceImpl implements MeetingBoardService{
	@Autowired
	MeetingBoardDao meetingBoardDao;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return meetingBoardDao.listCount();
	}

	@Override
	public ArrayList<MeetingBoard> meetingListView(int page, int limit) {
		// TODO Auto-generated method stub
		return meetingBoardDao.meetingListView();
	}

	@Override
	public int meetingInsert(MeetingBoard meetingboard) {
		// TODO Auto-generated method stub
		return meetingBoardDao.meetingInsert(meetingboard);
	}

	@Override
	public int meetingDelete(int mb_no) {
		// TODO Auto-generated method stub
		return meetingBoardDao.meetingDelete(mb_no);
	}

	@Override
	public int meetingUpdate(MeetingBoard meetingboard) {
		// TODO Auto-generated method stub
		return meetingBoardDao.meetingUpdate(meetingboard);
	}

	@Override
	public MeetingBoard meetingDetail(int mb_no) {
		// TODO Auto-generated method stub
		return meetingBoardDao.meetingDetail(mb_no);
	}

	@Override
	public ArrayList<MeetingBoard> meetingSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return meetingSearch(page,limit,findType,searchKey);
	}
	
	
}
