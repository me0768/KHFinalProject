package com.kh.fitnessground.community.mainBoard.model.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;
import com.kh.fitnessground.community.mainBoard.model.vo.MeetingBoard;

@Repository("MainBoardDao")
public class MainBoardDao {

	public ArrayList<MeetingBoard> meetingView() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<CommunityBoard> communityView(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	
	//각 게시판 게시글 5개씩 보여주는 리스트 
}
