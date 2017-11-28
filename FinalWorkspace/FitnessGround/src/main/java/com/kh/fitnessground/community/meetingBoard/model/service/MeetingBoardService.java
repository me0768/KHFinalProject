package com.kh.fitnessground.community.meetingBoard.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.community.mainBoard.model.vo.*;

public interface MeetingBoardService {
	
	//게시글 갯수
	int getListCount();
	//목록
	ArrayList<MeetingBoard> MeetingListView(int page, int limit);
	//등록
	int MeetingInsert(MeetingBoard meetingboard);
	//삭제
	int MeetingDelete(int mb_no);
	//수정
	int MeetingUpdate(MeetingBoard meetingboard);
	//디테일
	MeetingBoard MeetingDetail(int mb_no);
	//찾기
	ArrayList<MeetingBoard>	MeetingSearch(int page, int limit,String findType, String searchKey);
	
	
	
	
}
