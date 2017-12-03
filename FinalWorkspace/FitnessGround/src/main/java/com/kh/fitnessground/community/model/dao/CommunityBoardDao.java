package com.kh.fitnessground.community.model.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kh.fitnessground.community.model.vo.CommunityBoard;
import com.kh.fitnessground.community.model.vo.CommunityComment;
import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.community.model.vo.MeetingCommnet;


@Repository("CommunityBoardDao")
public class CommunityBoardDao {

	
	
	//메인 게시판
	public ArrayList<MeetingBoard> meetingView() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<CommunityBoard> communityView(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//운동같이해요 게시판
	public int listCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<MeetingBoard> meetingListView() {
		// TODO Auto-generated method stub
		return null;
	}

	public int meetingInsert(MeetingBoard meetingboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int meetingDelete(int mb_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int meetingUpdate(MeetingBoard meetingboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public MeetingBoard meetingDetail(int mb_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<MeetingBoard> meetingSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}

		
	//운동같이해요 게시판 댓글
	
	public ArrayList<MeetingCommnet> meetingCommentList(int mbc_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insertMeetingComment(int mb_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}

	public void deleteMeetingComment(int mbc_no, int mb_no, int user_no) {
		// TODO Auto-generated method stub
		
	}

	public void updateMeetingComment(int mb_no, int mbc_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}
	
	//리뷰 게시판
	public ArrayList<CommunityBoard> reviewListView(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	public int reviewInsert(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int reviewDelete(int mb_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int reviewUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public CommunityBoard reviewDetail(int mb_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<CommunityBoard> reviewSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//리뷰 게시판 댓글
	
	public ArrayList<CommunityComment> reviewCommentList(int mbc_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insertReviewComment(int mb_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}

	public void deleteReviewComment(int mbc_no, int mb_no, int user_no) {
		// TODO Auto-generated method stub
		
	}

	public void updateReviewComment(int mb_no, int mbc_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}
	
	//qna 게시판
	
	public int qnaInsert(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<CommunityBoard> qnaListView(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	public int qnaDelete(int mb_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int qnaUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public CommunityBoard qnadDetail(int mb_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<CommunityBoard> qnaSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//qna 게시판 댓글
	
	public ArrayList<CommunityComment> qnaCommentList(int mbc_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insertQnAComment(int mb_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}

	public void deleteQnAComment(int mbc_no, int mb_no, int user_no) {
		// TODO Auto-generated method stub
		
	}

	public void updateQnAComment(int mb_no, int mbc_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}
	
		
}
