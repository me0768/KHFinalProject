package com.kh.fitnessground.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.admin.model.dao.AdminDao;
import com.kh.fitnessground.user.model.dao.UserDao;
import com.kh.fitnessground.user.model.vo.User;

@Service("adminService")
public class AdminServiceImpl  implements AdminService{

	@Autowired
	private AdminDao adminDao;



	@Override
	public ArrayList<User> userlist(int level) {
		// TODO Auto-generated method stub
		return adminDao.userlist(level);
	}


	@Override
	public ArrayList<User> buisnesslist(int level) {
		// TODO Auto-generated method stub
		return adminDao.businesslist(level);
	}


	@Override
	public ArrayList<User> buisnessRequestlist(int level) {
		// TODO Auto-generated method stub
		return adminDao.businessRequestlist(level);
	}
	

	
}
