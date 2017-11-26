package com.kh.fitnessground.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
		if(user.getUser_level() == 2) {
			// 관리자 페이지 나오면 이부분 수정
			ModelAndView mv = new ModelAndView();
			return mv;
		} else {
			User test = userService.list(2);
			System.out.println(test);
			
			ModelAndView mv = new ModelAndView("main");
			User u = userService.loginCheck(user);
			mv.addObject("user",u);
			mv.setViewName("jsonView");
			session.setAttribute("user", u);
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
	
	@RequestMapping(value="/emailcheck.do")
	public ModelAndView emailcheckMethod(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("main");
		System.out.println(user);
		User u = userService.emailCheck(user.getEmail());
		mv.addObject("email", u.getEmail());
		mv.setViewName("jsonView");
		return mv;
	}
	
}
