package com.kh.fitnessground.user.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fitnessground.common.util.FileUtils;
import com.kh.fitnessground.gym.model.vo.GymQnABoard;
import com.kh.fitnessground.gym.model.vo.GymQnABoardPage;
import com.kh.fitnessground.user.model.dao.UserDao;
import com.kh.fitnessground.user.model.vo.User;
import com.kh.fitnessground.user.model.vo.UserSchedule;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public User loginCheck(String email) {
		return userDao.logincheck(email);
	}

	@Override
	public User list(int user_no) {
		return userDao.list(user_no);
	}

	@Override
	public User emailCheck(String vo) {
		return userDao.emailcheck(vo);
	}

	@Override
	public User nicknameCheck(String nickname) {
		return userDao.nicknameCheck(nickname);
	}
	
	@Override
	public User phonecheck(String phone) {
		return userDao.phonecheck(phone);
	}

	@Override
	public void registerCheck(User user) {
		userDao.registerCheck(user);
	}

	@Override
	public User findid(User user) {
		return userDao.findid(user);
	}

	@Override
	public User findpwdCheck(User user) {
		return userDao.findpwdCheck(user);
	}

	@Override
	public int tmppwd(User user) {
		return userDao.tmppwd(user);
	}

	@Override
	public ArrayList<UserSchedule> yesterdaySchedule(int userNo) {
		return userDao.yesterdaySchedule(userNo);
	}

	@Override
	public ArrayList<UserSchedule> todaySchedule(int userNo) {
		return userDao.todaySchedule(userNo);
	}

	@Override
	public void userUpdate(User u) {
		userDao.userUpdate(u);
	}
	
	@Override
	public void userPwdUpdate(User u) {
		userDao.userPwdUpdate(u);
	}

	@Override
	public void userDelete(User u) {
		userDao.userDelete(u);
	}

	@Override
	public ArrayList<UserSchedule> userAllSchedule(int userNo) {
		return userDao.userAllSchedule(userNo);
	}
	
	@Override
	public User userPwdSelect(int user_no) {
		return userDao.userPwdSelect(user_no);
	}

	@Override
	public void userProfileImgUpdate(User u, HttpServletRequest request) throws Exception {
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(request);
		System.out.println(list);
		String originalFileName="", renameFileName="";
		for(int i=0, size=list.size(); i<size; i++){
			originalFileName = (String) list.get(i).get("original_fileName");
			renameFileName = (String) list.get(i).get("rename_fileName");
		}
		if(originalFileName!="" || !originalFileName.equals("")) {
			u.setOriginal_image(originalFileName);
			u.setRename_image(renameFileName);
		}
		userDao.userProfileImgUpdate(u);
	}

	@Override
	public int qnABoardCount(int user_no) {
		return userDao.qnABoardCount(user_no);
	}

	@Override
	public ArrayList<GymQnABoard> qnABoardList(GymQnABoardPage qPage, int user_no) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("qPage", qPage);
		parameters.put("user_no", user_no);
		return userDao.qnABoardList(parameters);
	}

	@Override
	public int qnABoardSearchCount(int user_no, String keyword) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();
	    parameters.put("user_no", user_no);
	    parameters.put("keyword", "%"+keyword+"%");
		return userDao.qnABoardSearchCount(parameters);
	}

	@Override
	public ArrayList<GymQnABoard> qnABoardSearch(GymQnABoardPage qPage, String keyword, int user_no) {
		HashMap<String, Object> parameters = new HashMap<String, Object>();
	    parameters.put("qPage", qPage);
	    parameters.put("keyword", "%"+keyword+"%");
	    parameters.put("user_no", user_no);
		return userDao.qnaBoardSearch(parameters);
	}
}
