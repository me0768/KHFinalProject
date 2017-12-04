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
		return sqlSession.selectOne("user.userList", level);
	};
	


	public ArrayList<User> businesslist(int level) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.businessList", level);
	}
	
	
	
}
