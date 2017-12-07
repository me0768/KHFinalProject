package com.kh.fitnessground.admin.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.user.model.vo.User;

public interface AdminService {

	


    ArrayList<User> businesslist(int level);


	ArrayList<User> userlist(int level);


	ArrayList<User> businessRequestlist(int level);




}
