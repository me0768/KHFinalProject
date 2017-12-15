package com.kh.fitnessground.community.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kh.fitnessground.community.model.vo.CommunityBoard;
import com.kh.fitnessground.community.model.vo.CommunityComment;
import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.community.model.vo.MeetingComment;

public interface CommunityBoardService {

	//메인화면 보드
		//운동같이해요 게시판 게시글 5개씩 보여주는 리스트
			ArrayList<MeetingBoard> meetingView();
			//리뷰 게시판 게시글 5개씩 보여주는 리스트
			ArrayList<CommunityBoard> reviewView();
			//qna게시판 게시글 5개씩 보여주는 리스트
			ArrayList<CommunityBoard> qnaView();
			
		//운동같이해요 게시판
			//게시글 조회수
			void meetingCount(int no, HttpServletRequest request);
			//목록
			ArrayList<MeetingBoard> meetingListView(int currentPage, int limit);
			//등록
			int meetingInsert(MeetingBoard meetingboard);
			//삭제
			int meetingDelete(int no);
			//수정페이지로 이동
			MeetingBoard meetingUpdate(int no);
			//수정하기완료
			int meetingUpdatePage(MeetingBoard meeting);
			//디테일
			MeetingBoard meetingDetail(int no);
			//찾기
			List<MeetingBoard>	meetingSearch(String searchOption, String searchKey);
			//게시글 갯수
			int getMeetingListCount();
		//운동같이해요 게시판 댓글
			//댓글 불러오기
			 List<MeetingComment> meetingCommentList(int mc_no);
			//댓글 입력
			 void insertMeetingComment(MeetingComment meetingComment);
			//댓글 삭제
			 void deleteMeetingComment(int mno);
			//댓글 수정
			 void updateMeetingComment(MeetingComment meetingComment);
		//리뷰 게시판
			//목록,검색
				List<CommunityBoard> reviewListView(int currentPage, int limit, String searchOption, String searchKey);
				//등록
				int reviewInsert(CommunityBoard communityboard);
				//삭제
				int reviewDelete(int no);
				//수정
				CommunityBoard reviewUpdate(int no);
				//수정 완료
				int reviewUpdatePage(CommunityBoard community);
				//디테일
				CommunityBoard reviewDetail(int no);
				//게시글 갯수
				int getReviewListCount();
			
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
				//게시글 조회수
					void communityCount(int no, HttpServletRequest request);
				//목록
					List<CommunityBoard> qnaListView(int currentPage, int limit, String searchOption, String searchKey);
					//등록
					int qnaInsert(CommunityBoard communityboard);
					//삭제
					int qnaDelete(int no);
					//수정
					CommunityBoard qnaUpdate(int no);
					//수정 완료
					int qnaUpdatePage(CommunityBoard community);
					//디테일
					CommunityBoard qnaDetail(int no);
					//게시글 갯수
					int getQnAListCount();
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
