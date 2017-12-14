package com.kh.fitnessground.admin.model.vo;

import java.sql.Date;

public class BusinessRequest {

	private int gym_no;
	private String gym_name;
	private String location;
	private int user_no;
	private int approval_state;
	private String email;
	private String name;
	private int user_level;
	private int user_state;
	private Date register_date;
	
	public  BusinessRequest(){
		super();
	}
	
	
	
	public BusinessRequest(int gym_no, String gym_name, String location, int user_no, int approval_state, String email,
			String name, int user_level, int user_state, Date register_date ) {
		super();
		this.gym_no = gym_no;
		this.gym_name = gym_name;
		this.location = location;
		this.user_no = user_no;
		this.approval_state = approval_state;
		this.email = email;
		this.name = name;
		this.user_level = user_level;
		this.user_state = user_state;
		this.register_date = register_date;
	}



	public int getGym_no() {
		return gym_no;
	}

	public void setGym_no(int gym_no) {
		this.gym_no = gym_no;
	}

	public String getGym_name() {
		return gym_name;
	}

	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getApproval_state() {
		return approval_state;
	}

	public void setApproval_state(int approval_state) {
		this.approval_state = approval_state;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUser_level() {
		return user_level;
	}

	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}


	public int getUser_state() {
		return user_state;
	}



	public void setUser_state(int user_state) {
		this.user_state = user_state;
	}



	public Date getRegister_date() {
		return register_date;
	}



	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}



	@Override
	public String toString() {
		return "BusinessRequest [gym_no=" + gym_no + ", gym_name=" + gym_name + ", location=" + location + ", user_no="
				+ user_no + ", approval_state=" + approval_state + ", email=" + email + ", name=" + name
				+ ", user_level=" + user_level + ", user_state=" + user_state + ", register_date=" + register_date
				+ "]";
	}





	
	
	
}

