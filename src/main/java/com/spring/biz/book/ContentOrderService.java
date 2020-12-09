package com.spring.biz.book;

import java.util.List;

public interface ContentOrderService {

	void insertContentOrder(ContentOrderVO vo);
	void updateontentOrder(ContentOrderVO vo);
	void deleteContentOrder(ContentOrderVO vo);
	String getContentOrder(int book_no);
	List<ContentOrderVO> getContentOrders(int book_no);
	
}
