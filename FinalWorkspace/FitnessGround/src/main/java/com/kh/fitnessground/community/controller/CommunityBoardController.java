package com.kh.fitnessground.community.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.community.model.service.CommunityBoardService;
import com.kh.fitnessground.community.model.vo.CommunityBoard;
import com.kh.fitnessground.community.model.vo.MeetingBoard;

@Controller
public class CommunityBoardController {
	
	@Autowired
	private CommunityBoardService communityBoardService;

	//리스트
		@RequestMapping(value = "community.do", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
			return "community/communityMain";
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
				public ModelAndView meetingDetail(@RequestParam(value="no") int no) {
					ModelAndView mv = new ModelAndView("community/meetingBoard/meetingDetail");
					MeetingBoard meeting = communityBoardService.meetingDetail(no);
					mv.addObject("meeting", meeting);
					return mv;
				}
		
	//운동같이해요 댓글----------------------------------------------------------------------------------------
		
	
	//qna 게시판-------------------------------------------------------------------------------------------------------
				//리스트
				@RequestMapping(value = "qna.do", method = RequestMethod.GET)
				public ModelAndView qnaBoard(HttpServletRequest request) {
					ModelAndView mv = new ModelAndView("community/meetingBoard/meetingBoard");
					ArrayList<CommunityBoard> list = communityBoardService.qnaListView();					
					mv.addObject("list", list);
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
				public ModelAndView reviewDetail(@RequestParam(value="no") int no) {
					ModelAndView mv = new ModelAndView("community/reviewBoard/reviewDetail");
					CommunityBoard community= communityBoardService.reviewDetail(no);
					mv.addObject("community", community);
					return mv;
				}
		
	//리뷰게시판 게시판 댓글-------------------------------------------------------------------------------------------------------
	
}
