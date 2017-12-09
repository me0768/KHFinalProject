package com.kh.fitnessground.community.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.community.model.vo.CommunityBoard;
import com.kh.fitnessground.community.model.vo.CommunityComment;
import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.community.model.vo.MeetingCommnet;

public interface CommunityBoardService {

	//메인화면 보드
		//운동같이해요 게시판 게시글 5개씩 보여주는 리스트
			ArrayList<MeetingBoard> meetingView();
			//리뷰, QnA 게시판 게시글 5개씩 보여주는 리스트
			ArrayList<CommunityBoard> communityView(String keyword);
		//운동같이해요 게시판
			//게시글 갯수
			int getListCount();
			//목록
			ArrayList<MeetingBoard> meetingListView();
			//등록
			int meetingInsert(MeetingBoard meetingboard);
			//삭제
			int meetingDelete(int mb_no);
			//수정
			int meetingUpdate(MeetingBoard meetingboard);
			//디테일
			MeetingBoard meetingDetail(int no);
			//찾기
			ArrayList<MeetingBoard>	meetingSearch(int page, int limit,String findType, String searchKey);
			
		//운동같이해요 게시판 댓글
			//댓글 불러오기
			 ArrayList<MeetingCommnet> meetingCommentList(int mbc_no);
			//댓글 입력
			 void insertMeetingComment(int mb_no, int user_no, String content);
			//댓글 삭제
			 void deleteMeetingComment(int mbc_no, int mb_no, int user_no);
			//댓글 수정
			 void updateMeetingComment(int mb_no, int mbc_no, int user_no, String content);
		//리뷰 게시판
			//목록
				ArrayList<CommunityBoard> reviewListView();
				//등록
				int reviewInsert(CommunityBoard communityboard);
				//삭제
				int reviewDelete(int mb_no);
				//수정
				int reviewUpdate(CommunityBoard communityboard);
				//디테일
				CommunityBoard reviewDetail(int no);
				//찾기
				ArrayList<CommunityBoard> reviewSearch(int page, int limit,String findType, String searchKey);
			
		//리뷰 게시판 댓글
				//댓글 불러오기
				 ArrayList<CommunityComment> reviewCommentList(int mbc_no);
				//댓글 입력
				 void insertReviewComment(int mb_no, int user_no, String content);
				//댓글 삭제
				 void deleteReviewComment(int mbc_no, int mb_no, int user_no);
				//댓글 수정
				 void updateReviewComment(int mb_no, int mbc_no, int user_no, String content);
			
		//qna 게시판
				//목록
					ArrayList<CommunityBoard> qnaListView();
					//등록
					int qnaInsert(CommunityBoard communityboard);
					//삭제
					int qnaDelete(int mb_no);
					//수정
					int qnaUpdate(CommunityBoard communityboard);
					//디테일
					CommunityBoard qnaDetail(int no);
					//찾기
					ArrayList<CommunityBoard> qnaSearch(int page, int limit,String findType, String searchKey);
			
		//qna 게시판 댓글	
					//댓글 불러오기
					 ArrayList<CommunityComment> qnaCommentList(int mbc_no);
					//댓글 입력
					 void insertQnAComment(int mb_no, int user_no, String content);
					//댓글 삭제
					 void deleteQnAComment(int mbc_no, int mb_no, int user_no);
					//댓글 수정
					 void updateQnAComment(int mb_no, int mbc_no, int user_no, String content);
}
