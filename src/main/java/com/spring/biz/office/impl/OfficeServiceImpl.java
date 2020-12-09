package com.spring.biz.office.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.office.OfficeService;
import com.spring.biz.office.OfficeVO;

@Service("officeService")
public class OfficeServiceImpl implements OfficeService{
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	private OfficeDAOMybatis officeDAO;
	
	
	@Override
	public List<OfficeVO> getOfficeList() {
		return null;
	}


	@Override
	public int getOfficeSales() {
		
		return officeDAO.getOfficeSales();
	}


	@Override
	public List<OfficeVO> getOrderList(String store_code) {
		
		return officeDAO.getOrderList(store_code);
	}

	//보유 책 리스트 출력
	@Override
	public List<OfficeVO> officeBookList(String store_code) {
		return officeDAO.officeBookList(store_code);
	}

	//오늘 판매금액 출력
	@Override
	public int todaySalesValue(Map<String, String> map) {
		return officeDAO.todaySalesValue(map);
	}

	//월 판매금액 출력
	@Override
	public int monthSalesValue(Map<String, String> map) {
		return officeDAO.monthSalesValue(map);
	}


	@Override
	public List<OfficeVO> monthTOTCost(String store_code) {
		return officeDAO.monthTOTCost(store_code);
	}
	
	@Override
	public OfficeVO getBookInfo(int book_no) {
		return officeDAO.getBookInfo(book_no);
	}


	@Override
	public List<OfficeVO> getCategoryCode() {
		return officeDAO.getCategoryCode();
	}


	@Override
	public List<OfficeVO> getCategoryMain(String category_code) {
		return officeDAO.getCategoryMain(category_code);
	}

	@Override
	public List<OfficeVO> getCategoryName(Map<String, String> category) {
		return officeDAO.getCategoryName(category);
	}

	@Override
	public List<OfficeVO> searchBookName(Map<String, String> map) {
		return officeDAO.searchBookName(map);
	}

	@Override
	public int getCategoryNo(OfficeVO vo) {
		return officeDAO.getCategoryNo(vo);
	}

	@Override
	public int modifyUpdate(OfficeVO vo) {
		return officeDAO.modifyUpdate(vo);
	}


	@Override
	public List<OfficeVO> monthSales(Map<String, String> map) {
		return officeDAO.monthSales(map);
	}
	@Override
	public List<OfficeVO> daySales(Map<String, String> map) {
		return officeDAO.daySales(map);
	}


	@Override
	public String startDate(String date) {
		return officeDAO.startDate(date);
	}


	@Override
	public String endDate(String date) {
		return officeDAO.endDate(date);
	}


	@Override
	public List<Integer> orderDetailCnt(String store_code) {
		return officeDAO.orderDetailCnt(store_code);
	}


	@Override
	public int newBook(OfficeVO vo) {
		System.out.println("newbook");
		return officeDAO.newBook(vo);
	}


	@Override
	public int modifyStock(OfficeVO vo) {
		return officeDAO.modifyStock(vo);
	}


	@Override
	public List<OfficeVO> categorySales(OfficeVO vo) {
		return officeDAO.categorySales(vo);
	}


	@Override
	public List<OfficeVO> StoreSales(OfficeVO vo) {
		// TODO Auto-generated method stub
		return officeDAO.StoreSales(vo);
	}


	@Override
	public int getBookNo(OfficeVO vo) {
		System.out.println("getbookno");
		return officeDAO.getBookNo(vo);
	}
	
}
