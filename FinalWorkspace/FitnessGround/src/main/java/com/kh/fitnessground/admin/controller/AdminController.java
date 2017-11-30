package com.kh.fitnessground.admin.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.fitnessground.user.model.service.UserService;


@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "adminMain.do", method = RequestMethod.GET)
	public String adminmain(Locale locale, Model model) {
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "charts.do", method = RequestMethod.GET)
	public String charts(Locale locale, Model model) {
		return "admin/charts";
	}
	
	@RequestMapping(value = "tables.do", method = RequestMethod.GET)
	public String tables(Locale locale, Model model) {
		return "admin/tables";
	}

	/*
	 * 1. 회원 / 사업자 구분 리스트 출력
	 * 2. 사업자 회원가입후 헬스장 등록 요청(승인전) 출력
	 * 3. 운동법 리스트 출력(삭제 기능 포함 / 추가는?)
	 * 4. 게시판 리스트 출력(삭제기능 포함)
	 * 5. 헬스장 리스트 출력(삭제기능 포함)
	 * 6. 일별 방문자 통계
	 * 7. 지역별 헬스장 분포 통계
	 * 8. 동영상 조회수 통계
	 * 9.  
	 * */
	
}
