package com.spring.biz.book;

import java.util.List;

public interface BookService {
	void insertBook(BookVO vo);
	void updateBook(BookVO vo);
	void deleteBook(BookVO vo);
	BookVO getBook(int book_no);
	List<BookVO> getBookVO(int book_no);
	
	
}
