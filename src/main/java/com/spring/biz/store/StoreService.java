package com.spring.biz.store;

import java.util.List;

public interface StoreService {

	void insertStore(StoreVO vo);
	void updateStore(StoreVO vo);
	void deleteStore(StoreVO vo);
	StoreVO getStore(String store_code);
	List<StoreVO> getStoreList();
}
