package com.kh.fitnessground.workout.health.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.kh.fitnessground.workout.health.model.vo.Health;

public interface HealthService {
	
	Health selectOneWorkout(int v_no); //번호에 따라서 띄워줄 객체 불러오는 메서드
	ArrayList<Health> selectWorkoutCategoryList(Health health); //카테고리별 리스트 불러오는 메서드
	void addReadCount(int v_no);
	void updateHealth(int v_no);
	ArrayList<Health> selectAllList(String category1);
	void deleteHealth(int v_no);
	void deleteHealthList(ArrayList<Health> dellist);
	
}
