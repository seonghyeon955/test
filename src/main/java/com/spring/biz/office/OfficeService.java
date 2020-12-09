package com.spring.biz.office;

import java.util.List;
import java.util.Map;

public interface OfficeService {
	List<OfficeVO> getOfficeList();
	
	int getOfficeSales();
	//도서입고
	int newBook(OfficeVO vo);
	
	//주문리스트
	List<OfficeVO> getOrderList(String store_code);
	//주문디테일갯수
	List<Integer> orderDetailCnt(String store_code);
	
	//보유 책 리스트
	List<OfficeVO> officeBookList(String store_code);
	
	//재고수정
	int modifyStock(OfficeVO vo);
	
	//오늘 판매금액
	int todaySalesValue(Map<String, String> map);
	
	//월 판매금액
	int monthSalesValue(Map<String, String> map);
	
	//한달 매출 표시
	List<OfficeVO> monthTOTCost(String store_code);
	
	//월매출표시
	List<OfficeVO> monthSales(Map<String, String> map);
	//일매출표시
	List<OfficeVO> daySales(Map<String, String> map);
	//카테고리별 월 매출 표시
	List<OfficeVO> categorySales(OfficeVO vo);
	
	//월 첫날
	String startDate(String date);
	//월 마지막날
	String endDate(String date);
	
	int getBookNo(OfficeVO vo);
	
	OfficeVO getBookInfo(int book_no);	
	List<OfficeVO> getCategoryCode();
	List<OfficeVO> getCategoryMain(String category_code);
	List<OfficeVO> getCategoryName(Map<String, String> category);
	List<OfficeVO> searchBookName(Map<String, String> map);
	int getCategoryNo(OfficeVO vo);
	int modifyUpdate(OfficeVO vo);

	List<OfficeVO> StoreSales(OfficeVO vo);
}
