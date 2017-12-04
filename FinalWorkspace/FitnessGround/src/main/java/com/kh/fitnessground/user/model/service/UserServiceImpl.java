package com.kh.fitnessground.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.user.model.dao.UserDao;
import com.kh.fitnessground.user.model.vo.User;
import com.kh.fitnessground.user.model.vo.UserSchedule;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;

	@Override
	public User loginCheck(String email) {
		return userDao.logincheck(email);
	}

	@Override
	public User list(int user_no) {
		return userDao.list(user_no);
	}

	@Override
	public User emailCheck(String vo) {
		return userDao.emailcheck(vo);
	}

	@Override
	public User nicknameCheck(String nickname) {
		return userDao.nicknameCheck(nickname);
	}
	
	@Override
	public User phonecheck(String phone) {
		return userDao.phonecheck(phone);
	}

	@Override
	public void registerCheck(User user) {
		userDao.registerCheck(user);
	}

	@Override
	public User findid(User user) {
		return userDao.findid(user);
	}

	@Override
	public User findpwdCheck(User user) {
		return userDao.findpwdCheck(user);
	}

	@Override
	public int tmppwd(User user) {
		return userDao.tmppwd(user);
	}

	@Override
	public ArrayList<UserSchedule> yesterdaySchedule(int userNo) {
		return userDao.yesterdaySchedule(userNo);
	}

	@Override
	public ArrayList<UserSchedule> todaySchedule(int userNo) {
		return userDao.todaySchedule(userNo);
	}

	@Override
	public void userUpdate(User u) {
		userDao.userUpdate(u);
	}
	
	@Override
	public void userPwdUpdate(User u) {
		userDao.userPwdUpdate(u);
	}

	@Override
	public void userDelete(User u) {
		userDao.userDelete(u);
	}

	@Override
	public ArrayList userBoardSearch(String keyword) {
		return userDao.userBoardSearch(keyword);
	}

	@Override
	public ArrayList<UserSchedule> userAllSchedule(int userNo) {
		return userDao.userAllSchedule(userNo);
	}
}
