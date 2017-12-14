package com.kh.fitnessground.gym.model.service;

import java.util.ArrayList;

import com.kh.fitnessground.gym.model.vo.Gym;
import com.kh.fitnessground.gym.model.vo.GymReview;
import com.kh.fitnessground.gym.model.vo.GymSchedule;
import com.kh.fitnessground.gym.model.vo.PublicGym;

public interface GymService {
		//헬스장 이미지 등록
		void RegisterGymImage(Gym gym);
		// 헬스장 스케줄 등록
		void GymScheduleInsert(int gym_no);
		
		// 게시글 개수
		int getListCount();
		// 목록 가져오기
		ArrayList<GymReview> selectList(int limit);
		
		// 헬스장 목록 가져오기
		ArrayList<Gym> healthList(int currentPage, int limit);
	//	ArrayList<Gym> healthList();
		//등록
		int enrollReview(GymReview gymreview);
		//삭제
		int deleteReview(int gcno);
			//수정
		int updateReview(int gcno, GymReview gymreview);
		
		int getPublicListCount();
		
		ArrayList<PublicGym> publicList(int currentPage, int limit);
		
		void RegisterGymContent(Gym gym);
		
		Gym selectfromImg(Gym gym);
		
		void OneSchedule(GymSchedule gs);
		
		int regCount(Gym gym);
		
		ArrayList<Gym> mygymlist(Gym gym);
		
		int regCountName(Gym gym);
		
		ArrayList<Gym> mygymlistName(Gym gym);
		
		void deleteGym(Gym gym);
		
		Gym selectOne(Gym gym);

}
