package com.kh.fitnessground.workout.health.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.workout.commentlike.vo.Comment;
import com.kh.fitnessground.workout.commentlike.vo.Like;
import com.kh.fitnessground.workout.health.model.dao.HealthDao;
import com.kh.fitnessground.workout.health.model.vo.Health;

@Service("healthService")
public class HealthServiceImpl implements HealthService{
	@Autowired
	HealthDao healthDao;

	@Override
	public ArrayList<Health> selectAllList(String category1) {	//맨몸운동에서 쓸거
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Health selectOneWorkout(int v_no) {	//완성
		// TODO Auto-generated method stub
		return healthDao.selectOneWorkout(v_no);
	}

	@Override
	public ArrayList<Health> selectWorkoutCategoryList(Health health) {	//완성
		// TODO Auto-generated method stub
		return healthDao.selectWorkoutCategoryList(health);
	}

	@Override
	public void addReadCount(int v_no) {	//완성
		healthDao.addReadCount(v_no);
		
	}

	//youtube 동영상에서 쓸거
	@Override
	public void updateHealth(int v_no) {
		healthDao.updateHealth(v_no);
		
	}
	
	@Override
	public void deleteHealth(int v_no) {
		healthDao.deleteHealth(v_no);
		
	}

	@Override
	public void deleteHealthList(ArrayList<Health> dellist) {
		healthDao.deleteHealthList(dellist);
		
	}
	
	//댓글 불러오기
	@Override
	public ArrayList<Comment> selectCommentList(int v_no) {
		return healthDao.selectCommentList(v_no);
	}
	//댓글 insert
	@Override
	public void insertComment(Comment comment) {
		System.out.println("Service Date Type: " + comment.getReply_date());
		System.out.println("Service String Type : " + comment.getStringReplyDate());
		healthDao.insertComment(comment);
		
	}
	//댓글 delete
	@Override
	public void deleteComment(Comment comment) {
		healthDao.deleteComment(comment);		
	}

	@Override
	public void updateLike(Like like) {
		healthDao.updateLike(like);
		
	}

	@Override
	public ArrayList<Like> selectLikeList() {
		ArrayList<Like> list = healthDao.selectLikeList();
		return list;
	}

	@Override	
	public void insertLike(Like like) {
		healthDao.insertLike(like);
		
	}

	@Override //좋아요 테이블에 있는지 확인
	public int checkLikeTable(Like like) {
		ArrayList<Like> list = healthDao.selectLikeList();	//좋아요 테이블에 들어가 있는 리스트들 불러옴..
		int result=0;
		
		for(int i=0; i<list.size();i++){
			if(like.getV_no()==list.get(i).getV_no() && like.getUser_no()==list.get(i).getUser_no()){
				result=1;
				break;
			}else{
				result=0;
			}
		}
		
		return result;
	}

	

	
	
}
