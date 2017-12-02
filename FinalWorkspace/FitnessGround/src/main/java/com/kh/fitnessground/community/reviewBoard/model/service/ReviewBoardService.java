package com.kh.fitnessground.community.reviewBoard.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;

public interface ReviewBoardService {

	//게시글 갯수
	int getListCount();
	//목록
	ArrayList<CommunityBoard> reviewListView(int page, int limit);
	//등록
	int reviewInsert(CommunityBoard communityboard);
	//삭제
	int reviewDelete(int mb_no);
	//수정
	int reviewUpdate(CommunityBoard communityboard);
	//디테일
	CommunityBoard reviewDetail(int mb_no);
	//찾기
	ArrayList<CommunityBoard> reviewSearch(int page, int limit,String findType, String searchKey);
	
}
