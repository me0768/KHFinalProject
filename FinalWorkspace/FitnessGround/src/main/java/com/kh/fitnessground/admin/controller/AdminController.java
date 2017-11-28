package com.kh.fitnessground.admin.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminController {

	
	@RequestMapping(value = "adminMain.do", method = RequestMethod.GET)
	public String adminmain(Locale locale, Model model) {
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "charts.do", method = RequestMethod.GET)
	public String charts(Locale locale, Model model) {
		return "admin/charts";
	}
	
	@RequestMapping(value = "tables.do", method = RequestMethod.GET)
	public String tables(Locale locale, Model model) {
		return "admin/tables";
	}

}
