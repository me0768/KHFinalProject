package com.kh.fitnessground.admin.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.user.model.vo.User;

public interface AdminService {

	

	ArrayList<User> userlist(int userno, int userlevel);
		

    ArrayList<User> buisnesslist(int userno, int userlevel);




}
