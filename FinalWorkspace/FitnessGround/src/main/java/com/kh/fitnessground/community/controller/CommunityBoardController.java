package com.kh.fitnessground.community.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.community.model.service.CommunityBoardService;
import com.kh.fitnessground.community.model.vo.CommunityBoard;
import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.community.model.vo.MeetingComment;
@Controller
public class CommunityBoardController {
	@Autowired
	private CommunityBoardService communityBoardService;
	//리스트
		@RequestMapping(value = "community.do", method = RequestMethod.GET)
		public ModelAndView communityBoard(HttpServletRequest request){
				ModelAndView mv = new ModelAndView("community/communityMain");
				ArrayList<MeetingBoard> mlist = communityBoardService.meetingView();
				ArrayList<CommunityBoard> rlist = communityBoardService.reviewView();
				ArrayList<CommunityBoard> qlist = communityBoardService.qnaView();
				mv.addObject("mlist", mlist);
				mv.addObject("rlist", rlist);
				mv.addObject("qlist", qlist);
				return mv;
		}
		
	//운동같이해요 게시판----------------------------------------------------------------------------------------------------
				//리스트
				@RequestMapping(value = "meeting.do", method = RequestMethod.GET)
				public ModelAndView meetingBoard(HttpServletRequest request) {
					ModelAndView mv = new ModelAndView("community/meetingBoard/meetingBoard");
					ArrayList<MeetingBoard> list = communityBoardService.meetingListView();
					mv.addObject("list", list);
					return mv;
				}
				//글쓰기페이지 이동
				@RequestMapping(value ="meetingInsert.do", method = RequestMethod.GET)
				public String meetingInsert() {
					return "community/meetingBoard/meetingInsert";
				}
				//글쓰기페이지 저장
				@RequestMapping(value ="meetingInsert.do", method = RequestMethod.POST)
				public String meetingInsertPage(MeetingBoard meeting) {
					System.out.println(meeting);
					int result = communityBoardService.meetingInsert(meeting);
					//1이상 result 값이면 리스트로이동 
					if(result>0){
						return "redirect:/meeting.do";
					}else{
						return "community/meetingBoard/error";
					}
				}
				//디테일
				@RequestMapping(value="meetingDetail.do", method = RequestMethod.GET)
				public ModelAndView meetingDetail(@RequestParam(value="no") int no, HttpServletRequest request) {
					//조회수 증가 처리
					communityBoardService.meetingCount(no, request);
					
					ModelAndView mv = new ModelAndView("community/meetingBoard/meetingDetail");
					MeetingBoard meeting = communityBoardService.meetingDetail(no);
					mv.addObject("meeting", meeting);
					return mv;
				}
				//삭제하기
				@RequestMapping(value="meetingDelete.do")
				public String meetingDelete(@RequestParam int no) {
					communityBoardService.meetingDelete(no);
					return "redirect:meeting.do";
				}
				//수정하기글작성페이지로
				@RequestMapping(value="meetingUpdate.do")
				public ModelAndView meetingUpdate(@RequestParam int no){
					ModelAndView mv = new ModelAndView("community/meetingBoard/meetingUpdate");
					MeetingBoard meeting = communityBoardService.meetingUpdate(no);
					mv.addObject("meeting", meeting);
					return mv;
				}
				//수정하기완료
				@RequestMapping(value="meetingUpdate.do", method = RequestMethod.POST)
				public ModelAndView meetingUpdatePage(MeetingBoard meeting){
					System.out.println(meeting.getMb_no());
					ModelAndView mv = new ModelAndView("community/meetingBoard/meetingDetail");
					int resultUpdate = communityBoardService.meetingUpdatePage(meeting);
					String result = null;
					if(resultUpdate>0){
						result="성공적으로 수정하였습니다.";
					}else{
						result="수정에 실패하였습니다.";
					}
					MeetingBoard meetingOrigin = communityBoardService.meetingDetail(meeting.getMb_no());
					mv.addObject("result", result);
					mv.addObject("meeting", meetingOrigin);
					return mv;
				}

				//검색
				@RequestMapping(value="meetingSearch.do")
				public ModelAndView meetingSearch(@RequestParam String searchOption, @RequestParam String searchKey){
					
					List<MeetingBoard> list= communityBoardService.meetingSearch(searchOption, searchKey);
					
					//갯수
					int count = communityBoardService.countOption(searchOption, searchKey);
					ModelAndView mv = new ModelAndView("community/meetingBoard/meetingBoard");
					mv.addObject("list", list);
					mv.addObject("count",count);
					mv.addObject("searchOption", searchOption);
					mv.addObject("searchKey", searchKey);
					return mv;
				}
				
			
		
	//운동같이해요 댓글----------------------------------------------------------------------------------------
				// 댓글 입력
			    @RequestMapping("insertMeetingComment.do")
			    public void insertMeetingComment(@ModelAttribute MeetingComment meetingComment, HttpSession session){
			        int user_no = (int) session.getAttribute("user_no");
			        meetingComment.setUser_no(user_no);
			        communityBoardService.insertMeetingComment(meetingComment);
			    }
			    
			    // 댓글 목록(@Controller방식 : veiw(화면)를 리턴)
			    @RequestMapping("meetingCommentList.do")
			    public ModelAndView meetingCommentList(@RequestParam int mno, ModelAndView mv){
			        List<MeetingComment> mclist = communityBoardService.meetingCommentList(mno);
			        // 뷰이름 지정
			        mv.setViewName("community/meetingBoard/meetingDetail");
			        // 뷰에 전달할 데이터 지정
			        mv.addObject("mclist", mclist);
			        // replyList.jsp로 포워딩
			        return mv;
			    }
			    
			    // 댓글 목록(@RestController Json방식으로 처리 : 데이터를 리턴)
			    @RequestMapping("meetingCommentListJson.do")
			    @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
			    public List<MeetingComment> meetingCommentListJson(@RequestParam int mno){
			    	List<MeetingComment> list = communityBoardService.meetingCommentList(mno);
			        return list;
			    }

	
	
	//qna 게시판-------------------------------------------------------------------------------------------------------
				//리스트
				@RequestMapping(value = "qna.do", method = RequestMethod.GET)
				public ModelAndView qnaBoard(HttpServletRequest request) {
					ModelAndView mv = new ModelAndView("community/qnaBoard/qnaBoard");
					ArrayList<CommunityBoard> list = communityBoardService.qnaListView();					
					mv.addObject("list", list);
					return mv;
				}
				
				//글쓰기 페이지로 이동
				@RequestMapping(value="qnaInsert.do", method= RequestMethod.GET)
				public String  qnaInsert() {
					return "community/qnaBoard/qnaInsert";
				}
				//글쓰기페이지 저장
				@RequestMapping(value="qnaInsert.do", method = RequestMethod.POST)
				public String qnaInsertPage(CommunityBoard community) {
					int result = communityBoardService.qnaInsert(community);
					if(result > 0)
						return "redirect:/qna.do";
					else {
						return "System.out.println('에러발생')";
						
					}
				}
				//디테일
				@RequestMapping(value="qnaDetail.do", method = RequestMethod.GET)
				public ModelAndView qnaDetail(@RequestParam(value="no") int no, HttpServletRequest request) {
					//조회수 증가 처리
					communityBoardService.communityCount(no, request);
					
					ModelAndView mv = new ModelAndView("community/qnaBoard/qnaDetail");
					CommunityBoard community = communityBoardService.qnaDetail(no);
					mv.addObject("community", community);
					return mv;
				}
				//삭제
				@RequestMapping(value="qnaDelete.do")
				public String qnaDelete(@RequestParam int no) {
					communityBoardService.qnaDelete(no);
					return "redirect:/qna.do";
				}
				//수정하기글작성페이지로
				@RequestMapping(value="qnaUpdate.do")
				public ModelAndView qnaUpdate(@RequestParam int no){
					ModelAndView mv = new ModelAndView("community/qnaBoard/qnaUpdate");
					CommunityBoard community = communityBoardService.qnaUpdate(no);
					mv.addObject("community", community);
					return mv;
				}
				//수정하기완료
				@RequestMapping(value="qnaUpdate.do", method = RequestMethod.POST)
				public ModelAndView qnaUpdatePage(CommunityBoard community){
					System.out.println(community.getCb_no());
					ModelAndView mv = new ModelAndView("community/qnaBoard/qnaDetail");
					int resultUpdate = communityBoardService.qnaUpdatePage(community);
					String result = null;
					if(resultUpdate > 0){
						result="성공적으로 수정하였습니다.";
					}else{
						result="수정에 실패하였습니다.";
					}
					CommunityBoard communityOrigin = communityBoardService.qnaDetail(community.getCb_no());
					mv.addObject("result", result);
					mv.addObject("community", communityOrigin);
					return mv;
				}			
				
		
	//qna 게시판 댓글-------------------------------------------------------------------------------------------------------
		
		
	//리뷰 게시판-------------------------------------------------------------------------------------------------------
				//리스트
				@RequestMapping(value = "review.do", method = RequestMethod.GET)
				public ModelAndView reviewBoard(HttpServletRequest request) {
					ModelAndView mv = new ModelAndView("community/reviewBoard/reviewBoard");
					ArrayList<CommunityBoard> list = communityBoardService.reviewListView();
					mv.addObject("list", list);
					return mv;
				}
				//글쓰기페이지 이동
				@RequestMapping(value ="reviewInsert.do", method = RequestMethod.GET)
				public String reviewInsert() {
					return "community/reviewBoard/reviewInsert";
				}
				//글쓰기페이지 저장
				@RequestMapping(value ="reviewInsert.do", method = RequestMethod.POST)
				public String reviewInsertPage(CommunityBoard community) {
					//System.out.println(community);
					int result = communityBoardService.reviewInsert(community);
					//1이상 result 값이면 리스트로이동 
					if(result>0){
						return "redirect:/review.do";
					}else{
						return "community/CommunityBoard/error";
					}
				}
				//디테일
				@RequestMapping(value="reviewDetail.do", method = RequestMethod.GET)
				public ModelAndView reviewDetail(@RequestParam(value="no") int no, HttpServletRequest request) {
					//조회수 증가 처리
					communityBoardService.communityCount(no, request);
					
					ModelAndView mv = new ModelAndView("community/reviewBoard/reviewDetail");
					CommunityBoard community= communityBoardService.reviewDetail(no);
					mv.addObject("community", community);
					return mv;
				}
				
				//삭제
				@RequestMapping(value="reviewDelete.do")
				public String reviewDelete(@RequestParam int no) {
					communityBoardService.reviewDelete(no);
					return "redirect:/review.do";
				}
				//수정하기글작성페이지로
				@RequestMapping(value="reviewUpdate.do")
				public ModelAndView reviewUpdate(@RequestParam int no){
					ModelAndView mv = new ModelAndView("community/reviewBoard/reviewUpdate");
					CommunityBoard community = communityBoardService.reviewUpdate(no);
					mv.addObject("community", community);
					return mv;
				}
				//수정하기완료
				@RequestMapping(value="reviewUpdate.do", method = RequestMethod.POST)
				public ModelAndView reviewUpdatePage(CommunityBoard community){
					System.out.println(community.getCb_no());
					ModelAndView mv = new ModelAndView("community/reviewBoard/reviewDetail");
					int resultUpdate = communityBoardService.reviewUpdatePage(community);
					String result = null;
					if(resultUpdate > 0){
						result="성공적으로 수정하였습니다.";
					}else{
						result="수정에 실패하였습니다.";
					}
					CommunityBoard communityOrigin = communityBoardService.reviewDetail(community.getCb_no());
					mv.addObject("result", result);
					mv.addObject("community", communityOrigin);
					return mv;
				}
		
	//리뷰게시판 게시판 댓글-------------------------------------------------------------------------------------------------------
	
}
