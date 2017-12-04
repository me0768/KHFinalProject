package com.kh.fitnessground.community.mainBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.mainBoard.model.dao.MainBoardDao;
import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;
import com.kh.fitnessground.community.mainBoard.model.vo.MeetingBoard;

@Service("MainBoardService")
public class MainBoardServiceImpl implements MainBoardService {
	
	@Autowired
	MainBoardDao mainBoardDao;

	@Override
	public ArrayList<MeetingBoard> meetingView() {
		// TODO Auto-generated method stub
		return mainBoardDao.meetingView();
	}

	@Override
	public ArrayList<CommunityBoard> communityView(String keyword) {
		// TODO Auto-generated method stub
		return mainBoardDao.communityView(keyword);
	}
	
	
	
}
