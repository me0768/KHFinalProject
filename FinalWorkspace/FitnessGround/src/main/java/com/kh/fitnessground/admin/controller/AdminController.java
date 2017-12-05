package com.kh.fitnessground.admin.controller;

import java.util.ArrayList;
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

import com.kh.fitnessground.admin.model.service.AdminService;
import com.kh.fitnessground.community.model.service.CommunityBoardService;
import com.kh.fitnessground.user.model.service.UserService;
import com.kh.fitnessground.user.model.vo.User;
import com.kh.fitnessground.workout.health.model.service.HealthService;
import com.kh.fitnessground.workout.health.model.vo.Health;
import com.kh.fitnessground.workout.yoga.model.service.YogaService;
import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommunityBoardService communityBoardService;

	@Autowired
	private HealthService healthService;

	@Autowired
	private YogaService yogaService;
	
	@Autowired
	private AdminService adminService;

	// 관리자 메인뷰 이동
	@RequestMapping(value = "adminMain.do")
	public ModelAndView adminmain(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/adminMain");
		return mv;
	}

	// 관리자 차트뷰 이동
	@RequestMapping(value = "charts.do")
	public ModelAndView charts(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/charts");
		return mv;
	}

	// 관리자 테이블뷰 이동
	@RequestMapping(value = "tables.do", method = RequestMethod.GET)
	public String tables() {
		return "admin/tables";
	}

	// 관리자 로그아웃
	@RequestMapping(value = "/adminlogout.do")
	public String logoutMethod(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}

		return "main";
	}

	/*// 헬스 동영상(준일) 리스트 출력
	@RequestMapping(value = "adminpart.do")
	public ModelAndView HealthListMethod(Health health, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("#");
		ArrayList<Health> list = healthService.selectWorkoutCategoryList(health.getCategory2());
		mv.addObject("list", list);
		return mv;
	}*/

	// 회원 리스트 출력
	@RequestMapping(value = "adminuserlist.do")
	public ModelAndView UserListMethod(User user, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/tables");
		int level = 1;
		ArrayList<User> list = adminService.userlist(level);
		mv.addObject("list", list);
		System.out.println(mv.toString());
		return mv;
	}

	// 사업자 리스트 출력(헬스장 등록요청 처리)
	@RequestMapping(value = "adminbuisnesslist.do")
	public ModelAndView BuisnessListMethod(User user, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/tables");
		int level = 1;
		ArrayList<User> list = adminService.buisnesslist(level);
		mv.addObject("list", list);
		return mv;
	}

	// 요가 동영상(미향) 리스트 출력
	@RequestMapping(value = "adminylist.do")
	public ModelAndView YogaListMethod(Yoga yoga, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/workoutVideo");
		ArrayList<Yoga> list = yogaService.selectAllList();
		mv.addObject("list", list);
		return mv;
	}

	// mettingBoard 리스트 출력
	@RequestMapping(value = "adminmeeting.do")
	public ModelAndView mettingBoardListMethod() {
		ModelAndView mv = new ModelAndView("#");
		return mv;
	}

	// qnaBoard 리스트 출력
	@RequestMapping(value = "adminqna.do")
	public ModelAndView qnaBoardListMethod() {
		ModelAndView mv = new ModelAndView("#");
		return mv;
	}

	// reviewBoard 리스트 출력
	@RequestMapping(value = "adminreview.do")
	public ModelAndView reviewBoardListMethod() {
		ModelAndView mv = new ModelAndView("#");
		return mv;
	}

	// 등록된 헬스장 리스트 출력
	@RequestMapping(value = "adminfindgym.do")
	public ModelAndView GymListMethod() {
		ModelAndView mv = new ModelAndView("#");

		return mv;
	}
	/*
	 * 1. 회원 / 사업자 구분 리스트 출력 >> 회원 리스트 user꺼 불러오기 
	 * 2. 사업자 회원가입후 헬스장 등록 요청(승인전) 출력 >> 회원 리스트 + TB_GYM 조인 후 '헬스장 등록승인여부' 칼럼 이용 
	 * 3. 운동법 리스트 출력 >> 준일,미향 꺼 사용 /리스트 불러오고, 추가, 수정, 삭제 자리만 뷰에 만들기 
	 * 4. 게시판 리스트 출력 >> 도영형꺼 사용 / 리스트 불러오고, 추가, 수정, 삭제 자리만 뷰에 만들기 
	 * 3-2, 4-2. 운동법, 게시판 리스트를 제목 / 작성자로 검색하기 
	 * 5. 헬스장 리스트 출력 >>TB_GYM 테이블 정보 불러오기 
	 * 6. 일별 방문자 통계 
	 * 7. 지역별 헬스장 분포 통계 
	 * 8. 동영상 조회수 통계 
	 * 9.
	 */

}
