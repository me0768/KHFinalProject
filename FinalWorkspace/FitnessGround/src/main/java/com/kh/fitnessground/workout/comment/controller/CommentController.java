package com.kh.fitnessground.workout.comment.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.workout.comment.model.service.CommentService;
import com.kh.fitnessground.workout.comment.model.vo.Comment;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	//댓글 불러오기
	@RequestMapping(value="/selectComment.do")
	public ModelAndView selectCommentList(Comment comment){
		
		ModelAndView mv = new ModelAndView("workout/detailView");
		
		ArrayList<Comment> list = commentService.selectCommentList(comment.getV_no());
	
		mv.addObject("commentList",list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//댓글 insert
	@RequestMapping(value="/insertReply.do",method=RequestMethod.POST)
	public void insertComment(Comment comment){
		//db엔 날짜 들어감 insert 할때 Date 타입 sysdate로 insert
		//select 할때 to_char()로 문자열로 가져옴
		System.out.println("가져온 날짜 : " + comment.getReply_date()); //null
		
		//datebase 엔 insert 가 되는데 mapper 을 사용해서 자동 매칭이 안됨
		//resultMap 새로 만들어보기..

		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a");
				
		commentService.insertComment(comment);
	}
	
	@RequestMapping(value="/deleteReply.do",method=RequestMethod.POST)
	public void deleteComment(Comment comment){
		commentService.deleteComment(comment);
	}
	
	
}
