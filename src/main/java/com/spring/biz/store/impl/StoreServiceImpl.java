package com.spring.biz.store.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.store.StoreService;
import com.spring.biz.store.StoreVO;

@Service("storeService")
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private StoreDAO storedao;
	@Override
	public void insertStore(StoreVO vo) {
		storedao.insertStore(vo);
		
	}

	@Override
	public void updateStore(StoreVO vo) {
		storedao.updateStore(vo);
		
	}

	@Override
	public void deleteStore(StoreVO vo) {
		storedao.deleteStore(vo);
		
	}

	@Override
	public StoreVO getStore(String store_code) {
		return storedao.getStore(store_code);
	}

	@Override
	public List<StoreVO> getStoreList() {
		return storedao.getStoreList();
	}

}
