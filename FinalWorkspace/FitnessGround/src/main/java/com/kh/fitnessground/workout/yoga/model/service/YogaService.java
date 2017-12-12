package com.kh.fitnessground.workout.yoga.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

public interface YogaService {
	
	ArrayList<Yoga> selectAllYList();
	ArrayList<Yoga> selectAllPList();
	ArrayList<Yoga> selectCList(Yoga yoga);
	Yoga selectYoga(int no);
	void insertYoga(List<Yoga> ylist, HttpServletRequest request);
	void updateYoga(Yoga yoga, HttpServletRequest request);
	void deleteYoga(Yoga yoga, HttpServletRequest request);
	void deleteYogaList(List<Yoga> dellist, HttpServletRequest request);
	void addReadCount(int v_no, HttpServletRequest request);
	ArrayList<Yoga> selectAllList();
	
	
}
