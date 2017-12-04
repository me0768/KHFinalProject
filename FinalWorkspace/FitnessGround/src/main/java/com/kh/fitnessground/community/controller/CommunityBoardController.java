package com.kh.fitnessground.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.fitnessground.community.model.service.CommunityBoardService;

@Controller
public class CommunityBoardController {
	@Autowired
	private CommunityBoardService communityBoardService;
	
	//리스트
		@RequestMapping(value = "community.do")
		public String home() {
			return "community/communityMain";
		}
		
	//운동같이해요 게시판
		
				@RequestMapping(value = "meeting.do")
				public String meetingBoard() {
					communityBoardService.meetingView();
					return "community/meetingBoard/meetingBoard";
				}
			
		
	//운동같이해요 댓글
		
	
	//후기 게시판
				//리스트
				@RequestMapping(value = "qna.do")
				public String qnaBoard() {
					return "community/qnaBoard/qnaBoard";
				}
		
	//후기 게시판 댓글
		
		
	//qna 게시판
				//리스트
				@RequestMapping(value = "review.do")
				public String reviewBoard() {
					return "community/reviewBoard/reviewBoard";
				}
		
		
	//qna 게시판 댓글	
	
}
