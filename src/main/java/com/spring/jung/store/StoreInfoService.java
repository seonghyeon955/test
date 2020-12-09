package com.spring.jung.store;

import com.bit.bookstore.vo.StoreVO;

public interface StoreInfoService {
	
	int Login(StoreVO vo);
	int Signin(StoreVO vo);
	StoreVO getStore(String store_code);
	int storeUpdate(StoreVO vo);
	int updatePwd(StoreVO vo);
	int storeLeave(String store_code);
}
