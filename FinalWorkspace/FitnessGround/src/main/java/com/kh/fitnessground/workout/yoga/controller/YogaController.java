package com.kh.fitnessground.workout.yoga.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.workout.yoga.model.service.YogaService;
import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

@Controller
public class YogaController {
	@Autowired
	private YogaService yogaService;

	public YogaController() {}
	//yoga 메인 
	@RequestMapping(value="/ylist.do")
	public ModelAndView YogaListMethod(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/workout/yogaMain");
		ArrayList<Yoga> list = yogaService.selectList();
		mv.addObject("list", list);
		return mv;
	}
	//동영상 insert
	@RequestMapping(value="yinsert.do")
	public ModelAndView YogaInsertMethod(Yoga yoga, HttpServletRequest request) {
		yogaService.insertYoga(yoga, request);
		ModelAndView mv = new ModelAndView("/workout/yogaListView");
		mv.addObject("list", yogaService.selectList());
		return mv;
	}
}
