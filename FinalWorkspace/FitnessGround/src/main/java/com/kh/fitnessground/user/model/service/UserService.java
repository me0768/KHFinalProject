package com.kh.fitnessground.user.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.user.model.vo.User;

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
}
