package com.kh.fitnessground.user.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.user.model.vo.User;

public interface UserService {

	User loginCheck(User vo);

	User list(int user_no);

	User emailCheck(String email);

	User nicknameCheck(String nickname);

	void registerCheck(User user);

}
