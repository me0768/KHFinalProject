package com.kh.fitnessground.workout.yoga.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

public interface YogaService {
	ArrayList<Yoga> selectList();
	Yoga selectYoga(int no);
	void insertYoga(Yoga yoga, HttpServletRequest request);
}
