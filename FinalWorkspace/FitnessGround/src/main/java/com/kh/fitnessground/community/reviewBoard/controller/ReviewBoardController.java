package com.kh.fitnessground.community.reviewBoard.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewBoardController {
	
	//리스트
			@RequestMapping(value = "review.do", method = RequestMethod.GET)
			public String home(Locale locale, Model model) {
				return "community/reviewBoard/reviewBoard";
			}
}
