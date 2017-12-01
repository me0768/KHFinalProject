package com.kh.fitnessground.admin.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.community.meetingBoard.model.service.MeetingBoardService;
import com.kh.fitnessground.community.qnaBoard.model.service.QnABoardService;
import com.kh.fitnessground.community.reviewBoard.model.service.ReviewBoardService;
import com.kh.fitnessground.user.model.service.UserService;
import com.kh.fitnessground.workout.health.model.service.HealthService;
import com.kh.fitnessground.workout.yoga.model.service.YogaService;


@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private MeetingBoardService mettingBoardService;
	
	@Autowired
	private QnABoardService qnaBoardService;
	
	@Autowired
	private ReviewBoardService reviewBoardService;
	
	@Autowired
	private HealthService healthService;
	
	@Autowired
	private YogaService yogaService;
	
	//관리자 메인뷰 이동
	@RequestMapping(value = "adminMain.do")
	public ModelAndView adminmain(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/adminMain");
		return mv;
	}
	
	//관리자 차트뷰 이동
	@RequestMapping(value = "charts.do")
	public ModelAndView charts(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/charts");
		return mv;
	}
	
	//관리자 테이블뷰 이동
	@RequestMapping(value = "tables.do", method = RequestMethod.GET)
	public ModelAndView tables(Locale locale, Model model) {
		ModelAndView mv = new ModelAndView("admin/tables");
		return mv;
	}
	
	// 관리자 로그아웃
	@RequestMapping(value="/adminlogout.do")
	public String logoutMethod(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		
		return "main";
	}
	
	/*// 회원 리스트 출력 
	@RequestMapping(value="#")
	public */
	
	// 사업자 리스트 출력(헬스장 등록요청 처리)
	
	// workout 리스트 출력
	
	// mettingBoard 리스트 출력
	
	// qnaBoard 리스트 출력
	
	// reviewBoard 리스트 출력
	
	// 등록된 헬스장 리스트 출력 
	
	/*
	 * 1. 회원 / 사업자 구분 리스트 출력 >> 회원 리스트 user꺼 불러오기
	 * 2. 사업자 회원가입후 헬스장 등록 요청(승인전) 출력   >> 회원 리스트 + TB_GYM 조인 후 '헬스장 등록승인여부' 칼럼 이용
	 * 3. 운동법 리스트 출력  >> 준일,미향 꺼 사용 / 리스트 불러오고, 추가, 수정, 삭제 자리만 뷰에 만들기
	 * 4. 게시판 리스트 출력 >> 도영형꺼 사용 / 리스트 불러오고, 추가, 수정, 삭제 자리만 뷰에 만들기
	 * 3-2, 4-2. 운동법, 게시판 리스트를 제목 / 작성자로 검색하기
	 * 5. 헬스장 리스트 출력 >> TB_GYM 테이블 정보 불러오기
	 * 6. 일별 방문자 통계 
	 * 7. 지역별 헬스장 분포 통계
	 * 8. 동영상 조회수 통계
	 * 9.  
	 * */
	
}
