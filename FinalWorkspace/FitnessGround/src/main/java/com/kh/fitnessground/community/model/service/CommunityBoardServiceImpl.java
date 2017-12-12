package com.kh.fitnessground.community.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.model.dao.CommunityBoardDao;
import com.kh.fitnessground.community.model.vo.CommunityBoard;
import com.kh.fitnessground.community.model.vo.CommunityComment;
import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.community.model.vo.MeetingComment;


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
	public ArrayList<CommunityBoard> reviewView() {
		// TODO Auto-generated method stub
		return communityBoardDao.reviewView();
	}
	@Override
	public ArrayList<CommunityBoard> qnaView() {
		// TODO Auto-generated method stub
		return communityBoardDao.qnaView();
	}
	
	
	//운동같이해요 게시판----------------------------------------------------------------------------------------------------
		
	@Override
	    public void meetingCount(int no, HttpServletRequest request) {
	       	communityBoardDao.meetingCount(no);
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
	public int meetingDelete(int no) {
		// TODO Auto-generated method stub
		return communityBoardDao.meetingDelete(no);
	}

	@Override
	public MeetingBoard meetingUpdate(int no) {
		return communityBoardDao.meetingUpdate(no);
	}
	@Override
	public int meetingUpdatePage(MeetingBoard meeting){
		return communityBoardDao.meetingUpdatePage(meeting);
	}


	@Override
	public MeetingBoard meetingDetail(int no) {
		// TODO Auto-generated method stub
		return communityBoardDao.meetingDetail(no);
	}

	@Override
	public List<MeetingBoard>	meetingSearch(String searchOption, String searchKey) {
		return communityBoardDao.meetingSearch(searchOption, searchKey);
	}
	
	@Override
	public int countOption(String searchOption, String searchKey){
		return communityBoardDao.countOption(searchOption, searchKey);
	}
	
	//운동같이해요 게시판 댓글 ------------------------------------------------------------------------

	 // 댓글 목록
    @Override
    public List<MeetingComment> meetingCommentList(int mno) {
        return communityBoardDao.meetingCommentList(mno);
    }
    // 댓글 작성
    @Override
    public void insertMeetingComment(MeetingComment meetingComment) {
        communityBoardDao.insertMeetingComment(meetingComment);
    }
    // 댓글 수정
    @Override
    public void updateMeetingComment(MeetingComment meetingComment) {
        // TODO Auto-generated method stub
 
    }
    // 댓글 삭제
    @Override
    public void deleteMeetingComment(int mno) {
        // TODO Auto-generated method stub
 
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
	public int reviewDelete(int no) {
		// TODO Auto-generated method stub
		return communityBoardDao.reviewDelete(no);
	}

	@Override
	public CommunityBoard reviewUpdate(int no) {
		return communityBoardDao.reviewUpdate(no);
	}
	@Override
	public int reviewUpdatePage(CommunityBoard community){
		return communityBoardDao.reviewUpdatePage(community);
	}
	
	@Override
	public CommunityBoard reviewDetail(int no) {
		// TODO Auto-generated method stub
		return communityBoardDao.reviewDetail(no);
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
	public void communityCount(int no, HttpServletRequest request){
		 communityBoardDao.communityCount(no);
	}
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
	public int qnaDelete(int no) {
		// TODO Auto-generated method stub
		return communityBoardDao.qnaDelete(no);
	}

	@Override
	public CommunityBoard qnaUpdate(int no) {
		// TODO Auto-generated method stub
		return communityBoardDao.qnaUpdate(no);
	}
	@Override
	public int qnaUpdatePage(CommunityBoard community){
		return communityBoardDao.qnaUpdatePage(community);
	}
	@Override
	public CommunityBoard qnaDetail(int no) {
		// TODO Auto-generated method stub
		return communityBoardDao.qnadDetail(no);
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
