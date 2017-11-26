package com.kh.fitnessground.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.user.model.dao.UserDao;
import com.kh.fitnessground.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;

	@Override
	public User loginCheck(User vo) {
		return userDao.logincheck(vo);
	}

	@Override
	public User list(int user_no) {
		return userDao.list(user_no);
	}

	@Override
	public User emailCheck(String vo) {
		return userDao.emailcheck(vo);
	}

}
