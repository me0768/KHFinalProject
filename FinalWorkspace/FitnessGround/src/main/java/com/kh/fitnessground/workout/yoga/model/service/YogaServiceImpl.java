package com.kh.fitnessground.workout.yoga.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.workout.yoga.model.dao.YogaDao;
import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

@Repository
@Service("yogaService")
public class YogaServiceImpl implements YogaService{
	@Autowired
	YogaDao yogaDao;
	
	@Override
	public ArrayList<Yoga> selectList(){
		return yogaDao.selectYogaList();
	}
	
	@Override
	public Yoga selectYoga(int no) {
		return yogaDao.selectYoga(no);
	}
	
	@Override
	public void insertYoga(Yoga yoga, HttpServletRequest request) {
		
	}
}
