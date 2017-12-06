package com.kh.fitnessground.gym.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.gym.model.vo.Gym;
import com.kh.fitnessground.gym.model.vo.GymReview;

@Repository("gymDao")
public class GymDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public boolean RegisterGym(Gym gym) {
		return false;
	}

	public void GymScheduleInsert(int gym_no) {
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<GymReview> selectList(int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	public int enrollReview(GymReview gymreview) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteReview(int gcno) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateReview(int gcno, GymReview gymreview) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Gym> healthList() {
		List<Gym> list = sqlSession.selectList("gym.selectList");
		ArrayList<Gym> glist = (ArrayList<Gym>)list;		
		
		return glist;
	}

	
}
