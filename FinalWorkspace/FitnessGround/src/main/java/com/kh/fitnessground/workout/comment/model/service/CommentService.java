package com.kh.fitnessground.workout.comment.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.workout.comment.model.vo.Comment;

public interface CommentService {

	ArrayList<Comment> selectCommentList(int v_no);

	

}
