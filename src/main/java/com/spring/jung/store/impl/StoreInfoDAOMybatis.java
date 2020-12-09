package com.spring.jung.store.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.bookstore.vo.StoreVO;

@Repository("StoreInfoDAOMybatis")
public class StoreInfoDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	int Login(StoreVO vo) {
		return mybatis.selectOne("storeInfoDAO.login", vo);
	}
	
	int Signin(StoreVO vo) {
		return mybatis.insert("storeInfoDAO.signin", vo);
	}
	
	StoreVO getStore(String store_code) {
		return mybatis.selectOne("storeInfoDAO.getStore", store_code);
	}
	
	int storeUpdate(StoreVO vo) {
		return mybatis.update("storeInfoDAO.storeUpdate", vo);
	}
	
	int updatePwd(StoreVO vo) {
		return mybatis.update("storeInfoDAO.updatePwd", vo);
	}
	
	int storeLeave(String store_code) {
		return mybatis.update("storeInfoDAO.storeLeave", store_code);
	}
}
