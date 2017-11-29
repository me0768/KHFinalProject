package com.kh.fitnessground.workout.health.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.workout.health.model.vo.Health;

public interface HealthService {
	ArrayList<Health> getList();	//전체 운동법 리스트 불러오는 메서드
	Health selectWorkout(int vno); //번호에 따라서 띄워줄 객체 불러오는 메서드
	
}
