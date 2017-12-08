package com.kh.fitnessground.gym.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.gym.model.service.GymService;
import com.kh.fitnessground.gym.model.vo.Gym;

@Controller
public class GymController {
	@Autowired
	private GymService gymService;
	
	// 헬스장 등록
	@RequestMapping(value="registergym.do")
	public ModelAndView registerGym(Gym gym, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv =new ModelAndView();
		if( gymService.RegisterGym(gym) ) {
			gymService.GymScheduleInsert(gym.getGym_no());
		}
		// 헬스장 스케줄도 등록
		return mv;
	}
	
	// 헬스장 수정
	@RequestMapping(value="updategym.do")
	public ModelAndView updateGym(Gym gym, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		// 헬스장 스케줄도 수정
		return mv;
	}
	
	// 헬스장 삭제
	@RequestMapping(value="deletegym.do")
	public ModelAndView deleteGym(Gym gym, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		// 헬스장 스케줄도 삭제
		return mv;
	}
	
	// 헬스장 디테일 뷰
	@RequestMapping(value="detailgym.do")
	public ModelAndView detailGym(Gym gym, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		// 헬스장 스케줄도 셀렉
		return mv;
	}
	
	// gymreview
	@RequestMapping(value="reviewwindow.do")
	public ModelAndView reviewWindow() // 리뷰 등록 화면 호출
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping(value="enrollreview.do")
	public ModelAndView enrollReview() // 리뷰 등록
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping(value="updatereview.do")
	public ModelAndView updateReview()
	{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping(value="deletereviw.do")
	public void deleteReview()
	{
		
	}
	
	//findgym
	@RequestMapping(value="findgym.do")
	public ModelAndView findGym()
	{
		ModelAndView mv = new ModelAndView("findgym/findgym");
		
		return mv;
	}
	
	@RequestMapping(value="findhealth.do")
	public ModelAndView findHealth(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView mv = new ModelAndView("findgym/findgym");

		/*int currentPage = 1;
		int limit = 5;
		
		if(request.getParameter("cpage") != null)
			currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		int listCount = gymService.getListCount();*/
		//ArrayList<Gym> list = gymService.healthList(currentPage, limit);
		ArrayList<Gym> list = gymService.healthList();
		/*
		int maxPage = (int)((double)listCount / 10 + 0.9);
		
		int startPage = (((int)((double)currentPage / limit + 0.9))-1) * limit + 1;
		
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage)
			endPage = maxPage;
		
		System.out.println(list);
		
		if(list != null)
		{
			
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("listCount", listCount);
			
		}*/
		mv.setViewName("jsonview");
		mv.addObject("list", list);
		return mv;
		
	}
	
	@RequestMapping(value="findpublicfacilities.do")
	public void findPublicFacilities()
	{
		
	}
}
