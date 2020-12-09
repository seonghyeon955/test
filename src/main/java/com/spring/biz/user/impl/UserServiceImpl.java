package com.spring.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bookstore.vo.UserVO;
import com.spring.biz.user.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAOMybatis userDAO;
	
	@Override
	public int ID_Check(String id) {
		return userDAO.GetCheckId(id);
	}

	@Override
	public int UserSingup(UserVO vo) {
		return userDAO.UserSignUp(vo);
	}

	@Override
	public int Login(UserVO vo) {
		return userDAO.Login(vo);
	}

	@Override
	public int LoginUpdate(String id) {
		return userDAO.LoginUpdate(id);
	}

	@Override
	public int getCartIdxCnt(String user_id) {
		return userDAO.GetCartIdxCnt(user_id);
	}

	@Override
	public UserVO getUser(String id) {
		return userDAO.GetUser(id);
	}

	@Override
	public List<String> findId(UserVO vo) {
		return userDAO.FindID(vo);
	}

	@Override
	public int findPwd(UserVO vo) {
		return userDAO.FindPwd(vo);
	}

	@Override
	public int updatePwd(UserVO vo) {
		return userDAO.UpdatePwd(vo);
	}

	@Override
	public UserVO getUserInfo(String id) {
		return userDAO.GetUserInfo(id);
	}

	@Override
	public int userUpdate(UserVO vo) {
		return userDAO.userUpdate(vo);
	}

	@Override
	public int userLeave(String id) {
		return userDAO.userLeave(id);
	}
	
	


}
