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
	
	@RequestMapping(value="/healthMain.do")	//메인 페이지 이동
	public ModelAndView boardListMethod(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mv = new ModelAndView("workout/healthMain");
		
		return mv;
	}
	
	//헬스
	@RequestMapping(value="/part.do")	//부위별 카테고리 ajax 통신
	public void selectCategorytListMethod(Health health,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		ArrayList<Health> list = healthService.selectWorkoutCategoryList(health.getCategory1(),health.getCategory2());
		mv.addObject("list",list);
		mv.setViewName("jsonView");
	}
	
	@RequestMapping(value="/detail.do")	//썸네일 누르면 누른 v_no로 모달창에서 동영상 재생..
	public ModelAndView workOutDetail(Health health, HttpServletResponse response){
		//v_no를 파라미터로 보내면 v_no에 따른 health 객체 v_no 만
		int v_no = health.getV_no();
		
		ModelAndView mv = new ModelAndView("");	//모달 jsp 페이지로..?
		
		healthService.addReadCount(health.getV_no());	//조회수 증가
		
		Health detailHealth = healthService.selectWorkout(v_no);
		
		mv.addObject(detailHealth);
		
		return mv;
	}	
	//기본 메인페이지 네이버 동영상 끝

	//관리자 youtube 에서 플레이리스트 동영상
	
	//다양한 헬스운동 페이지 이동
	@RequestMapping(value="/youtubePlaylistView.do")
	public String playListView(){
		return "/workout/playlistview";
	}
	
	@RequestMapping(value="/playListinsert.do")	//input 태그에 playlist 값 입력 하면 db에 데이터를 넣어야됨..
	public ModelAndView HealthInsertMethod(ArrayList<Health> healthList,HttpServletRequest request){
		//insert 작업 해야됨
		
		ModelAndView mv = new ModelAndView("/workout/healthPlaylist");
		
		return mv;
	}
	@RequestMapping(value="/updateview.do") //수정하는 뷰로 이동하는 메서드
	public ModelAndView healthUpdateViewMethod(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("/workout/videoUpdateView");
		Health health = healthService.selectWorkout(Integer.parseInt(request.getParameter("v_no")));
		mv.addObject("health",health);
		return mv;
	}
	
	@RequestMapping(value="/healthupdate.do") //관리자 영상 내용 수정
	public ModelAndView HealthUpdateMethod(Health health,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("/workout/healthPlaylist");
		healthService.updateHealth(health,request);
		ArrayList<Health> list = healthService.selectAllList();
		mv.addObject("list",list);
		return mv;
	}
	//헬스 끝
	
	//주변 헬스장 검색 페이지 이동
	@RequestMapping(value="aroundFitenessCenter.do")
	public String aroundFitnessMethod(){
		return "";
	}
	
	
	//맨몸운동 
	
	
	//맨몸운동 끝
}
