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
		List<User> brlist = sqlSession.selectList("gym.businessRequest", level);
		ArrayList<User> list = new ArrayList<User>(brlist);
		return list;
	}

	public void adminGymRequest(int gym_no) {
		sqlSession.update("gym.gymRequest", gym_no);
	}

	public void adminGymCancel(int gym_no) {
		sqlSession.update("gym.gymCancel", gym_no);
		
	}

	public void meetingBoardDelete(int mb_no) {
		sqlSession.delete("community.deleteMeeting", mb_no);
		
	}

	public void qnaBoardDelete(int cb_no) {
		sqlSession.delete("community.deleteQnA", cb_no);
		
	}

	public void reviewBoardDelete(int cb_no) {
		sqlSession.delete("community.deleteReview", cb_no);
	}

	public void userStateChange(int user_no) {
		sqlSession.update("user.userChange", user_no);
		
	}

	public void userStateBack(int user_no) {
		sqlSession.update("user.userBack", user_no);
		
	}

	public int RequestCount(int level) {
		int cnt = sqlSession.selectOne("gym.RequestCount", level);
		return cnt;
	}

	public void businessStateChange(int user_no) {
		sqlSession.update("gym.businessChange", user_no);
		sqlSession.update("user.userChange", user_no);
		
	}

	public void businessStateBack(int user_no) {
		sqlSession.update("user.userBack", user_no);
		
	}


	
	
	
}
