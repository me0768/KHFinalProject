package com.kh.fitnessground.gym.model.vo;

import java.sql.Date;

public class GymSchedule {
	private int gs_no;
	private int gym_no;
	private Date day;
	private String schedule_time;
	private String title;
	
	public GymSchedule() {
		super();
	}

	public GymSchedule(int gs_no, int gym_no, Date day, String schedule_time, String title) {
		super();
		this.gs_no = gs_no;
		this.gym_no = gym_no;
		this.day = day;
		this.schedule_time = schedule_time;
		this.title = title;
	}

	public int getGs_no() {
		return gs_no;
	}

	public void setGs_no(int gs_no) {
		this.gs_no = gs_no;
	}

	public int getGym_no() {
		return gym_no;
	}

	public void setGym_no(int gym_no) {
		this.gym_no = gym_no;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public String getSchedule_time() {
		return schedule_time;
	}

	public void setSchedule_time(String schedule_time) {
		this.schedule_time = schedule_time;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "GymSchedule [gs_no=" + gs_no + ", gym_no=" + gym_no + ", day=" + day + ", schedule_time="
				+ schedule_time + ", title=" + title + "]";
	}
	
	
}