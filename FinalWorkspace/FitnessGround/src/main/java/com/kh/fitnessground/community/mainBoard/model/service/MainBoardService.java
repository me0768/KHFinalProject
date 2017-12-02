package com.kh.fitnessground.community.mainBoard.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;
import com.kh.fitnessground.community.mainBoard.model.vo.MeetingBoard;

public interface MainBoardService {

	//운동같이해요 게시판 게시글 5개씩 보여주는 리스트
	ArrayList<MeetingBoard> meetingView();
	//리뷰, QnA 게시판 게시글 5개씩 보여주는 리스트
	ArrayList<CommunityBoard> communityView(String keyword);
}
