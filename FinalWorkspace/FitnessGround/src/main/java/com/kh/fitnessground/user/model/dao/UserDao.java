package com.kh.fitnessground.user.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.user.model.vo.User;

@Repository("userDao")
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public UserDao() {}

	public User logincheck(String email) {
		User user = sqlSession.selectOne("user.selectUser", email);
		return user;
	}

	public User list(int user_no) {
		return sqlSession.selectOne("user.selectInfo", user_no);
	}

	public User emailcheck(String vo) {
		return sqlSession.selectOne("user.emailCheck", vo);
	}

	public User nicknameCheck(String nickname) {
		return sqlSession.selectOne("user.nicknameCheck", nickname);
	}

	public void registerCheck(User user) {
		sqlSession.insert("user.register", user);
	}

	public User findid(User user) {
		return sqlSession.selectOne("user.findid", user);
	}

	public User findpwdCheck(User user) {
		return sqlSession.selectOne("user.findpwdcheck", user);
	}

	public int tmppwd(User user) {
		return sqlSession.update("user.tmppwd", user);
	}
}
