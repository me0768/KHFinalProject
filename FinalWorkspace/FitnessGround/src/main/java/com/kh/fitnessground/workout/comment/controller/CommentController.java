package com.kh.fitnessground.workout.comment.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("댓글 리스트 : " + list);
		mv.addObject("commentList",list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping(value="/insertReply.do",method=RequestMethod.POST)
	public void insertComment(Comment comment){
		commentService.insertComment(comment);
	}
	
	
}
