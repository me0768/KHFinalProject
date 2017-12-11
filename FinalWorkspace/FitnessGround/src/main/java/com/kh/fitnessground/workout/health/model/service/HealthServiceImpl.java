package com.kh.fitnessground.workout.health.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
}
