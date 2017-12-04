package com.kh.fitnessground.community.meetingBoard.model.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kh.fitnessground.community.mainBoard.model.vo.MeetingBoard;

@Repository("MeetingBoardDao")
public class MeetingBoardDao {

	public int listCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<MeetingBoard> meetingListView() {
		// TODO Auto-generated method stub
		return null;
	}

	public int meetingInsert(MeetingBoard meetingboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int meetingDelete(int mb_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int meetingUpdate(MeetingBoard meetingboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public MeetingBoard meetingDetail(int mb_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<MeetingBoard> meetingSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
