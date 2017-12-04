package com.kh.fitnessground.gym.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public void findHealth()
	{
		
	}
	
	@RequestMapping(value="findpublicfacilities.do")
	public void findPublicFacilities()
	{
		
	}
}
