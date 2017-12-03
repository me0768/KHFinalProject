package com.kh.fitnessground.community.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommunityBoardController {

	//리스트
		@RequestMapping(value = "community.do", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
			return "community/communityMain";
		}
		
	//운동같이해요 게시판
		
				@RequestMapping(value = "meeting.do", method = RequestMethod.GET)
				public String meetingBoard(Locale locale, Model model) {
					return "community/meetingBoard/meetingBoard";
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
