package com.kh.fitnessground.gym.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fitnessground.gym.model.vo.Gym;
import com.kh.fitnessground.gym.model.vo.GymReview;
import com.kh.fitnessground.gym.model.vo.GymSchedule;
import com.kh.fitnessground.gym.model.vo.PublicGym;

@Repository("gymDao")
public class GymDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getPublicListCount()
	{
		return sqlSession.selectOne("gym.selectPublicCount");
	}
	
	public void RegisterGymImage(Gym gym) {
		sqlSession.insert("gym.InsertImage", gym);
	}

	public void GymScheduleInsert(int gym_no) {
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gym.selectGymCount");
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

	public ArrayList<Gym> healthList(HashMap<String, Object> parameters) { 
		List<Gym> list = sqlSession.selectList("gym.selectGymList", parameters);
	//	List<Gym> list = sqlSession.selectList("gym.selectGymList");
		ArrayList<Gym> glist = (ArrayList<Gym>)list;		
		
		return glist;
	}

	public ArrayList<PublicGym> publicList(HashMap<String, Object> parameters) {
		List<PublicGym> list = sqlSession.selectList("gym.selectPublicList", parameters);
		//	List<Gym> list = sqlSession.selectList("gym.selectGymList");
			ArrayList<PublicGym> glist = (ArrayList<PublicGym>) list;		
			
			return glist;
	}

	public void RegisterGymContent(Gym gym) {
		sqlSession.update("gym.InsertGym", gym);
	}

	public Gym selectfromImg(Gym gym) {
		return sqlSession.selectOne("gym.selectfromImg", gym);
	}

	public void OneSchedule(GymSchedule gs) {
		sqlSession.insert("gymschedule.OneSchedule", gs);
	}

	public int regCount(Gym gym) {
		return sqlSession.selectOne("gym.regCount", gym);
	}

	public ArrayList<Gym> mygymlist(Gym gym) {
		List<Gym> list = sqlSession.selectList("gym.mygymlist", gym);
		return (ArrayList<Gym>)list;
	}

	public int regCountName(Gym gym) {
		return sqlSession.selectOne("gym.regCountName", gym);
	}

	public ArrayList<Gym> mygymListName(Gym gym) {
		List<Gym> list = sqlSession.selectList("gym.mygymlistName", gym);
		return (ArrayList<Gym>)list;
	}

	public void deleteGym(Gym gym) {
		sqlSession.update("gym.deleteGym", gym);
	}

	public Gym selectOne(Gym gym) {
		return sqlSession.selectOne("gym.detailselect", gym);
	}

	
}
