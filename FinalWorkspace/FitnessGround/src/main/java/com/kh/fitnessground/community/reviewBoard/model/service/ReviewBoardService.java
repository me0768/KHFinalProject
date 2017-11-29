package com.kh.fitnessground.community.reviewBoard.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;

public interface ReviewBoardService {

	//게시글 갯수
	int getListCount();
	//목록
	ArrayList<CommunityBoard> ReviewlistView(int page, int limit);
	//등록
	int ReviewInsert(CommunityBoard communityboard);
	//삭제
	int ReviewDelete(int mb_no);
	//수정
	int ReviewUpdate(CommunityBoard communityboard);
	//디테일
	CommunityBoard ReviewDetail(int mb_no);
	//찾기
	ArrayList<CommunityBoard> ReviewSearch(int page, int limit,String findType, String searchKey);
	
}
