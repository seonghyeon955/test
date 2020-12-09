package com.bit.bookstore.soomin.online.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.bookstore.vo.BookNCategoryVO;
import com.bit.bookstore.vo.BookStockVO;
import com.bit.bookstore.vo.BookVODateToString;
import com.bit.bookstore.vo.GoodsVODateToString;
import com.bit.bookstore.vo.ProfitVO;
import com.bit.bookstore.vo.QNAVO;
import com.bit.bookstore.vo.QNA_commentVO;
import com.bit.bookstore.vo.StoreVO;
import com.spring.biz.office.OfficeVO;

//데이터베이스 연동
@Repository("onlineStoreMybatis")
public class OnlineStoreDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	
	
	
	//월별 계산 메소드
	public Map<String, Object> monthMethod(){
		Map<String, Object> map = new HashMap<String, Object>();
		Calendar cal = Calendar.getInstance();
		String firstDay = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/01";
		System.out.println("firstDay : " + firstDay);
		
		String lastDay = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 2) + "/01";
		System.out.println("lastDay : " + lastDay);
		map.put("firstDay", firstDay);
		map.put("lastDay", lastDay);
		return map;
	}
	
	//일별 계산 메소드
	public Map<String, Object> dayMethod(){
		Map<String, Object> map = new HashMap<String, Object>();
		Calendar cal = Calendar.getInstance();
		String firstDay = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.DAY_OF_MONTH);
		System.out.println("firstDay : " + firstDay);
		
		String lastDay = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + (cal.get(Calendar.DAY_OF_MONTH) + 1);
		System.out.println("lastDay : " + lastDay);
		map.put("firstDay", firstDay);
		map.put("lastDay", lastDay);
		return map;
	}
	
	
	//월별 온라인 책 판매 내역
	public int onlineMonthBookSales(String store_code) {
		// TODO Auto-generated method stub
		Map<String, Object> map = monthMethod();
		map.put("store_code", store_code);
		return mybatis.selectOne("OnlineStore.BookSales", map);
	}

	
	
	//월별 온라인 굿즈 판매 내역
	public int onlineMonthGoodsSales(String store_code) {
		// TODO Auto-generated method stub
		Map<String, Object> map = monthMethod();
		map.put("store_code", store_code);
		
		return mybatis.selectOne("OnlineStore.GoodsSales", map);
	}

	
	//월별 모든지점 책 판매 내역
	public int allMonthBookSales() {
		// TODO Auto-generated method stub
		Map<String, Object> map = monthMethod();
		return mybatis.selectOne("OnlineStore.BookSales", map);
	}

	
	//월별 모든지점 굿즈 판매 내역
	public int allMonthGoodsSales() {
		// TODO Auto-generated method stub
		Map<String, Object> map = monthMethod();
		return mybatis.selectOne("OnlineStore.GoodsSales", map);
	}
	
	
	
	//온라인 일별 책 판매 내역
	public int onlineDayBookSales(String store_code) {
		// TODO Auto-generated method stub
		Map<String, Object> map = dayMethod();
		map.put("store_code", store_code);
		return mybatis.selectOne("OnlineStore.BookSales", map);
	}


	//온라인 일별 굿즈 판매 내역
	public int onlineDayGoodsSales(String store_code) {
		// TODO Auto-generated method stub
		Map<String, Object> map = dayMethod();
		map.put("store_code", store_code);
		return mybatis.selectOne("OnlineStore.GoodsSales", map);
	}


	//모든지점 일별 책 판매 내역
	public int allDayBookSales() {
		// TODO Auto-generated method stub
		Map<String, Object> map = dayMethod();
		return mybatis.selectOne("OnlineStore.BookSales", map);
	}


	//모든지점 일별 굿즈 판매 내역
	public int allDayGoodsSales() {
		// TODO Auto-generated method stub
		Map<String, Object> map = dayMethod();
		return mybatis.selectOne("OnlineStore.GoodsSales", map);
	}

	//일치하는 카테고리 넘버 리턴
	public int getCategory_no(String category_code, String category_main, String category_name) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category_code", category_code);
		map.put("category_main", category_main);
		map.put("category_name", category_name);
		
		return mybatis.selectOne("OnlineStore.getCategory_no", map);
	}

	public int insertBook(BookVODateToString bookvo) {
		// TODO Auto-generated method stub
		
		return mybatis.insert("OnlineStore.insertBook", bookvo);
	}

	public int checkBook(BookVODateToString bookvo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("OnlineStore.checkBook", bookvo);
	}

	public int checkGoods(String goods_name) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("OnlineStore.checkGoods", goods_name);
	}

	public int insertGoods(GoodsVODateToString goodsvo) {
		// TODO Auto-generated method stub
		return mybatis.insert("OnlineStore.insertGoods", goodsvo);
	}

	public int getOnlineTotalCount(String store_code, String search) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("store_code", store_code);
		map.put("search", search);
		return mybatis.selectOne("OnlineStore.getOnlineTotalCount", map);
	}

	public List<BookStockVO> getBookStockList(int begin, int end, String search) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("search", search);
		return mybatis.selectList("OnlineStore.getBookStockList", map);
	}

	//재고 변경
	public int updateStockCnt(int stock_idx, int cnt) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stock_idx", stock_idx);
		map.put("cnt", cnt);
		return mybatis.update("OnlineStore.updateStockCnt", map);
	}

	public BookNCategoryVO getBookDetail(int book_no) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("OnlineStore.getBookDetail", book_no);
	}

	public int updateBook(BookVODateToString bvo) {
		// TODO Auto-generated method stub
		return mybatis.update("OnlineStore.updateBook", bvo);
	}

	public int getQNAListTotalCount(String search, int qna_answer, int search_where) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("qna_answer", qna_answer);
		map.put("search_where", search_where);
		return mybatis.selectOne("OnlineStore.getQNAListTotalCount", map);
	}

	public List<QNAVO> getQNAList(int begin, int end, String search, int qna_answer, int search_where) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("search", search);
		map.put("qna_answer", qna_answer);
		map.put("search_where", search_where);
		return mybatis.selectList("OnlineStore.getQNAList", map);
	}

	public QNAVO getQNAVO(int qna_no) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("OnlineStore.getQNAVO", qna_no);
	}

	public List<QNA_commentVO> getQNA_commentList(int qna_no) {
		// TODO Auto-generated method stub
		return mybatis.selectList("OnlineStore.getQNA_commentList", qna_no);
	}

	public int insertQNA_comment(QNA_commentVO qna_commentvo) {
		// TODO Auto-generated method stub
		return mybatis.insert("OnlineStore.insertQNA_comment", qna_commentvo);
	}

	public void updateQNA_Answer(int qna_no) {
		// TODO Auto-generated method stub
		mybatis.update("OnlineStore.updateQNA_Answer", qna_no);
	}

	public List<OfficeVO> getCategoryList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("OnlineStore.getCategoryList");
	}

	public void insertBookInStore(int book_no, List<String> store_codeList) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("book_no", book_no);
		map.put("store_codeList", store_codeList);
		mybatis.insert("OnlineStore.insertBookInStore", map);
	}

	public List<String> getStore_codeList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("OnlineStore.getStore_codeList");
	}

	public int getBookNo(BookVODateToString bookvo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("OnlineStore.getBookNo", bookvo);
	}

	public List<StoreVO> getStorevoList(String store_approval) {
		// TODO Auto-generated method stub
		return mybatis.selectList("OnlineStore.getStorevoList", store_approval);
	}

	public StoreVO getStorevo(String store_code) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("OnlineStore.getStorevo", store_code);
	}

	public int updateStore_approval(String store_code, String store_approval) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("store_code", store_code);
		map.put("store_approval", store_approval);
		return mybatis.update("OnlineStore.updateStore_approval", map);
	}

	public int getStoreListTotalCount(String search, String store_approval, String search_where) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("store_approval", store_approval);
		map.put("search_where", search_where);
		return mybatis.selectOne("OnlineStore.getStoreListTotalCount", map);
	}

	public List<StoreVO> getStoreList(int begin, int end, String search, String store_approval, String search_where) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("search", search);
		map.put("store_approval", store_approval);
		map.put("search_where", search_where);
		return mybatis.selectList("OnlineStore.getStoreList", map);
	}
	
	public String getStartDate(String date) {
		return mybatis.selectOne("OnlineStore.getStartDate", date);
	}

	
	
}
