package com.kh.fitnessground.admin.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.user.model.vo.User;

@Repository("AdminDao")
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<User> userlist;
	
	public ArrayList<User> businesslist;
	
	
	
}
