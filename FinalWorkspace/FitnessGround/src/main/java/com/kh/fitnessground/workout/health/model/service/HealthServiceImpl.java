package com.kh.fitnessground.workout.health.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.workout.health.model.dao.HealthDao;

@Service("healthService")
public class HealthServiceImpl implements HealthService{
	@Autowired
	HealthDao healthDao;
}
