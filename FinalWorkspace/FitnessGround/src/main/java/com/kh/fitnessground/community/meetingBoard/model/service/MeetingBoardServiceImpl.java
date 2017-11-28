package com.kh.fitnessground.community.meetingBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.mainBoard.model.vo.MeetingBoard;
import com.kh.fitnessground.community.meetingBoard.model.dao.MeetingBoardDao;

@Service("MeetingBoardService")
public class MeetingBoardServiceImpl implements MeetingBoardService{
	@Autowired
	MeetingBoardDao MeetingBoardDao;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<MeetingBoard> MeetingListView(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int MeetingInsert(MeetingBoard meetingboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int MeetingDelete(int mb_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int MeetingUpdate(MeetingBoard meetingboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MeetingBoard MeetingDetail(int mb_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<MeetingBoard> MeetingSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
