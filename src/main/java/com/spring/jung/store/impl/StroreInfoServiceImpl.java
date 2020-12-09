package com.spring.jung.store.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bookstore.vo.StoreVO;
import com.spring.jung.store.StoreInfoService;

@Service("storeInfoService")
public class StroreInfoServiceImpl implements StoreInfoService {
	@Autowired
	private StoreInfoDAOMybatis storeDAO;
	
	@Override
	public int Login(StoreVO vo) {
		return storeDAO.Login(vo);
	}

	@Override
	public int Signin(StoreVO vo) {
		return storeDAO.Signin(vo);
	}

	@Override
	public StoreVO getStore(String store_code) {
		return storeDAO.getStore(store_code);
	}

	@Override
	public int storeUpdate(StoreVO vo) {
		return storeDAO.storeUpdate(vo);
	}

	@Override
	public int updatePwd(StoreVO vo) {
		return storeDAO.updatePwd(vo);
	}

	@Override
	public int storeLeave(String store_code) {
		return storeDAO.storeLeave(store_code);
	}

}
