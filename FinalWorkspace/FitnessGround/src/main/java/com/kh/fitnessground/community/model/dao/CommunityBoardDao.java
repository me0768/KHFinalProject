package com.kh.fitnessground.community.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.community.model.vo.CommunityBoard;
import com.kh.fitnessground.community.model.vo.CommunityComment;
import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.community.model.vo.MeetingCommnet;


@Repository("CommunityBoardDao")
public class CommunityBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//메인 게시판
	public ArrayList<MeetingBoard> meetingView() {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<CommunityBoard> communityView(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//운동같이해요 게시판-----------------------------------------------------------------------------------------------------------------
	public int listCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<MeetingBoard> meetingListView() {
		List<MeetingBoard> mlist = sqlSession.selectList("community.meetingListView");
		ArrayList<MeetingBoard> list = new ArrayList<MeetingBoard>(mlist);
		return list;
	}

	public int meetingInsert(MeetingBoard meetingboard) {
		int result = sqlSession.insert("community.insertMeeting",meetingboard);		
		return result;
	}

	public int meetingDelete(int no) {
		return sqlSession.delete("community.deleteMeeting", no);
	}

	public int meetingUpdate(int no) {
		// TODO Auto-generated method stub
		return sqlSession.update("community.updateMeeting", no);
	}

	public MeetingBoard meetingDetail(int no) {
		MeetingBoard meeting = sqlSession.selectOne("community.selectDetail", no);
		return meeting;
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
				
	}

	public void deleteMeetingComment(int mbc_no, int mb_no, int user_no) {
		// TODO Auto-generated method stub
		
	}

	public void updateMeetingComment(int mb_no, int mbc_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}
	
	//리뷰 게시판-------------------------------------------------------------------------------------------------------------------
	public ArrayList<CommunityBoard> reviewListView() {
		List<CommunityBoard> clist = sqlSession.selectList("community.reviewListView");
		ArrayList<CommunityBoard> list = new ArrayList<CommunityBoard>(clist);
		return list;
	}

	public int reviewInsert(CommunityBoard communityboard) {
		int result = sqlSession.insert("community.insertReview",communityboard);		
		return result;
	}

	public int reviewDelete(int no) {
		return sqlSession.delete("community.deleteReview", no);
	}

	public int reviewUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public CommunityBoard reviewDetail(int no) {
		CommunityBoard community = sqlSession.selectOne("community.reviewDetail", no);
		return community;
	}

	public ArrayList<CommunityBoard> reviewSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//리뷰 게시판 댓글-------------------------------------------------------------------------------------------------------
	
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
	
	//qna 게시판--------------------------------------------------------------------------------------
	
	public ArrayList<CommunityBoard> qnaListView() {
		List<CommunityBoard> clist = sqlSession.selectList("community.qnaListView");
		ArrayList<CommunityBoard> list = new ArrayList<CommunityBoard>(clist);
		return list;
	}
	
	public int qnaInsert(CommunityBoard communityboard) {
		int result = sqlSession.insert("community.insertQnA", communityboard);
		return result;
	}
	
	public int qnaDelete(int no) {
		return sqlSession.delete("community.deleteQnA", no);
	}

	public int qnaUpdate(CommunityBoard communityboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	public CommunityBoard qnadDetail(int no) {
		CommunityBoard community = sqlSession.selectOne("community.qnaDetail", no);
		return community;
	}

	public ArrayList<CommunityBoard> qnaSearch(int page, int limit, String findType, String searchKey) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//qna 게시판 댓글--------------------------------------------------------------------------------------------------
	
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
