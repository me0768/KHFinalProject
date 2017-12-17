package com.kh.fitnessground.workout.yoga.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.workout.yoga.model.dao.YogaDao;
import com.kh.fitnessground.workout.yoga.model.vo.Yoga;

@Repository
@Service("yogaService")
public class YogaServiceImpl implements YogaService{
	@Autowired
	YogaDao yogaDao;
	
	@Override
	public ArrayList<Yoga> selectAllYList(){
		return yogaDao.selectAllYList();
	}
	
	@Override
	public ArrayList<Yoga> selectAllPList(){
		return yogaDao.selectAllPList();
	}
	
	@Override
	public ArrayList<Yoga> selectCList(Yoga yoga){
		return yogaDao.selectCList(yoga);
	}
	
	@Override
	public Yoga selectYoga(int no) {
		return yogaDao.selectYoga(no);
	}
	
	@Override
	public void addReadCount(int v_no, HttpServletRequest request) {
		yogaDao.addReadCount(v_no);
	}

	@Override
	public ArrayList<Yoga> selectAllList(){
		return yogaDao.selectAllList();
	}
	
	@Override
	public ArrayList<Yoga> selectWList(Yoga yoga){
		return yogaDao.selectWList(yoga);
	}
	
	@Override
	public void insertYoga(List<Yoga> ylist, HttpServletRequest request) {
		yogaDao.insertYoga(ylist);
	}
	
	@Override
	public Yoga updateViewYoga(Yoga yoga, HttpServletRequest request) {
		return yogaDao.updateViewYoga(yoga);
	}
	
	@Override
	public void updateYoga(Yoga yoga, HttpServletRequest request) {
		yogaDao.updateYoga(yoga);
	}
	@Override
	public void deleteYoga(Yoga yoga, HttpServletRequest request) {
		yogaDao.deleteYoga(yoga);
	}
	@Override
	public void deleteYogaList(List<Integer> dellist, HttpServletRequest request) {
		yogaDao.deleteYogaList(dellist);
	}
}
