package com.kh.fitnessground.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.admin.model.dao.AdminDao;
import com.kh.fitnessground.gym.model.vo.GymQnABoard;
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
	public ArrayList<User> businesslist(int level) {
		// TODO Auto-generated method stub
		return adminDao.businesslist(level);
	}


	@Override
	public ArrayList<User> businessRequestlist(int level) {
		// TODO Auto-generated method stub
		return adminDao.businessRequestlist(level);
	}


	@Override
	public void adminGymRequest(int gym_no) {
		adminDao.adminGymRequest(gym_no);
		
	}


	@Override
	public void adminGymCancel(int gym_no) {
		adminDao.adminGymCancel(gym_no);
		
	}


	@Override
	public void meetingBoardDelete(int mb_no) {
		adminDao.meetingBoardDelete(mb_no);
		
	}


	@Override
	public void qnaBoardDelete(int cb_no) {
		adminDao.qnaBoardDelete(cb_no);
		
	}


	@Override
	public void reviewBoardDelete(int cb_no) {
		adminDao.reviewBoardDelete(cb_no);
		
	}


	@Override
	public void adminUserStateChange(int user_no) {
		adminDao.userStateChange(user_no);
		
	}


	@Override
	public void adminUserStateBack(int user_no) {
		adminDao.userStateBack(user_no);
		
	}


	@Override
	public int RequestCount(int level) {
		return adminDao.RequestCount(level);
	}


	@Override
	public void adminBusinessStateChange(int user_no) {
		adminDao.businessStateChange(user_no);
		
	}


	@Override
	public void adminBusinessStateBack(int user_no) {
		adminDao.businessStateBack(user_no);
		
	}


	@Override
	public int Message(int receiver) {
		return adminDao.Message(receiver);
	}


	@Override
	public ArrayList<User> GymRequest(int level) {
		return adminDao.GymRequest(level);
	}


	@Override
	public ArrayList<GymQnABoard> adminBoard() {
		return adminDao.adminBoard();
	}




	
}
