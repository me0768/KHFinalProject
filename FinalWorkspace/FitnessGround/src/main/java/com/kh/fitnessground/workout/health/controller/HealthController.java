package com.kh.fitnessground.workout.health.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.workout.commentlike.vo.Comment;
import com.kh.fitnessground.workout.commentlike.vo.Like;
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
	
	//헬스 (부위별 영상) ajax 
	@RequestMapping(value="/part.do")	
	public void selectCategorytListMethod(Health health,HttpServletResponse response) throws IOException{
		
				
		ArrayList<Health> list = healthService.selectWorkoutCategoryList(health);
				
				
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Health h : list){
			JSONObject jhealth = new JSONObject();
			jhealth.put("v_no", h.getV_no());
			jhealth.put("title", URLEncoder.encode(h.getTitle(),"utf-8"));
			jhealth.put("content", URLEncoder.encode(h.getContent(),"utf-8"));
			jhealth.put("category1", URLEncoder.encode(h.getCategory1(),"utf-8"));
			jhealth.put("category2", URLEncoder.encode(h.getCategory2(),"utf-8"));
			jhealth.put("url", URLEncoder.encode(h.getUrl(),"utf-8"));
			jhealth.put("readcount", h.getReadcount());
			
			jarr.add(jhealth);
		}
		
		sendJson.put("list", jarr);
		
		response.setContentType("aplication/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	
	}
	
	@RequestMapping(value="/detail.do",method = RequestMethod.POST)	//썸네일 누르면 누른 v_no로 모달창에서 동영상 재생.. 썸네일은 어케하지..
	public ModelAndView workOutDetail(Health health, HttpServletResponse response){
		//v_no를 파라미터로 보내면 v_no에 따른 health 객체 v_no 만
		int v_no = health.getV_no();
		
		ModelAndView mv = new ModelAndView("workout/detailView");	//모달 jsp 페이지로
		
		healthService.addReadCount(health.getV_no());	//조회수 증가
		
		Health detailHealth = healthService.selectOneWorkout(v_no);
		
		mv.addObject("health",detailHealth);
		mv.setViewName("jsonView");
		
		return mv;
	}	
	//기본 메인페이지 네이버 동영상 끝
	
		
		
	//맨몸운동
		
	//맨몸운동 메인 페이지	
	@RequestMapping(value="/homeTraning.do")
	public ModelAndView HomeTraningListMethod(){
		ModelAndView mv = new ModelAndView("/workout/homeTraningMain");
		ArrayList<Health> list = healthService.selectHomeTraningList();
		
		for(Health h : list){
			h.setTitle(h.getTitle().replaceAll("\\\"", "＇"));
			h.setContent(h.getContent().replaceAll("\\\"", "＇"));// 쌍따옴표jsp출력 문제로 미리 치환
		}
		int pushUpCount = healthService.selectVideoCount("맨몸푸시업");
		int lowerBodyCount = healthService.selectVideoCount("맨몸하체");
		int pullUpCount = healthService.selectVideoCount("맨몸철봉");
		int entireBodyCount = healthService.selectVideoCount("맨몸전신");
		int beginnerCount = healthService.selectVideoCount("맨몸초보자");
		
		mv.addObject("pushUpCount", pushUpCount);
		mv.addObject("lowerBodyCount", lowerBodyCount);
		mv.addObject("pullUpCount", pullUpCount);
		mv.addObject("entireBodyCount", entireBodyCount);
		mv.addObject("beginnerCount", beginnerCount);
		
		mv.addObject("list",list);
		return mv;		
	}
	
	//맨몸운동 카테고리별
	@RequestMapping(value="/htclist.do", method = RequestMethod.POST)
	public ModelAndView homeTraningCategoryList(Health health){
		ModelAndView mv = new ModelAndView("/workout/homeTraningMain");
		
		ArrayList<Health> htclist = healthService.selectWorkoutCategoryList(health);
		
		for(Health ht : htclist){
			ht.setTitle(ht.getTitle().replaceAll("\\\"", "＇"));
			ht.setContent(ht.getContent().replaceAll("\\\"", "＇"));// 쌍따옴표jsp출력 문제로 미리 치환
		}
		mv.addObject("htclist",htclist);
		mv.setViewName("jsonView");
		return mv;
		
	}
	
	
		
	
	
	//주변 헬스장 검색 페이지 이동
	@RequestMapping(value="aroundFitenessCenter.do")
	public String aroundFitnessMethod(){
		return "";
	}
	
	
		
	//댓글 
	@RequestMapping(value="/selectComment.do")
	public ModelAndView selectCommentList(Comment comment){
			
		ModelAndView mv = new ModelAndView("workout/detailView");
	
		ArrayList<Comment> list = healthService.selectCommentList(comment.getV_no());
		
		mv.addObject("commentList",list);
		mv.setViewName("jsonView");
			
		return mv;
	}
	
	//댓글 insert
	@RequestMapping(value="/insertReply.do",method=RequestMethod.POST)
	public void insertComment(Comment comment){
		
			
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(Calendar.getInstance().getTime());	//현재 날짜..
			
		java.sql.Date sqlDate = java.sql.Date.valueOf(strDate);
		
		
		comment.setReply_date(sqlDate);
		comment.setStringReplyDate(strDate);
		
								
		healthService.insertComment(comment);	//sqlDate 형식으로 insert 했음
		
		
				
		
	}
		
	
	//댓글 삭제
	@RequestMapping(value="/deleteReply.do",method=RequestMethod.POST)
	public void deleteComment(Comment comment){
		healthService.deleteComment(comment);
	}	
	
	//좋아요 테이블에 삽입, 삭제하는 메서드
	@RequestMapping(value="/likeUp.do",method=RequestMethod.POST)
	public ModelAndView likeUp(Like like){
		
		ModelAndView mv = new ModelAndView();
		
		int checkLikeTable = healthService.checkLikeTable(like); //좋아요 테이블에 있는지 확인하는 변수
		// 있으면 1 없으면 0
		
		int userLoginCheck = like.getUser_no();

		if (checkLikeTable == 0 && userLoginCheck != 0) {
			// 좋아요 처음 클릭
			// 좋아요 테이블에 넣음
			healthService.insertLike(like);
			healthService.insertMySchedule(like);

		} else if (checkLikeTable == 1 && userLoginCheck != 0) {
			// 좋아요 두번 클릭
			// 좋아요 테이블에서 삭제
			healthService.deleteLike(like);
			healthService.deleteMySchedule(like);

		}	
		
		mv.addObject("userLoginCheck",userLoginCheck);
		mv.addObject("checkLikeTable",checkLikeTable);
		mv.setViewName("jsonView");
		
		return mv;
	}
	//좋아요 갯수
	@RequestMapping(value="/likeCount.do",method=RequestMethod.POST)
	public ModelAndView likeCount(Like like){
		ModelAndView mv = new ModelAndView();
		
		//좋아요 테이블에서 특정 게시물 좋아요 갯수..
		int likeCount= healthService.selectLikeCount(like.getV_no());
		int checkLikeTable = healthService.checkLikeTable(like);
		
		mv.addObject("checkLikeTable",checkLikeTable);
		mv.addObject("likeCount",likeCount);
		mv.setViewName("jsonView");
		
		return mv;
	}
		
	
	
}
