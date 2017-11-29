package com.kh.fitnessground.workout.pilatesandyoga.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("yogaDao")
public class YogaDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
