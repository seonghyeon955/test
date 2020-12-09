package com.spring.biz.jego;

import java.util.List;

import com.spring.biz.bookstock.BookStockVO;

public interface JegoService {
	
	List<JegoVO> getjego(int book_no);
	JegoVO getJego(String store_code);
	JegoVO getJego2(String store_code);
	List<JegoVO> getPickupjego(int book_no);
}

