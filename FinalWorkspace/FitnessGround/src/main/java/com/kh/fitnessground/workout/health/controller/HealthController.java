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
	
	@RequestMapping(value="/detail.do")	//썸네일 누르면 누른 v_no로 모달창에서 동영상 재생.. 썸네일은 어케하지..
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
	
	@RequestMapping(value="/playListinsert.do")	//input 태그에 playlist 값 입력 하면 db에 데이터를 넣어야됨..	//미향 부분 view 페이지 보고 참조...
	public ModelAndView HealthInsertMethod(ArrayList<Health> healthList,HttpServletRequest request){
		//insert 작업 해야됨
		
		ModelAndView mv = new ModelAndView("/workout/healthPlaylist");
		
		return mv;
	}
	@RequestMapping(value="/updateview.do") //수정하는 뷰로 이동하는 메서드
	public ModelAndView healthUpdateViewMethod(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("/workout/videoUpdateView");
		Health health = healthService.selectOneWorkout(Integer.parseInt(request.getParameter("v_no")));
		mv.addObject("health",health);
		
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
		
		System.out.println(sqlDate);
		
		comment.setReply_date(sqlDate);
		comment.setStringReplyDate(strDate);
		
		
		System.out.println("comment : "+comment);
				
		healthService.insertComment(comment);	//sqlDate 형식으로 insert 했음
		//select 해 욜떄 null 로 나옴
				
		ArrayList<Comment> selectCommentList = healthService.selectCommentList(comment.getV_no());
		System.out.println("selectCommentList" + selectCommentList);
		
				
		
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
		System.out.println("좋아요 테이블 체크 : " + checkLikeTable);
		System.out.println(like);
		
		int userLoginCheck = like.getUser_no();
		
		if(checkLikeTable==1 && like.getUser_no()!=0){	//있으면 한 영상 좋아요를 누른 사람이 또 좋아요를 누르면
			//좋아요 테이블에서 삭제
			healthService.deleteLike(like);
			healthService.deleteMySchedule(like);
			
		}else if(checkLikeTable==0 && like.getUser_no()!=0){ //없으면 한 영상에 좋아요를 안누른 사람이면
			//좋아요 테이블에 넣음
			healthService.insertLike(like);	
			healthService.insertMySchedule(like);
			
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
		
		int likeCount = healthService.selectLikeCount(like.getV_no());
		mv.addObject("likeCount",likeCount);
		mv.setViewName("jsonView");
		
		return mv;
	}
		
	
	
}
