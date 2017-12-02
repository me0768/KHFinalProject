package com.kh.fitnessground.community.qnaBoard.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.community.mainBoard.model.vo.CommunityBoard;

public interface QnABoardService {
	
	//게시글 갯수
		int getListCount();
		//목록
		ArrayList<CommunityBoard> qnaListView(int page, int limit);
		//등록
		int qnaInsert(CommunityBoard communityboard);
		//삭제
		int qnaDelete(int mb_no);
		//수정
		int qnaUpdate(CommunityBoard communityboard);
		//디테일
		CommunityBoard qnaDetail(int mb_no);
		//찾기
		ArrayList<CommunityBoard> qnaSearch(int page, int limit,String findType, String searchKey);
		
}
