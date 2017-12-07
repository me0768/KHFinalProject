package com.kh.fitnessground.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.user.model.vo.User;
import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AdminDao(){}
	
	public ArrayList<User> userlist(int level){
		List<User> ulist = sqlSession.selectList("user.userList", level);
		ArrayList<User> list = new ArrayList<User>(ulist);
		return list;
	};
	


	public ArrayList<User> businesslist(int level) {
		List<User> blist = sqlSession.selectList("user.businessList", level);
		ArrayList<User> list = new ArrayList<User>(blist);
		return list;
	}

	public ArrayList<User> businessRequestlist(int level) {
		List<User> brlist = sqlSession.selectList("gym.businessRequestList", level);
		ArrayList<User> list = new ArrayList<User>(brlist);
		return list;
	}
	
	
	
}
