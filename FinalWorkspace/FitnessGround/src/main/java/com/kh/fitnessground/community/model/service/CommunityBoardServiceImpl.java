package com.kh.fitnessground.community.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.model.dao.CommunityBoardDao;
import com.kh.fitnessground.community.model.vo.CommunityBoard;
import com.kh.fitnessground.community.model.vo.CommunityComment;
import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.community.model.vo.MeetingCommnet;


@Service("CommunityBoardService")
public class CommunityBoardServiceImpl implements CommunityBoardService {

	@Autowired
	CommunityBoardDao communityBoardDao;

	//메인 화면
	@Override
	public ArrayList<MeetingBoard> meetingView() {
		// TODO Auto-generated method stub
		return communityBoardDao.meetingView();
	}

	@Override
	public ArrayList<CommunityBoard> communityView(String keyword) {
		// TODO Auto-generated method stub
		return communityBoardDao.communityView(keyword);
	}

	
	//운동같이해요 게시판----------------------------------------------------------------------------------------------------
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return communityBoardDao.listCount();
	}

	@Override
	public ArrayList<MeetingBoard> meetingListView() {
		// TODO Auto-generated method stub
		return communityBoardDao.meetingListView();
	}

	@Override
	public int meetingInsert(MeetingBoard meetingboard) {
		// TODO Auto-generated method stub
		return communityBoardDao.meetingInsert(meetingboard);
	}

	@Override
	public int meetingDelete(int mb_no) {
		// TODO Auto-generated method stub
		return communityBoardDao.meetingDelete(mb_no);
	}

	@Override
	public int meetingUpdate(MeetingBoard meetingboard) {
		// TODO Auto-generated method stub
		return communityBoardDao.meetingUpdate(meetingboard);
	}

	@Override
	public MeetingBoard meetingDetail(int no) {
		// TODO Auto-generated method stub
		return communityBoardDao.meetingDetail(no);
	}

	@Override
	public ArrayList<MeetingBoard> meetingSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return communityBoardDao.meetingSearch(page,limit,findType,searchKey);
	}
	//운동같이해요 게시판 댓글

	@Override
	public ArrayList<MeetingCommnet> meetingCommentList(int mbc_no) {
		// TODO Auto-generated method stub
		return communityBoardDao.meetingCommentList(mbc_no);
	}

	@Override
	public void insertMeetingComment(int mb_no, int user_no, String content) {
		// TODO Auto-generated method stub
		communityBoardDao.insertMeetingComment(mb_no, user_no, content);
	}

	@Override
	public void deleteMeetingComment(int mbc_no, int mb_no, int user_no) {
		// TODO Auto-generated method stub
		communityBoardDao.deleteMeetingComment(mbc_no, mb_no, user_no);
	}

	@Override
	public void updateMeetingComment(int mb_no, int mbc_no, int user_no, String content) {
		// TODO Auto-generated method stub
		communityBoardDao.updateMeetingComment(mb_no, mbc_no, user_no, content);
	}

	//리뷰 게시판---------------------------------------------------------------------------------------------------------------
	@Override
	public ArrayList<CommunityBoard> reviewListView() {
		return communityBoardDao.reviewListView();
	}

	@Override
	public int reviewInsert(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return communityBoardDao.reviewInsert(communityboard);
	}

	@Override
	public int reviewDelete(int mb_no) {
		// TODO Auto-generated method stub
		return communityBoardDao.reviewDelete(mb_no);
	}

	@Override
	public int reviewUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return communityBoardDao.reviewUpdate(communityboard);
	}

	@Override
	public CommunityBoard reviewDetail(int mb_no) {
		// TODO Auto-generated method stub
		return communityBoardDao.reviewDetail(mb_no);
	}

	@Override
	public ArrayList<CommunityBoard> reviewSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return communityBoardDao.reviewSearch(page, limit, findType, searchKey);
	}

	
	//리뷰게시판 댓글
	@Override
	public ArrayList<CommunityComment> reviewCommentList(int mbc_no) {
		// TODO Auto-generated method stub
		return communityBoardDao.reviewCommentList(mbc_no);
	}

	@Override
	public void insertReviewComment(int mb_no, int user_no, String content) {
		// TODO Auto-generated method stub
		communityBoardDao.insertReviewComment(mb_no, user_no, content);
	}

	@Override
	public void deleteReviewComment(int mbc_no, int mb_no, int user_no) {
		// TODO Auto-generated method stub
		communityBoardDao.deleteReviewComment(mbc_no, mb_no, user_no);
	}

	@Override
	public void updateReviewComment(int mb_no, int mbc_no, int user_no, String content) {
		// TODO Auto-generated method stub
		communityBoardDao.updateReviewComment(mb_no, mbc_no, user_no, content);
	}
	//qna 게시판---------------------------------------------------------------------------------------------------------
	@Override
	public ArrayList<CommunityBoard> qnaListView() {
		return communityBoardDao.qnaListView();
	}

	@Override
	public int qnaInsert(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return communityBoardDao.qnaInsert(communityboard);
	}

	@Override
	public int qnaDelete(int mb_no) {
		// TODO Auto-generated method stub
		return communityBoardDao.qnaDelete(mb_no);
	}

	@Override
	public int qnaUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return communityBoardDao.qnaUpdate(communityboard);
	}

	@Override
	public CommunityBoard qnaDetail(int mb_no) {
		// TODO Auto-generated method stub
		return communityBoardDao.qnadDetail(mb_no);
	}

	@Override
	public ArrayList<CommunityBoard> qnaSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return communityBoardDao.qnaSearch(page, limit, findType, searchKey);
	}
	//qna 게시판 댓글
	@Override
	public ArrayList<CommunityComment> qnaCommentList(int mbc_no) {
		// TODO Auto-generated method stub
		return communityBoardDao.qnaCommentList(mbc_no);
	}

	@Override
	public void insertQnAComment(int mb_no, int user_no, String content) {
		// TODO Auto-generated method stub
		communityBoardDao.insertQnAComment(mb_no, user_no, content);
	}

	@Override
	public void deleteQnAComment(int mbc_no, int mb_no, int user_no) {
		// TODO Auto-generated method stub
		communityBoardDao.deleteQnAComment(mbc_no, mb_no, user_no);
	}

	@Override
	public void updateQnAComment(int mb_no, int mbc_no, int user_no, String content) {
		// TODO Auto-generated method stub
		communityBoardDao.updateQnAComment(mb_no, mbc_no, user_no, content);
	}

	
}
