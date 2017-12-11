package com.kh.fitnessground.workout.comment.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fitnessground.workout.comment.model.service.CommentService;
import com.kh.fitnessground.workout.comment.model.vo.Comment;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	//댓글 불러오기
	@RequestMapping("/selectComment.do")
	public ModelAndView selectCommentList(Comment comment){
		
		ModelAndView mv = new ModelAndView("workout/detailView");
		
		ArrayList<Comment> list = commentService.selectCommentList(comment.getV_no());
		System.out.println("list : " + list);

		mv.addObject("commentList",list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
}
