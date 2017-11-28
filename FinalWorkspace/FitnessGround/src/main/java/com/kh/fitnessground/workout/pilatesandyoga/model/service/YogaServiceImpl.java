package com.kh.fitnessground.workout.pilatesandyoga.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.workout.pilatesandyoga.model.dao.YogaDao;

@Service("yogaService")
public class YogaServiceImpl implements YogaService{
	@Autowired
	YogaDao yogaDao;
}
