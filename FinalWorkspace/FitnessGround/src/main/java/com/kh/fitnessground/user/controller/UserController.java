package com.kh.fitnessground.user.controller;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.user.model.service.UserService;
import com.kh.fitnessground.user.model.vo.User;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 로그인 체크
	@RequestMapping(value="/login.do")
	public ModelAndView loginMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("main");
		User u = userService.loginCheck(user.getEmail()); // 이메일이 같은게 있는지 확인
		if( u == null ) {				
			mv.addObject("user", null); // 없을 경우 null 리턴
			mv.setViewName("jsonView");
			return mv;
		} else {
			if(BCrypt.checkpw(user.getPwd(), u.getPwd())) { // 이메일 같은게 있으면 암호화 데이터 비교
				if(u.getUser_level() == 2) {
					// 관리자 페이지 나오면 이부분 수정
					
				}			
					
				mv.addObject("user",u);
				mv.setViewName("jsonView");
				session.setAttribute("user", u);  		// 아디비번이 같을 경우 세션값으로 넘김
				return mv;
			} else {						
				mv.addObject("user", null);		// 암호화된 데이터가 같지 않을 시에 null 리턴
				mv.setViewName("jsonView");
				return mv;
			}
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/logout.do")
	public String logoutMethod(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		
		return "main";
	}
	
	// 이메일 중복 확인
	@RequestMapping(value="/emailCheck.do")
	public ModelAndView emailCheckMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		User u = userService.emailCheck(user.getEmail());
		mv.addObject("user", u);
		mv.setViewName("jsonView");
		return mv;
	}
	
	// 닉네임 중복확인
	@RequestMapping(value="/nicknameCheck.do")
	public ModelAndView nicknameCheckMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		User u = userService.nicknameCheck(user.getNickname());
		mv.addObject("user", u);
		mv.setViewName("jsonView");
		return mv;
	}
	
	// 전화번호 중복확인
	@RequestMapping(value="/phonecheck.do")
	public ModelAndView phonecheckMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		User u = userService.phonecheck(user.getPhone());
		mv.addObject("user", u);
		mv.setViewName("jsonView");
		return mv;
	}
	
	// 회원가입 메소드
	@RequestMapping(value="/register.do")
	public ModelAndView registerMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		int user_level = Integer.parseInt(request.getParameter("userlevel"));
		user.setUser_level(user_level);		// user_level은 int 값이므로 자료형을 맞춰주어야 함
		// BCrypt 로 암호화
		String hashPassword = BCrypt.hashpw(user.getPwd(), BCrypt.gensalt()); // 비밀번호 암호화
		user.setPwd(hashPassword);
		userService.registerCheck(user);
		return mv;
	}
	
	// 마이페이지로 뷰 이동
	@RequestMapping(value="/mypage.do")
	public String myPageMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		return "user/myPage";
	}
	
	// 아이디 찾기
	@RequestMapping(value="/findid.do")
	public ModelAndView findIdMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		User u = userService.findid(user);
		mv.addObject("user", u);
		mv.setViewName("jsonView");
		return mv;
	}
	
	// 비밀번호 찾기 - 임시비밀번호 이메일로 발송
	@RequestMapping(value="/findpwdcheck.do")
	public ModelAndView findpwdCheckMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		User u = userService.findpwdCheck(user);	// 찾기에 필요한 데이터와 일치하는 계정 있는지 확인
		if(u == null) {
			mv.addObject("user", u);			// 없으면 null 리턴
			mv.setViewName("jsonView");
		} else {								// 있을 경우
			int tmppwd = (int)(Math.random() * 8999 ) + 1000; // 4자리 랜덤값 생성
			String tmppwdstr = String.valueOf(tmppwd); 			// 스트링으로 변환
			String hashPassword = BCrypt.hashpw(tmppwdstr, BCrypt.gensalt()); // 솔트를 더해 다이제스트 구함
			user.setPwd(hashPassword); 	// 필드 pwd에 다이제스트 삽입
			userService.tmppwd(user);	// 다이제스트 값으로 계정 pwd 업데이트
			
			u = userService.loginCheck(user.getEmail()); // 임시비밀번호로 셀렉해옴
			
			String setfrom = "FitnessGround00@gmail.com"; // 송신자 이메일
			String tomail = u.getEmail(); // 수신자 이메일
			String title = "FitnessGround 임시 비밀번호 입니다."; // 메일 제목
			String content = "임시 비밀번호는 " + tmppwd + " 입니다. 로그인 후 비밀번호를 변경해 주세요."; //메일 내용
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				
				mailSender.send(message);
			} catch(Exception e) {
				System.out.println(e);
			}
			
			mv.addObject("user", u);
			mv.setViewName("jsonView");
		}
		return mv;
	}
}
