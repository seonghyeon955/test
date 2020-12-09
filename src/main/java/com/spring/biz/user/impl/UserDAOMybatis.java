package com.spring.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.bookstore.vo.UserVO;

@Repository("UserDAOMybatis")
public class UserDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	int GetCheckId(String id) {
		return mybatis.selectOne("userDAO.checkId", id);
	}
	
	int UserSignUp(UserVO vo) {
		return mybatis.insert("userDAO.signup", vo);
	}
	
	int Login(UserVO vo) {
		return mybatis.selectOne("userDAO.login", vo);
	}
	
	int LoginUpdate (String id) {
		return mybatis.update("userDAO.loginUpdate", id);
	}
	
	int GetCartIdxCnt (String user_id) {
		return mybatis.selectOne("userDAO.selectCartIdxCnt", user_id);
	}
	
	UserVO GetUser(String id) {
		return mybatis.selectOne("userDAO.getUser", id);
	}
	
	List<String> FindID(UserVO vo) {
		return mybatis.selectList("userDAO.findID", vo);
	}
	
	int FindPwd(UserVO vo) {
		return mybatis.selectOne("userDAO.findPwd", vo);
	}
	
	int UpdatePwd(UserVO vo) {
		return mybatis.update("userDAO.updatePwd", vo);
	}
	
	UserVO GetUserInfo (String id) {
		return mybatis.selectOne("userDAO.getUserInfo", id);
	}
	
	int userUpdate (UserVO vo) {
		return mybatis.update("userDAO.userUpdate", vo);
	}
	
	int userLeave(String id) {
		return mybatis.update("userDAO.userLeave", id);
	}
	
}
