package com.spring.biz.bookstock;

import java.util.List;

public interface BookStockService {
	void insertBookStock(BookStockVO vo);
	void updateBookStock(BookStockVO vo);
	void deleteBookStock(BookStockVO vo);
//	BookStockVO getBookStock(int book_no);
	List<BookStockVO> getBookStockList(int book_no);
}
