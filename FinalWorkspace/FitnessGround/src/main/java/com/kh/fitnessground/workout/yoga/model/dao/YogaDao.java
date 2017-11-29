package com.kh.fitnessground.workout.yoga.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

@Repository("yogaDao")
public class YogaDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Yoga> selectYogaList() {
		List<Yoga> ylist = sqlSession.selectList("yoga.selectList");
		ArrayList<Yoga> list = new ArrayList<Yoga>(ylist);
		return list;
	}

	public Yoga selectYoga(int no) {
		return (Yoga)sqlSession.selectOne("yoga.selectYoga", no);
	}
	public void insertYoga(Yoga yoga) {
		sqlSession.insert("yoga.insertYoga", yoga);
	}

}
