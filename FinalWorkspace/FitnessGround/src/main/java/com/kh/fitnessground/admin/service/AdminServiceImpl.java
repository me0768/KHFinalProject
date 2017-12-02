package com.kh.fitnessground.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.admin.dao.AdminDao;
import com.kh.fitnessground.user.model.dao.UserDao;
import com.kh.fitnessground.user.model.vo.User;

@Service("AdminService")
public class AdminServiceImpl  implements AdminService{

	@Autowired
	AdminDao AdminDao;
	

	public ArrayList<User> userlist(int userno, int userlevel) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<User> buisnesslist(int userno, int userlevel) {
		// TODO Auto-generated method stub
		return null;
	}
}
