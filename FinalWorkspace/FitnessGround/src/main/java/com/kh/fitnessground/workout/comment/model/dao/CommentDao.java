package com.kh.fitnessground.workout.comment.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.workout.comment.model.vo.Comment;

@Repository("commentDao")
public class CommentDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CommentDao(){}

	public ArrayList<Comment> selectCommentlist(int v_no) {
		
		return (ArrayList)sqlSession.selectList("comment.selectCommentList",v_no);
	}

	public void insertComment(Comment comment) {
		sqlSession.insert("comment.insertComment",comment);
		
	}

	

}
