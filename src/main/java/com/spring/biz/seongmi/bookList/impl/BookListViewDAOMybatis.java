package com.spring.biz.seongmi.bookList.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.seongmi.bookList.BookListViewVO;

@Repository("BookListViewDAOMybatis")
public class BookListViewDAOMybatis {

	@Autowired
	public SqlSessionTemplate mybatis;
	
	public List<BookListViewVO> getSearchList(String keyword){
		System.out.println(">> Mybatis로 getSearchList 실행");
		return mybatis.selectList("bookListViewDAO.getSearchList", keyword);
	}
	
	public List<BookListViewVO> bestSeller(){
		return mybatis.selectList("bookListViewDAO.getBestSeller");
	}
	
	public List<BookListViewVO> newBook(){
		return mybatis.selectList("bookListViewDAO.getnewBook");
	}
	
	public List<BookListViewVO> steadySeller(){
		return mybatis.selectList("bookListViewDAO.getSteadySeller");
	}
	
	public List<BookListViewVO> bookListView(BookListViewVO vo){
		return mybatis.selectList("bookListViewDAO.bookListView", vo);
	}
	
	public int cartUpdateValue(String id) {
		return mybatis.selectOne("bookListViewDAO.cartUpdateValue", id);
	}
}
