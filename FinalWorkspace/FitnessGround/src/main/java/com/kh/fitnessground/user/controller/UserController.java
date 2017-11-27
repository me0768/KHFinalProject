package com.kh.fitnessground.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.SynchronossPartHttpMessageReader;
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
		System.out.println(user);
		userService.registerCheck(user);
		return mv;
	}
	
	@RequestMapping(value="/findid.do")
	public ModelAndView findIdMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		System.out.println(user);
		User u = userService.findid(user);
		mv.addObject("user", u);
		mv.setViewName("jsonView");
		return mv;
	}
}
