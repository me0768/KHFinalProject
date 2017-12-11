package com.kh.fitnessground.workout.health.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
