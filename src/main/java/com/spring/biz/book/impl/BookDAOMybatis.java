package com.spring.biz.book.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.book.BookVO;

@Repository
public class BookDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public BookDAOMybatis() {
		System.out.println(">> BookDAOMybatis객체 생성");
	};
	
	public void insertBook(BookVO vo) {
		mybatis.insert("bookmapper.insertBook", vo);
	}
	
	public void updateBook(BookVO vo) {
		mybatis.update("bookmapper.updateBook", vo);
	}
	
	public void deleteBook(BookVO vo) {
		mybatis.delete("bookmapper.deleteBook", vo);
	}
	
	public BookVO getBook(int book_no) {
		System.out.println("bookdao에서 >>>>>>>>" +book_no);
		BookVO book = mybatis.selectOne("bookmapper.selectbook", book_no);
		//int i = mybatis.selectOne("bookmapper.test");
		//System.out.println("i  :" + i);
		System.out.println("book>>" + book);
		return book;
	}
	
	
	
	public List<BookVO> getBookVO(int book_no){
		return mybatis.selectList("bookmapper.selectbooks");
	}
	
	
	
}
