package com.spring.biz.seongmi.bookList.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.seongmi.bookList.BookListViewService;
import com.spring.biz.seongmi.bookList.BookListViewVO;

@Service("bookListViewService")
public class BookListViewServiceImpl implements BookListViewService{
	@Autowired
	private BookListViewDAOMybatis bookListViewDAO;

	@Override
	public List<BookListViewVO> getSearchList(String keyword) {
		return bookListViewDAO.getSearchList(keyword);
	}

	@Override
	public List<BookListViewVO> bestSeller() {
		return bookListViewDAO.bestSeller();
	}

	@Override
	public List<BookListViewVO> newBook() {
		return bookListViewDAO.newBook();
	}
	
	@Override
	public List<BookListViewVO> steadySeller() {
		return bookListViewDAO.steadySeller();
	}

	@Override
	public List<BookListViewVO> bookListView(BookListViewVO vo) {
		return bookListViewDAO.bookListView(vo);
	}

	@Override
	public int cartUpdateValue(String id) {
		return bookListViewDAO.cartUpdateValue(id);
	}

}
