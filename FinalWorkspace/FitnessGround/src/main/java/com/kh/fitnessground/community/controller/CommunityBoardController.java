package com.kh.fitnessground.community.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.community.model.service.CommunityBoardService;
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
		
	//운동같이해요 게시판
		
				@RequestMapping(value = "meeting.do", method = RequestMethod.GET)
				public ModelAndView meetingBoard(HttpServletRequest request) {
					ModelAndView mv = new ModelAndView("community/meetingBoard/meetingBoard");
					ArrayList<MeetingBoard> list = communityBoardService.meetingListView();
					mv.addObject("list", list);
					return mv;
				}
				@RequestMapping(value ="meetingInsert.do")
				public ModelAndView meetingInsert() {
					ModelAndView mv = new ModelAndView("community/meetingBoard/meetingInsert");
					return mv;
				}
				@RequestMapping(value="meetingDetail.do", method = RequestMethod.GET)
				public ModelAndView meetingDetail() {
					ModelAndView mv = new ModelAndView("community/meetingBoard/meetingDetail");
					return mv;
				}
		
	//운동같이해요 댓글
		
	
	//후기 게시판
				//리스트
				@RequestMapping(value = "qna.do", method = RequestMethod.GET)
				public String qnaBoard(Locale locale, Model model) {
					return "community/qnaBoard/qnaBoard";
				}
		
	//후기 게시판 댓글
		
		
	//qna 게시판
				//리스트
				@RequestMapping(value = "review.do", method = RequestMethod.GET)
				public String reviewBoard(Locale locale, Model model) {
					return "community/reviewBoard/reviewBoard";
				}
		
		
	//qna 게시판 댓글	
	
}
