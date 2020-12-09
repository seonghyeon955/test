package com.bit.bookstore.soomin.main;

import java.util.List;

import com.bit.bookstore.vo.BookVO;
import com.bit.bookstore.vo.GoodsVO;
import com.bit.bookstore.vo.QNAVO;

public interface MainService {

	List<String> getCategoryMain(String category_code);

	List<String> getCategoryName(String string);

	List<String> getCategoryCode1();

	List<Integer> getBestSellerBookNo();

	List<BookVO> getBookListByBookNo(List<Integer> bookList);

	List<Integer> getSteadySellerBookNo();

	List<Integer> getNewBookBookNo();

	List<GoodsVO> getNewGoodsList();

	int insertQnA(QNAVO qnavo);

	int updateQnA(QNAVO qnavo);

	void updateQnACnt(int qna_no);

	int deleteQnA(int qna_no);


}
