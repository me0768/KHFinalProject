package com.kh.fitnessground.workout.health.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.workout.health.model.dao.HealthDao;
import com.kh.fitnessground.workout.health.model.vo.Health;

@Service("healthService")
public class HealthServiceImpl implements HealthService{
	@Autowired
	HealthDao healthDao;

	
	@Override
	public Health selectWorkout(int vno) {
		// TODO Auto-generated method stub
		return healthDao.selectOneWorkout(vno);
	}

	@Override
	public ArrayList<Health> selectWorkoutCategoryList(String category) {
		// TODO Auto-generated method stub
		return healthDao.selectWorkoutCategoryList(category);
	}
}
