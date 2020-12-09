package com.spring.biz.seongmi.bookList;

import java.util.List;


public interface BookListViewService {

	List<BookListViewVO> getSearchList(String keyword);

	List<BookListViewVO> bestSeller();
	
	List<BookListViewVO> newBook();

	List<BookListViewVO> steadySeller();
	
	List<BookListViewVO> bookListView(BookListViewVO vo);
	
	int cartUpdateValue(String id);
}
