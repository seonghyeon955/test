package com.spring.biz.bookstock.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.bookstock.BookStockService;
import com.spring.biz.bookstock.BookStockVO;

@Service("bookstockService")
public class BookStockServiceImpl implements BookStockService {
	@Autowired
	private BookStockDAO bookstockdao;
	
	@Override
	public void insertBookStock(BookStockVO vo) {
		bookstockdao.insertBookStock(vo);
		
	}

	@Override
	public void updateBookStock(BookStockVO vo) {
		bookstockdao.updateBookStock(vo);
		
	}

	@Override
	public void deleteBookStock(BookStockVO vo) {
		bookstockdao.deleteBookStock(vo);
		
	}

//	@Override
//	public BookStockVO getBookStock(int book_no) {
//		return bookstockdao.getBookstock(book_no);
//		
//	}

	@Override
	public List<BookStockVO> getBookStockList(int book_no) {
		return bookstockdao.getBookStockList(book_no);
	}

	

	
}
