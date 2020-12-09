package com.spring.biz.book.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.book.BookService;
import com.spring.biz.book.BookVO;

@Service("bookService")
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAOMybatis bookdao;
	@Override
	public void insertBook(BookVO vo) {
		bookdao.insertBook(vo);
	}

	@Override
	public void updateBook(BookVO vo) {
		bookdao.updateBook(vo);
		
	}

	@Override
	public void deleteBook(BookVO vo) {
		bookdao.deleteBook(vo);
		
	}

	@Override
	public BookVO getBook(int book_no) {
		return bookdao.getBook(book_no);
	}

	@Override
	public List<BookVO> getBookVO(int book_no) {
		return bookdao.getBookVO(book_no);
	}

	

}
