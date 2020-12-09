package com.bit.bookstore.soomin.online.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bookstore.soomin.online.OnlineStoreService;
import com.bit.bookstore.vo.BookNCategoryVO;
import com.bit.bookstore.vo.BookStockVO;
import com.bit.bookstore.vo.BookVODateToString;
import com.bit.bookstore.vo.GoodsVODateToString;
import com.bit.bookstore.vo.ProfitVO;
import com.bit.bookstore.vo.QNAVO;
import com.bit.bookstore.vo.QNA_commentVO;
import com.bit.bookstore.vo.StoreVO;
import com.spring.biz.office.OfficeVO;


@Service("onlineStoreService")
public class OnlineStoreServiceImpl implements OnlineStoreService{
	
	@Autowired
	private OnlineStoreDAOMybatis onlineStoreMybatis;

	@Override
	public int onlineMonthBookSales(String store_code) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.onlineMonthBookSales(store_code);
	}

	@Override
	public int onlineGoodsSales(String store_code) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.onlineMonthGoodsSales(store_code);
	}

	@Override
	public int allMonthBookSales() {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.allMonthBookSales();
	}

	@Override
	public int allMonthGoodsSales() {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.allMonthGoodsSales();
	}

	@Override
	public int onlineDayBookSales(String store_code) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.onlineDayBookSales(store_code);
	}

	@Override
	public int onlineDayGoodsSales(String store_code) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.onlineDayGoodsSales(store_code);
	}

	@Override
	public int allDayBookSales() {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.allDayBookSales();
	}

	@Override
	public int allDayGoodsSales() {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.allDayGoodsSales();
	}

	@Override
	public int getCategory_no(String category_code, String category_main, String category_name) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getCategory_no(category_code, category_main, category_name);
	}

	@Override
	public int insertBook(BookVODateToString bookvo) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.insertBook(bookvo);
	}

	@Override
	public int checkBook(BookVODateToString bookvo) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.checkBook(bookvo);
	}

	@Override
	public int checkGoods(String goods_name) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.checkGoods(goods_name);
	}

	@Override
	public int insertGoods(GoodsVODateToString goodsvo) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.insertGoods(goodsvo);
	}

	@Override
	public int getOnlineTotalCount(String store_code, String search) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getOnlineTotalCount(store_code, search);
	}

	@Override
	public List<BookStockVO> getBookStockList(int begin, int end, String search) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getBookStockList(begin, end, search);
	}

	@Override
	public int updateStockCnt(int stock_idx, int cnt) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.updateStockCnt(stock_idx, cnt);
	}

	@Override
	public BookNCategoryVO getBookDetail(int book_no) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getBookDetail(book_no);
	}

	@Override
	public int updateBook(BookVODateToString bvo) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.updateBook(bvo);
	}


	@Override
	public int getQNAListTotalCount(String search, int qna_answer, int search_where) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getQNAListTotalCount(search, qna_answer, search_where);
	}

	@Override
	public List<QNAVO> getQNAList(int begin, int end, String search, int qna_answer, int search_where) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getQNAList(begin, end, search, qna_answer, search_where);
	}

	@Override
	public QNAVO getQNAVO(int qna_no) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getQNAVO(qna_no);
	}

	@Override
	public List<QNA_commentVO> getQNA_commentList(int qna_no) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getQNA_commentList(qna_no);
	}

	@Override
	public int insertQNA_comment(QNA_commentVO qna_commentvo) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.insertQNA_comment(qna_commentvo);
	}

	@Override
	public void updateQNA_Answer(int qna_no) {
		// TODO Auto-generated method stub
		onlineStoreMybatis.updateQNA_Answer(qna_no);
	}

	@Override
	public List<OfficeVO> getCategoryList() {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getCategoryList();
	}

	@Override
	public void insertBookInStore(int book_no, List<String> store_codeList) {
		// TODO Auto-generated method stub
		onlineStoreMybatis.insertBookInStore(book_no, store_codeList);
	}

	@Override
	public List<String> getStore_codeList() {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getStore_codeList();
	}

	@Override
	public int getBookNo(BookVODateToString bookvo) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getBookNo(bookvo);
	}

	@Override
	public List<StoreVO> getStorevoList(String store_approval) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getStorevoList(store_approval);
	}

	@Override
	public StoreVO getStorevo(String store_code) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getStorevo(store_code);
	}

	@Override
	public int updateStore_approval(String store_code, String store_approval) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.updateStore_approval(store_code, store_approval);
	}

	@Override
	public int getStoreListTotalCount(String search, String store_approval, String search_where) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getStoreListTotalCount(search, store_approval, search_where);
	}

	@Override
	public List<StoreVO> getStoreList(int begin, int end, String search, String store_approval, String search_where) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getStoreList(begin, end, search, store_approval, search_where);
	}

	@Override
	public String getStartDate(String date) {
		// TODO Auto-generated method stub
		return onlineStoreMybatis.getStartDate(date);
	}

	
}
