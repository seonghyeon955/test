package com.spring.biz.bookstock.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.bookstock.BookStockVO;

@Repository
public class BookStockDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public BookStockDAO() {
		System.out.println(">> BookStockDAO 객체 생성");
	};
	
	public void insertBookStock(BookStockVO vo) {
		mybatis.insert("bookstockmapper.insertStock", vo);
	}
	
	public void updateBookStock(BookStockVO vo) {
		mybatis.update("bookstockmapper.updateStock", vo);
	}
	
	public void deleteBookStock(BookStockVO vo) {
		mybatis.delete("bookstockmapper.deleteStock", vo);
	}
	
//	public BookStockVO getBookstock(int book_no) {
//		BookStockVO bookstockvo = mybatis.selectOne("bookstockmapper.selectStock", book_no);
//		return bookstockvo;
//	} 필요없음
	
	public List<BookStockVO> getBookStockList(int book_no){
		return mybatis.selectList("bookstockmapper.selectStocks", book_no);
	}
	
}
