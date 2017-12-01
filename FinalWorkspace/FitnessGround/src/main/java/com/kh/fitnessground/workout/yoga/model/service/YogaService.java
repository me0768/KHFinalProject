package com.kh.fitnessground.workout.yoga.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

public interface YogaService {
	ArrayList<Yoga> selectAllList();
	ArrayList<Yoga> selectCList(String category);
	Yoga selectYoga(int no);
	void insertYoga(Yoga yoga, HttpServletRequest request);
	void updateYoga(Yoga yoga, HttpServletRequest request);
	void deleteYoga(Yoga yoga, HttpServletRequest request);
	void deleteYogaList(List<Yoga> dellist, HttpServletRequest request);
	void addReadCount(int v_no, HttpServletRequest request);
}
