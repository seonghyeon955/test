package com.spring.biz.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("contentOrderService")
public class ContentOrderServiceImpl implements ContentOrderService {
	
	@Autowired
	private ContentOrderDAO contentorderdao;
	
	@Override
	public void insertContentOrder(ContentOrderVO vo) {
		
	}

	@Override
	public void updateontentOrder(ContentOrderVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteContentOrder(ContentOrderVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getContentOrder(int book_no) {
		return null;
	}

	@Override
	public List<ContentOrderVO> getContentOrders(int book_no) {
		return contentorderdao.getContentOrders(book_no);
	}

}
