package com.kh.fitnessground.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.community.model.vo.CommunityBoard;
import com.kh.fitnessground.community.model.vo.CommunityComment;
import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.community.model.vo.MeetingComment;


@Repository("CommunityBoardDao")
public class CommunityBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//메인 게시판
	public ArrayList<MeetingBoard> meetingView() {
		List<MeetingBoard> mblist = sqlSession.selectList("community.meetingView");
		ArrayList<MeetingBoard> mlist = new ArrayList<MeetingBoard>(mblist);
		return mlist;
	}

	public ArrayList<CommunityBoard> reviewView() {
		List<CommunityBoard> rblist = sqlSession.selectList("community.reviewView");
		ArrayList<CommunityBoard> rlist = new ArrayList<CommunityBoard>(rblist);
		return rlist;
	}
	public ArrayList<CommunityBoard> qnaView() {
		List<CommunityBoard> qblist = sqlSession.selectList("community.qnaView");
		ArrayList<CommunityBoard> qlist = new ArrayList<CommunityBoard>(qblist);
		return qlist;
	}
	
	
	//운동같이해요 게시판-----------------------------------------------------------------------------------------------------------------
	
	public void meetingCount(int no) {
		sqlSession.update("community.meetingCount", no);
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

	//수정하기 페이지로 이동
		public MeetingBoard meetingUpdate(int no) {
			MeetingBoard meeting = sqlSession.selectOne("community.updateMeeting", no);
			return meeting;
		}
		//수정하기 완룡 ㅎㅎ
		public int meetingUpdatePage(MeetingBoard meetingBoard) {
			int result = sqlSession.update("community.updateMeetingPage", meetingBoard);
			System.out.println(result);
			return result;
		}
		

	public MeetingBoard meetingDetail(int no) {
		MeetingBoard meeting = sqlSession.selectOne("community.selectDetail", no);
		return meeting;
	}

	public List<MeetingBoard> meetingSearch(String searchOption, String searchKey) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("searchKey", searchKey);
		
		return sqlSession.selectList("community.searchList",map);
	}
	
	public int countOption(String searchOption, String searchKey){
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("searchKey", searchKey);
		return sqlSession.selectOne("community.countOption",map);
	}

		
	//운동같이해요 게시판 댓글-----------------------------------------------------------------------
	// 댓글 목록
 
    public List<MeetingComment> meetingCommentList(int mno) {
        return sqlSession.selectList("community.meetingCommentList", mno);
    }
    // 댓글 작성
   
    public void insertMeetingComment(MeetingComment meetingComment) {
        sqlSession.insert("community.insertMeetingComment", meetingComment);
    }
    // 댓글 수정
   
    public void updateMeetingComment(MeetingComment meetingComment) {
        // TODO Auto-generated method stub
 
    }
    // 댓글 삭제
   
    public void deleteMeetingComment(int mno) {
        // TODO Auto-generated method stub
 
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

	public CommunityBoard reviewUpdate(int no) {
		CommunityBoard community= sqlSession.selectOne("community.updateReview", no);
		return community;
	}
	public int reviewUpdatePage(CommunityBoard community) {
		int result = sqlSession.update("community.updateReviewPage", community);
		System.out.println(result);
		return result;
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
	
	public void communityCount(int no) {
		sqlSession.update("community.communityCount", no);
    }
	
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

	public CommunityBoard qnaUpdate(int no) {
		CommunityBoard community= sqlSession.selectOne("community.updateQnA", no);
		return community;
	}
	public int qnaUpdatePage(CommunityBoard community) {
		int result = sqlSession.update("community.updateQnAPage", community);
		System.out.println(result);
		return result;
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
