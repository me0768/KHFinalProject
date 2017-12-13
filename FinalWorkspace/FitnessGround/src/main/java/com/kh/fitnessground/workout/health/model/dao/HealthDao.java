package com.kh.fitnessground.workout.health.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.workout.commentlike.vo.Comment;
import com.kh.fitnessground.workout.commentlike.vo.Like;
import com.kh.fitnessground.workout.health.model.vo.Health;

@Repository("healthDao")
public class HealthDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public Health selectOneWorkout(int v_no) {
		// 영상에 대한 객체 한개
		return sqlSession.selectOne("health.selectOneWorkout",v_no);
		
	}

	public ArrayList<Health> selectWorkoutCategoryList(Health health) {
		// TODO Auto-generated method stub
		
		return (ArrayList)sqlSession.selectList("health.selectCategoryList",health);
	}

	public void addReadCount(int v_no) {
		sqlSession.update("health.addReadCount",v_no);
	}

	public void updateHealth(int v_no) {
		// TODO Auto-generated method stub
		sqlSession.update("health.updateHealth",v_no);
		
	}
	public void deleteHealth(int v_no){
		sqlSession.delete("health.deleteHealth",v_no);
	}
	public void deleteHealthList(ArrayList<Health> list){
		sqlSession.delete("health.deleteHealthList",list);
	}
	
	//댓글 
	public ArrayList<Comment> selectCommentList(int v_no) {
		return (ArrayList)sqlSession.selectList("comment.selectCommentList",v_no);
	}

	public void insertComment(Comment comment) {
		System.out.println("Dao Date Type: " + comment.getReply_date());
		System.out.println("Dao String Type : " + comment.getStringReplyDate());
		sqlSession.insert("comment.insertComment",comment);
		
	}

	public void deleteComment(Comment comment) {
		sqlSession.delete("comment.deleteComment",comment);
		
	}
	
	//좋아요
	
	public int selectLikeCount(int v_no) {
		
		return sqlSession.selectOne("like.selectLikeCount",v_no);
	}

	public ArrayList<Like> selectLikeList() {
		ArrayList<Like> list = (ArrayList)sqlSession.selectList("like.selectLikeList");
		return list;
	}

	public void insertLike(Like like) {
		sqlSession.insert("like.insertLike", like);
		
	}

	public Like selectLike(Like like) {
		
		return sqlSession.selectOne("like.selectLike",like);
	}

	public void deleteLike(Like like) {
		sqlSession.delete("like.deleteLike",like);
		
	}
	
	//좋아요
}
