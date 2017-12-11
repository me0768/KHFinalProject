package com.kh.fitnessground.gym.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.community.model.vo.MeetingBoard;
import com.kh.fitnessground.gym.model.service.GymService;
import com.kh.fitnessground.gym.model.vo.Gym;
import com.kh.fitnessground.gym.model.vo.PublicGym;



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
	@RequestMapping(value="findgym.do", method=RequestMethod.GET)
	public ModelAndView findGym(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView mv = new ModelAndView("findgym/findgym");
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="findhealth.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView findHealth(ModelAndView mv, HttpServletRequest request, HttpServletResponse response)
	{
		//ModelAndView mv = new ModelAndView("findgym/findgym");

		int currentPage = 1;
		int limit = 5;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(request.getParameter("cpage") != null)
			currentPage = Integer.parseInt(request.getParameter("cpage"));
		else currentPage = 1;
		
		int listCount = gymService.getListCount();
		ArrayList<Gym> list = gymService.healthList(currentPage, limit);
	//	ArrayList<Gym> list = gymService.healthList();
		
		int maxPage = (int)((double)listCount / 10 + 0.9);
		
		int startPage = (((int)((double)currentPage / limit + 0.9))-1) * limit + 1;
		
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage)
			endPage = maxPage;
		System.out.println("listCount = " + listCount);
		System.out.println(list);
		
		map.put("currentPage", currentPage);
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("limit", limit);
		
		JSONObject sendjson = new JSONObject(); // 전송용 최종 객체
		JSONArray jar = new JSONArray();
		
		for(Gym gym : list)
		{
			JSONObject jgym = new JSONObject();
			jgym.put("gym_name", gym.getGym_name());
			jgym.put("location", gym.getLocation());
			jgym.put("rename_image", gym.getRename_image());
			
			jar.add(jgym);
		}
		
		//sendjson.put("list", jar);
		
		map.put("gymlist", jar);
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		
		return mv;
		
	}
	
	/*@RequestMapping(value="findpublicgym.do")
	@ResponseBody
	public ModelAndView findPublicFacilities(ModelAndView mv, HttpServletRequest request, HttpServletResponse response)
	{

		int currentPage = 1;
		int limit = 5;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(request.getParameter("cpage") != null)
			currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		int listCount = gymService.getPublicListCount();
		ArrayList<PublicGym> list = gymService.publicList(currentPage, limit);
	//	ArrayList<Gym> list = gymService.healthList();
		
		int maxPage = (int)((double)listCount / 10 + 0.9);
		
		int startPage = (((int)((double)currentPage / limit + 0.9))-1) * limit + 1;
		
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage)
			endPage = maxPage;
		System.out.println("listCount = " + listCount);
		System.out.println(list);
		
		map.put("currentPage", currentPage);
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("limit", limit);
		
		JSONObject sendjson = new JSONObject(); // 전송용 최종 객체
		JSONArray jar = new JSONArray();
		
		for(PublicGym pgym : list)
		{
			JSONObject jgym = new JSONObject();
			jgym.put("gym_name", pgym.getPublic_name());
			jgym.put("location", pgym.getLocation());
			
			
			jar.add(pgym);
		}
		
		sendjson.put("list", jar);
		
		map.put("gymlist", sendjson.toJSONString());
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		
		return mv;
	}*/
}
