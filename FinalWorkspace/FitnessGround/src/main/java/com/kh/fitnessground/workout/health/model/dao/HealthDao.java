package com.kh.fitnessground.workout.health.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.workout.health.model.vo.Health;

@Repository("healthDao")
public class HealthDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Health> getList() {
		// 전체 리스트
		return (ArrayList)sqlSession.selectList("health.getList()");
	}

	public Health selectOneWorkout(int vno) {
		// 영상에 대한 객체 한개
		return sqlSession.selectOne("health.selectOneWorkout",vno);
		
	}

	public ArrayList<Health> selectWorkoutCategoryList(String category) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("health.selectWorkoutCategoryList",category);
	}
}
