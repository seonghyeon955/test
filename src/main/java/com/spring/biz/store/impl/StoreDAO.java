package com.spring.biz.store.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.store.StoreVO;

@Repository
public class StoreDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public StoreDAO() {
		System.out.println(">>>StoreDAO 객체생성");
		
	}
	
	public void insertStore(StoreVO vo) {
		mybatis.insert("storemapper.insertStore", vo);
	}
	
	public void updateStore(StoreVO vo) {
		mybatis.update("storemapper.updateStore", vo);
	}
	public void deleteStore(StoreVO vo) {
		mybatis.delete("storemapper.deleteStore", vo);
	}
	
	public StoreVO getStore(String store_code) {
		System.out.println("store_code : " + store_code);
		StoreVO storevo = mybatis.selectOne("storemapper.selectStore", store_code);
		return storevo;
		
	}
	public List<StoreVO> getStoreList(){
		return mybatis.selectList("storemapper.selectStores");
	}
	
}
