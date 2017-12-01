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
	public ArrayList<Health> selectAllList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Health selectWorkout(int vno) {
		// TODO Auto-generated method stub
		return healthDao.selectOneWorkout(vno);
	}

	@Override
	public ArrayList<Health> selectWorkoutCategoryList(String category1,String category2) {
		// TODO Auto-generated method stub
		return healthDao.selectWorkoutCategoryList(category1,category2);
	}

	@Override
	public void addReadCount(int v_no) {
		healthDao.addReadCount(v_no);
		
	}

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
