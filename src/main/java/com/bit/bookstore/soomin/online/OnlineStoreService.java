package com.bit.bookstore.soomin.online;

import java.util.List;

import com.bit.bookstore.vo.BookNCategoryVO;
import com.bit.bookstore.vo.BookStockVO;
import com.bit.bookstore.vo.BookVODateToString;
import com.bit.bookstore.vo.GoodsVODateToString;
import com.bit.bookstore.vo.ProfitVO;
import com.bit.bookstore.vo.QNAVO;
import com.bit.bookstore.vo.QNA_commentVO;
import com.bit.bookstore.vo.StoreVO;
import com.spring.biz.office.OfficeVO;

public interface OnlineStoreService {

	int onlineMonthBookSales(String store_code);

	int onlineGoodsSales(String store_code);

	int allMonthBookSales();

	int allMonthGoodsSales();

	int onlineDayBookSales(String store_code);

	int onlineDayGoodsSales(String store_code);

	int allDayBookSales();

	int allDayGoodsSales();

	int getCategory_no(String category_code, String category_main, String category_name);

	int insertBook(BookVODateToString bookvo);

	int checkBook(BookVODateToString bookvo);

	int checkGoods(String goods_name);

	int insertGoods(GoodsVODateToString goodsvo);

	int getOnlineTotalCount(String store_code, String search);

	List<BookStockVO> getBookStockList(int begin, int end, String search);

	int updateStockCnt(int stock_idx, int cnt);

	BookNCategoryVO getBookDetail(int book_no);

	int updateBook(BookVODateToString bvo);

	int getQNAListTotalCount(String search, int qna_answer, int search_where);

	List<QNAVO> getQNAList(int begin, int end, String search, int qna_answer, int search_where);

	QNAVO getQNAVO(int qna_no);

	List<QNA_commentVO> getQNA_commentList(int qna_no);

	int insertQNA_comment(QNA_commentVO qna_commentvo);

	void updateQNA_Answer(int qna_no);

	List<OfficeVO> getCategoryList();
	
	void insertBookInStore(int book_no, List<String> store_codeList);

	List<String> getStore_codeList();

	int getBookNo(BookVODateToString bookvo);

	List<StoreVO> getStorevoList(String store_approval);

	StoreVO getStorevo(String store_code);

	int updateStore_approval(String store_code, String store_approval);

	int getStoreListTotalCount(String search, String store_approval, String search_where);

	List<StoreVO> getStoreList(int begin, int end, String search, String store_approval, String search_where);

	String getStartDate(String date);


}
