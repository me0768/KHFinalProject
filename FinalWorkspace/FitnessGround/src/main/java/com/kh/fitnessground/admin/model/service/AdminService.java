package com.kh.fitnessground.admin.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.gym.model.vo.GymQnABoard;
import com.kh.fitnessground.user.model.vo.User;

public interface AdminService {

	


    ArrayList<User> businesslist(int level);


	ArrayList<User> userlist(int level);


	ArrayList<User> businessRequestlist(int level);


	void adminGymRequest(int gym_no);


	void adminGymCancel(int gym_no);


	void meetingBoardDelete(int mb_no);


	void qnaBoardDelete(int cb_no);


	void reviewBoardDelete(int cb_no);


	void adminUserStateChange(int user_no);


	void adminUserStateBack(int user_no);


	int RequestCount(int level);


	void adminBusinessStateChange(int user_no);


	void adminBusinessStateBack(int user_no);


	int Message(int receiver);


	ArrayList<User> GymRequest(int level);


	ArrayList<GymQnABoard> adminBoard();




}
