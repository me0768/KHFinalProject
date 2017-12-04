package com.kh.fitnessground.user.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.user.model.vo.User;
import com.kh.fitnessground.user.model.vo.UserSchedule;

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
	
	public User phonecheck(String phone) {
		return sqlSession.selectOne("user.phonecheck", phone);
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

	public ArrayList<UserSchedule> yesterdaySchedule(int userNo) {
		List<UserSchedule> list = sqlSession.selectList("user.yesterdaySchedule", userNo);
		return new ArrayList<UserSchedule>(list);
	}

	public ArrayList<UserSchedule> todaySchedule(int userNo) {
		List<UserSchedule> list = sqlSession.selectList("user.todaySchedule", userNo);
		return new ArrayList<UserSchedule>(list);
	}

	public void userUpdate(User u) {
		sqlSession.update("user.userUpdate", u);
	}

	public void userPwdUpdate(User u) {
		sqlSession.update("user.userPwdUpdate", u);		
	}

	public void userDelete(User u) {
		sqlSession.delete("user.userDelete", u);
	}

	public ArrayList userBoardSearch(String keyword) {
		return (ArrayList) sqlSession.selectList("user.userBoardSearch", keyword);
	}

	public ArrayList<UserSchedule> userAllSchedule(int userNo) {
		List<UserSchedule> list = sqlSession.selectList("user.userAllSchedule", userNo);
		return new ArrayList<UserSchedule>(list);
	}

	public User userPwdSelect(int user_no) {
		return sqlSession.selectOne("user.userPwdSelect", user_no);
	}

	public void userProfileImgUpdate(User u) {
		sqlSession.update("user.userProfileImgUpdate", u);
	}
}
