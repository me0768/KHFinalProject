package com.kh.fitnessground.community.meetingComment.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.community.meetingComment.model.dao.MeetingCommentDao;
import com.kh.fitnessground.community.meetingComment.model.vo.MeetingCommnet;

@Service("MeetingCommentService")
public class MeetingCommentServiceImpl implements MeetingCommentService{
	
	@Autowired
	MeetingCommentDao MeetingCommentDao;

	@Override
	public ArrayList<MeetingCommnet> meetingCommentList(int mbc_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertComment(int mb_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComment(int mbc_no, int mb_no, int user_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComment(int mb_no, int mbc_no, int user_no, String content) {
		// TODO Auto-generated method stub
		
	}
	
}
