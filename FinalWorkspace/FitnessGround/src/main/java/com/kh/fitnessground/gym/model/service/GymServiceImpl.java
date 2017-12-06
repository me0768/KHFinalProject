package com.kh.fitnessground.gym.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.gym.model.dao.GymDao;
import com.kh.fitnessground.gym.model.vo.Gym;
import com.kh.fitnessground.gym.model.vo.GymReview;

@Service("gymService")
public class GymServiceImpl implements GymService{
	@Autowired
	GymDao gymDao;
	
	@Override
	public boolean RegisterGym(Gym gym) {
		return gymDao.RegisterGym(gym);
	}

	@Override
	public void GymScheduleInsert(int gym_no) {
		gymDao.GymScheduleInsert(gym_no);
	}
	
	@Override
	public int getListCount() {
		return gymDao.getListCount();
	}

	@Override
	public ArrayList<GymReview> selectList(int limit) {
		return gymDao.selectList(limit);
	}

	@Override
	public int enrollReview(GymReview gymreview) {
		return gymDao.enrollReview(gymreview);
	}

	@Override
	public int deleteReview(int gcno) {
		return gymDao.deleteReview(gcno);
	}

	@Override
	public int updateReview(int gcno, GymReview gymreview) {
		return gymDao.updateReview(gcno,gymreview);
	}

	@Override
	public ArrayList<Gym> healthList() {
		return gymDao.healthList();
	}
}
