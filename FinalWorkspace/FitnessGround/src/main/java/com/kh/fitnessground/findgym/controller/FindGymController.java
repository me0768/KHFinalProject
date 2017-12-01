package com.kh.fitnessground.findgym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FindGymController {

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
