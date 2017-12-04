package com.kh.fitnessground.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.admin.model.dao.AdminDao;
import com.kh.fitnessground.user.model.vo.User;

@Service("adminService")
public class AdminServiceImpl  implements AdminService{

	@Autowired
	private AdminDao adminDao;
	

	public ArrayList<User> userlist(int userno, int userlevel) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<User> buisnesslist(int userno, int userlevel) {
		// TODO Auto-generated method stub
		return null;
	}
}
