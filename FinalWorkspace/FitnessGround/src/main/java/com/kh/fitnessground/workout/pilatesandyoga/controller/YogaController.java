package com.kh.fitnessground.workout.pilatesandyoga.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.fitnessground.workout.pilatesandyoga.model.service.YogaService;

@Controller
public class YogaController {
	@Autowired
	private YogaService yogaService;
}
