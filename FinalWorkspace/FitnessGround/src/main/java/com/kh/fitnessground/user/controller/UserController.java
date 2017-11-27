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
	
	@RequestMapping(value="/login.do")
	public ModelAndView loginMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("main");
		User u = userService.loginCheck(user.getEmail());
		if(BCrypt.checkpw(user.getPwd(), u.getPwd())) {
			if(u.getUser_level() == 2) {
				// 관리자 페이지 나오면 이부분 수정
				
			}			
				
			mv.addObject("user",u);
			mv.setViewName("jsonView");
			session.setAttribute("user", u);
			return mv;
		} else {
			mv.addObject("user", null);
			mv.setViewName("jsonView");
			return mv;
		}
	}
	
	@RequestMapping(value="/logout.do")
	public String logoutMethod(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		
		return "main";
	}
	
	@RequestMapping(value="/emailCheck.do")
	public ModelAndView emailCheckMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		User u = userService.emailCheck(user.getEmail());
		mv.addObject("user", u);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/nicknameCheck.do")
	public ModelAndView nicknameCheckMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		User u = userService.nicknameCheck(user.getNickname());
		mv.addObject("user", u);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/register.do")
	public ModelAndView registerMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		int user_level = Integer.parseInt(request.getParameter("userlevel"));
		user.setUser_level(user_level);
		// BCrypt 로 암호화
		String hashPassword = BCrypt.hashpw(user.getPwd(), BCrypt.gensalt());
		user.setPwd(hashPassword);
		userService.registerCheck(user);
		return mv;
	}
	
	@RequestMapping(value="/mypage.do")
	public String myPageMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		return "user/myPage";
	}
	
	@RequestMapping(value="/findid.do")
	public ModelAndView findIdMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		User u = userService.findid(user);
		mv.addObject("user", u.getEmail());
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/findpwdcheck.do")
	public ModelAndView findpwdCheckMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		User u = userService.findpwdCheck(user);
		if(u == null) {
			mv.addObject("user", u);
			mv.setViewName("jsonView");
		} else {
			int tmppwd = (int)(Math.random() * 8999 ) + 1000; // 4자리 랜덤값 생성
			String tmppwdstr = String.valueOf(tmppwd); 			// 스트링으로 변환
			String hashPassword = BCrypt.hashpw(tmppwdstr, BCrypt.gensalt()); // 솔트를 더해 다이제스트 구함
			user.setPwd(hashPassword); // 객체 pwd에 다이제스트 삽입
			userService.tmppwd(user);
			
			// 임시 비밀번호를 셀렉해옴
			u = userService.loginCheck(user.getEmail());
			
			String setfrom = "FitnessGround00@gmail.com"; // 송신자 이메일
			String tomail = u.getEmail(); // 수신자 이메일
			String title = "FitnessGround 임시 비밀번호 입니다."; // 메일 제목
			String content = "임시 비밀번호는 " + tmppwd + " 입니다. 로그인 후 비밀번호를 변경해 주세요.";
			
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
