package com.kh.fitnessground.workout.health.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.fitnessground.workout.health.model.service.HealthService;

@Controller
public class HealthController {
	@Autowired
	private HealthService healthService;
	
}
