package com.kh.fitnessground.user.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.user.model.vo.User;
import com.kh.fitnessground.user.model.vo.UserSchedule;

public interface UserService {

	User loginCheck(String email);

	User list(int user_no);

	User emailCheck(String email);

	User nicknameCheck(String nickname);
	
	User phonecheck(String phone);

	void registerCheck(User user);

	User findid(User user);

	User findpwdCheck(User user);

	int tmppwd(User user);

	ArrayList<UserSchedule> yesterdaySchedule(int userNo);

	ArrayList<UserSchedule> todaySchedule(int userNo);
}
