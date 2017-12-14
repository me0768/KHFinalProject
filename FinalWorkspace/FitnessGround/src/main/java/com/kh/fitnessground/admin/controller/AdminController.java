package com.kh.fitnessground.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.admin.model.service.AdminService;
import com.kh.fitnessground.admin.model.vo.BusinessRequest;
import com.kh.fitnessground.community.model.service.CommunityBoardService;
import com.kh.fitnessground.community.model.vo.CommunityBoard;
import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.gym.model.vo.GymQnABoard;
import com.kh.fitnessground.user.model.service.UserService;
import com.kh.fitnessground.user.model.service.UserServiceImpl;
import com.kh.fitnessground.user.model.vo.User;
import com.kh.fitnessground.workout.health.model.service.HealthService;
import com.kh.fitnessground.workout.health.model.vo.Health;
import com.kh.fitnessground.workout.yoga.model.service.YogaService;
import com.kh.fitnessground.workout.yoga.model.vo.Yoga;
import com.sun.xml.internal.ws.api.message.Message;

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
	public ModelAndView adminmain(User user, BusinessRequest businessRequest, @RequestParam(value = "level", required = false, defaultValue = "0") int level,
				GymQnABoard gymqnaboard, @RequestParam(value="receiver", required = false, defaultValue = "1") int receiver) {
		
		System.out.println("adminMain.do실행됨...");
		// 리퀘스트 파람 -> 자동으로 값을 받아옴
		// 근데 받아올 데이터가 없으면 required=false -> 꼭필요하지 않다 라는 뜻
		// defaultValue="0" -> 기본값설정 / 그러니깐 값이 없을때는 0으로 한다 라는뜻
		ModelAndView mv = new ModelAndView("admin/adminMain");
		int request = adminService.RequestCount(level);//헬스장등록요청 갯수 승인상태가 0 인것만 (미승인=0/승인=1)
		int message = adminService.Message(receiver);//관리자에게 온 문의 갯수 리시버가 1(관리자user_no) 이고, 응답 상태가 0 인것만(미응답=0/응답=1)
		
		
		ArrayList<User> gymRlist = adminService.GymRequest(level);// 헬스장 요청 정보 최신순 3개만리스트로 불러오기 승인상태 0인것만
		ArrayList<GymQnABoard> qnalist = adminService.GymQnABoard(receiver);// + 메세지 요청 최신 3개 미응답이고 리시버가 1인 것만 리스트로 불러오기
		
		mv.addObject("request", request);
		mv.addObject("message", message);
		mv.addObject("gymRlist", gymRlist);
		mv.addObject("qnalist", qnalist);
		System.out.println("등록요청 수 :" +request);
		System.out.println("등록요청gymRlist : " +gymRlist);
		System.out.println("문의 수 :" +message);
		System.out.println("문의요청list : " + qnalist);
		return mv;
	}
	
	/*// 관리자 메인뷰 이동
		@RequestMapping(value = "adminNav.do")
		public ModelAndView adminNav(User user, @RequestParam(value = "level", required = false, defaultValue = "0") int level,
					 @RequestParam(value="receiver", required = false, defaultValue = "1") int receiver) {
			
			System.out.println("adminNav.do실행됨...");
			// 리퀘스트 파람 -> 자동으로 값을 받아옴
			// 근데 받아올 데이터가 없으면 required=false -> 꼭필요하지 않다 라는 뜻
			// defaultValue="0" -> 기본값설정 / 그러니깐 값이 없을때는 0으로 한다 라는뜻
			ModelAndView mv = new ModelAndView("admin/common/nav");
			int request = adminService.RequestCount(level); //헬스장등록요청 갯수 승인상태가 0 인것만 (미승인=0/승인=1)
			int message = adminService.Message(receiver); //관리자에게 온 문의 갯수 리시버가 1(관리자user_no) 이고, 응답 상태가 0 인것만(미응답=0/응답=1)
			
			ArrayList<User> list = adminService.GymRequest(level); // 헬스장 요청 정보 최신순 3개만리스트로 불러오기 승인상태 0인것만
			
			mv.addObject("request", request);
			mv.addObject("message", message);
			mv.addObject("list", list);
			
			System.out.println("등록요청 수 :" +request);
			System.out.println("등록요청list : " +list);
			System.out.println("문의 수 :" +message);
			System.out.println("문의요청list : ");
			return mv;
		}*/
	
	

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

	// 관리자 문의함뷰 이동
	@RequestMapping(value="adminBoard.do")
	public ModelAndView adminBoard(){
		ModelAndView mv = new ModelAndView("admin/adminBoard");
		return mv;
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


	// 회원 리스트 출력
	@RequestMapping(value = "adminuserlist.do")
	public ModelAndView UserListMethod(User user, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/userlist/userlist");
		int level = 0;
		ArrayList<User> list = adminService.userlist(level);
		mv.addObject("list", list);
		return mv;
	}

	// 사업자 리스트 출력(헬스장 등록요청 처리)
	@RequestMapping(value = "adminbusinesslist.do")
	public ModelAndView BuisnessListMethod(User user, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/userlist/userbusinesslist");
		int level = 1;
		ArrayList<User> list = adminService.businesslist(level);
		mv.addObject("list", list);
		return mv;
	}

	// 사업자 헬스장 등록요청 리스트 출력(헬스장 등록요청 처리)
	@RequestMapping(value = "adminbusinessRequestlist.do")
	public ModelAndView BuisnessRequestListMethod(User user, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/userlist/userbusinessRequestlist");
		int level = 1;
		ArrayList<User> list = adminService.businessRequestlist(level);
		mv.addObject("list", list);
		return mv;
	}


	// mettingBoard 리스트 출력
	@RequestMapping(value = "adminMettingBoard.do")
	public ModelAndView mettingBoardListMethod() {
		ModelAndView mv = new ModelAndView("admin/boardlist/meetingboard");
		ArrayList<MeetingBoard> list = communityBoardService.meetingListView();
		mv.addObject("list", list);
		return mv;
	}

	// qnaBoard 리스트 출력
	@RequestMapping(value = "adminQNABoard.do")
	public ModelAndView qnaBoardListMethod() {
		ModelAndView mv = new ModelAndView("admin/boardlist/qnaboard");
		ArrayList<CommunityBoard> list = communityBoardService.qnaListView();
		mv.addObject("list", list);
		return mv;
	}

	// reviewBoard 리스트 출력
	@RequestMapping(value = "adminReviewBoard.do")
	public ModelAndView reviewBoardListMethod() {
		ModelAndView mv = new ModelAndView("admin/boardlist/reviewboard");
		ArrayList<CommunityBoard> list = communityBoardService.reviewListView();
		mv.addObject("list", list);
		return mv;
	}

	// 등록된 헬스장 리스트 출력
	@RequestMapping(value = "adminfindgym.do")
	public ModelAndView GymListMethod() {
		ModelAndView mv = new ModelAndView("#");

		return mv;
	}

	// 관리자가 회원상태 비활성화
	@RequestMapping(value = "adminUserState.do")
	public ModelAndView adminUserStateChangeMethod(@RequestParam(value = "user_no") int user_no,
			HttpServletRequest request) {
		System.out.println("넘어옴?");
		System.out.println(user_no);
		ModelAndView mv = new ModelAndView("admin/userlist/userlist");
		adminService.adminUserStateChange(user_no);

		mv.setViewName("jsonView");
		return mv;
	}

	// 관리자가 회원상태 활성화
	@RequestMapping(value = "adminUserBack.do")
	public ModelAndView adminUserStateBackMethod(@RequestParam(value = "user_no") int user_no,
			HttpServletRequest request) {
		System.out.println("넘어옴?");
		System.out.println(user_no);
		ModelAndView mv = new ModelAndView("admin/userlist/userlist");
		adminService.adminUserStateBack(user_no);

		mv.setViewName("jsonView");
		return mv;
	}

	// 관리자가 사업자회원상태 비활성화(계정 비활성화 + 등록된 헬스장도 비활성화)
	@RequestMapping(value = "adminBusinessState.do")
	public ModelAndView adminBusinessStateChangeMethod(@RequestParam(value = "user_no") int user_no,
			HttpServletRequest request) {
		System.out.println("넘어옴?");
		System.out.println(user_no);
		ModelAndView mv = new ModelAndView("admin/userlist/userbusinesslist");
		adminService.adminBusinessStateChange(user_no);

		mv.setViewName("jsonView");
		return mv;
	}

	// 관리자가 사업자회원상태 비활성화(계정 비활성화 + 등록된 헬스장도 비활성화)
	@RequestMapping(value = "adminBusinessBack.do")
						public ModelAndView adminBusinessStateBackMethod(@RequestParam(value = "user_no") int user_no,
								HttpServletRequest request) {
							System.out.println("넘어옴?");
							System.out.println(user_no);
							ModelAndView mv = new ModelAndView("admin/userlist/userbusinesslist");
							adminService.adminBusinessStateBack(user_no);
							
							mv.setViewName("jsonView");
							return mv;
						}

	// 사용자가 등록요청한 헬스장 관리자에서 승인하기(approval_state 1로 변경)
	@RequestMapping(value = "gymRequest.do")
	public ModelAndView gymRequestMethod(@RequestParam(value = "gym_no") int gym_no, HttpServletRequest request) {
		System.out.println("등록요청넘어옴");
		System.out.println(gym_no);
		ModelAndView mv = new ModelAndView("admin/userlist/userbusinessRequestlist");
		adminService.adminGymRequest(gym_no);

		mv.setViewName("jsonView");
		return mv;
	}

	// 관리자에서 등록된 헬스장 등록취소하기(approval_state 0으로 변경)
	@RequestMapping(value = "gymCancel.do")
	public ModelAndView gymCancelMethod(@RequestParam(value = "gym_no") int gym_no, HttpServletRequest request) {
		System.out.println("등록 취소 요청넘어옴");
		System.out.println(gym_no);
		ModelAndView mv = new ModelAndView("admin/userlist/userbusinessRequestlist");
		adminService.adminGymCancel(gym_no);

		mv.setViewName("jsonView");
		return mv;
	}

	// MeetingBoard 게시글 삭제
	@RequestMapping(value = "meetingBoardDelete.do")
	public ModelAndView meetingBoardDeleteMethod(@RequestParam(value = "mb_no") int mb_no, HttpServletRequest request) {
		System.out.println("등록 취소 요청넘어옴");
		System.out.println(mb_no);
		ModelAndView mv = new ModelAndView("admin/boardlist/meetingboard");
		adminService.meetingBoardDelete(mb_no);

		mv.setViewName("jsonView");
		return mv;
	}

	// QNABoard 게시글 삭제
	@RequestMapping(value = "qnaBoardDelete.do")
	public ModelAndView qnaBoardDeleteMethod(@RequestParam(value = "cb_no") int cb_no, HttpServletRequest request) {
		System.out.println("등록 취소 요청넘어옴");
		System.out.println(cb_no);
		ModelAndView mv = new ModelAndView("admin/boardlist/qnaboard");
		adminService.qnaBoardDelete(cb_no);

		mv.setViewName("jsonView");
		return mv;
	}

	// ReviewBoard 게시글 삭제
	@RequestMapping(value = "reviewBoardDelete.do")
	public ModelAndView reviewBoardDeleteMethod(@RequestParam(value = "cb_no") int cb_no, HttpServletRequest request) {
		System.out.println("등록 취소 요청넘어옴");
		System.out.println(cb_no);
		ModelAndView mv = new ModelAndView("admin/boardlist/reviewboard");
		adminService.reviewBoardDelete(cb_no);

		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping(value="adminQnABoard.do")
	public ModelAndView adminBoardMethod(){
		ModelAndView mv = new ModelAndView("admin/adminBoard");
		ArrayList<GymQnABoard> list = adminService.adminBoard();
		mv.addObject("list", list);
		
		return mv;
	}
	
	
	/*// 게시글보기 에서 작성자이름 클릭시 작성자 정보 모달띄우기
		@RequestMapping(value = "userDetail.do")
		public ModelAndView userDetailMethod(@RequestParam(value = "user_no") int user_no, HttpServletRequest request) {
			
			System.out.println(user_no);
			ModelAndView mv = new ModelAndView("#");
			

			return mv;
		}*/
	
	
	
	/*
	 * 1. 회원 / 사업자 구분 리스트 출력 >> 회원 리스트 user꺼 불러오기 2. 사업자 회원가입후 헬스장 등록 요청(승인전) 출력
	 * >> 회원 리스트 + TB_GYM 조인 후 '헬스장 등록승인여부' 칼럼 이용 3. 운동법 리스트 출력 >> 준일,미향 꺼 사용
	 * /리스트 불러오고, 추가, 수정, 삭제 자리만 뷰에 만들기 4. 게시판 리스트 출력 >> 도영형꺼 사용 / 리스트 불러오고, 추가,
	 * 수정, 삭제 자리만 뷰에 만들기 3-2, 4-2. 운동법, 게시판 리스트를 제목 / 작성자로 검색하기 5. 헬스장 리스트 출력
	 * >>TB_GYM 테이블 정보 불러오기 6. 일별 방문자 통계 7. 지역별 헬스장 분포 통계 8. 동영상 조회수 통계 9.
	 */

}
