package com.kh.fitnessground.community.meetingBoard.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.community.mainBoard.model.vo.*;

public interface MeetingBoardService {
	
	//게시글 갯수
	int getListCount();
	//목록
	ArrayList<MeetingBoard> meetingListView(int page, int limit);
	//등록
	int meetingInsert(MeetingBoard meetingboard);
	//삭제
	int meetingDelete(int mb_no);
	//수정
	int meetingUpdate(MeetingBoard meetingboard);
	//디테일
	MeetingBoard meetingDetail(int mb_no);
	//찾기
	ArrayList<MeetingBoard>	meetingSearch(int page, int limit,String findType, String searchKey);
	
	
	
	
}
