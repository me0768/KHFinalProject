package com.kh.fitnessground.workout.health.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.workout.health.model.service.HealthService;
import com.kh.fitnessground.workout.health.model.vo.Health;

@Controller
public class HealthController {
	@Autowired
	private HealthService healthService;
	
	@RequestMapping(value="healthMain.do")
	public ModelAndView boardListMethod(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mv = new ModelAndView("workout/healthMain");
		
		return mv;
	}
	
	//헬스
	@RequestMapping(value="part.do")
	public void chestListMethod(Health health,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		ArrayList<Health> list = healthService.selectWorkoutCategoryList(health.getCategory2());
		mv.addObject("list",list);
		mv.setViewName("jsonView");
	}

	
	
	//헬스 끝
	
	//주변 헬스장 검색
	@RequestMapping(value="aroundFitenessCenter.do")
	public String aroundFitnessMethod(){
		return "";
	}
	
	
	//맨몸운동 
	
	
	//맨몸운동 끝
}
