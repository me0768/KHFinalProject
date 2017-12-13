package com.kh.fitnessground.workout.health.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.kh.fitnessground.workout.commentlike.vo.Comment;
import com.kh.fitnessground.workout.commentlike.vo.Like;
import com.kh.fitnessground.workout.health.model.vo.Health;

public interface HealthService {
	
	Health selectOneWorkout(int v_no); //번호에 따라서 띄워줄 객체 불러오는 메서드
	ArrayList<Health> selectWorkoutCategoryList(Health health); //카테고리별 리스트 불러오는 메서드
	void addReadCount(int v_no); //조회수 증가
	void updateHealth(int v_no);
	ArrayList<Health> selectAllList(String category1);
	void deleteHealth(int v_no);
	void deleteHealthList(ArrayList<Health> dellist);
	ArrayList<Comment> selectCommentList(int v_no); //댓글 불러오기
	void insertComment(Comment comment); //댓글 삽입
	void deleteComment(Comment comment); //댓글 삭제
	void updateLike(Like like);	//좋아요
	ArrayList<Like> selectLikeList();
	void insertLike(Like like); //테이블에 넣기
	int checkLikeTable(Like like);	//좋아요 테이블에 있는지 확인
	
}
