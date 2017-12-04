package com.kh.fitnessground.user.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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

	void userUpdate(User u);

	void userPwdUpdate(User u);

	void userDelete(User u);

	ArrayList userBoardSearch(String searchkeyword);

	ArrayList<UserSchedule> userAllSchedule(int userNo);
	
	User userPwdSelect(int user_no);

	void userProfileImgUpdate(User u, HttpServletRequest request) throws Exception;
}
