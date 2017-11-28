package com.kh.fitnessground.workout.health.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("healthDao")
public class HealthDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
