package com.kh.fitnessground.community.qnaBoard.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;

public interface QnABoardService {
	
	//게시글 갯수
		int getListCount();
		//목록
		ArrayList<CommunityBoard> QnAListView(int page, int limit);
		//등록
		int QnAInsert(CommunityBoard communityboard);
		//삭제
		int QnADelete(int mb_no);
		//수정
		int QnAUpdate(CommunityBoard communityboard);
		//디테일
		CommunityBoard QnADetail(int mb_no);
		//찾기
		ArrayList<CommunityBoard> QnASearch(int page, int limit,String findType, String searchKey);
		
}
