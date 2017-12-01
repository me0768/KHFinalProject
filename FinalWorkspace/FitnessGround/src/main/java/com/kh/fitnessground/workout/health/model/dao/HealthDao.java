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

	public ArrayList<Health> getList() {
		// 전체 리스트
		return (ArrayList)sqlSession.selectList("health.getList()");
	}

	public Health selectOneWorkout(int vno) {
		// 영상에 대한 객체 한개
		return sqlSession.selectOne("health.selectOneWorkout",vno);
		
	}

	public ArrayList<Health> selectWorkoutCategoryList(String category1,String category2) {
		// TODO Auto-generated method stub
		HashMap<String,String> category = new HashMap<String,String>();	//파라미터 두개 못보냄.. hashmap 으로..
		category.put("category1", category1);
		category.put("category2", category2);
		return (ArrayList)sqlSession.selectList("health.selectCategoryList",category);
	}

	public void addReadCount(int v_no) {
		sqlSession.update("health.addReadCount",v_no);
	}
}
