package com.spring.biz.office.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.office.OfficeVO;

@Repository("OfficeDAOMybatis")
public class OfficeDAOMybatis {

	@Autowired
	public SqlSessionTemplate mybatis;

	public OfficeDAOMybatis() {
		System.out.println(">> OfficeDAOMybatis 객체 생성");
	}
	
	public int getOfficeSales() {
		System.out.println(">> MyBatis로 getOfficeSales 실행");
		
		return mybatis.selectOne("officeDAO.getOfficeSales");
	}
	
	//도서입고
	public int newBook(OfficeVO vo) {
		System.out.println("도서입고 실행");
		return mybatis.insert("officeDAO.newBook", vo);
	}
	
	//주문내역조회
	public List<OfficeVO> getOrderList(String office_no) {
		System.out.println("-----> Mybatis로 getOfficeOrderList() 실행");
		System.out.println(office_no);
		return mybatis.selectList("officeDAO.getOrderList", office_no);
	}
	
	public List<Integer> orderDetailCnt(String store_code) {
		System.out.println("orderDetailCnt() 실행");
		return mybatis.selectList("officeDAO.orderDetailCnt", store_code);
	}
	
	//재고수정
	public int modifyStock(OfficeVO vo) {
		return mybatis.update("officeDAO.modifyStock", vo);
	}
	
	
	//보유 책 리스트 조회
	public List<OfficeVO> officeBookList(String office_no){
		System.out.println("-----> Mybatis로 getBookList() 실행");
		System.out.println(office_no);
		return mybatis.selectList("officeDAO.officeBookList", office_no);
	}
	
	//오늘 판매금액 조회
	public int todaySalesValue(Map<String, String> map) {
		System.out.println("-----> Mybatis로 todaySalesValue() 실행");
		return mybatis.selectOne("officeDAO.todaySalesValue", map);
	}
	
	//월 판매금액 조회
	public int monthSalesValue(Map<String, String> map) {
		System.out.println("-----> Mybatis로 monthSalesValue() 실행");
		return mybatis.selectOne("officeDAO.monthSalesValue", map);
	}
	
	//한달동안의 매출 표시
	public List<OfficeVO> monthTOTCost(String office_no){
		System.out.println("-----> Mybatis로 monthTOTCost() 실행");
		return mybatis.selectList("officeDAO.monthTOTCost", office_no);
	}
	
	//책정보 가져오기
	public OfficeVO getBookInfo(int book_no) {
		System.out.println("---> mybatis로 getBookInfo 실행");
		return mybatis.selectOne("officeDAO.getBookInfo", book_no);
	}
	
	//카테고리 대분류 가져오기
	public List<OfficeVO> getCategoryCode() {
		
		return mybatis.selectList("officeDAO.getCategoryCode");
	}
	
	//카테고리 중분류 가져오기
	public List<OfficeVO> getCategoryMain(String category_code){
		System.out.println("---> Mybatis로 중분류 가져오기");
		return mybatis.selectList("officeDAO.getCategoryMain",category_code);
	}
	
	//카테고리 이름 가져오기
	public List<OfficeVO> getCategoryName(Map<String, String> category){
		System.out.println("---> Mybatis로 이름 가져오기");
		
		return mybatis.selectList("officeDAO.getCategoryName", category);
	}
	
	//책 이름 가져오기
	public List<OfficeVO> searchBookName(Map<String, String> map){
		
		return mybatis.selectList("officeDAO.searchBookName", map);
	}
	
	//카테고리 넘버 가져오기
	public int getCategoryNo(OfficeVO vo) {
		return mybatis.selectOne("officeDAO.getCategoryNo", vo);
	}
	
	//책 정보 수정
	public int modifyUpdate(OfficeVO vo) {
		return mybatis.update("officeDAO.modifyUpdate", vo);
	}
	
	//월별매출
	public List<OfficeVO> monthSales(Map<String, String> map) {
		return mybatis.selectList("officeDAO.monthSales", map);
	}
	//일별매출
	public List<OfficeVO> daySales(Map<String, String> map) {
		return mybatis.selectList("officeDAO.daySales", map);
	}
	//카테고리별 월 매출
	public List<OfficeVO> categorySales(OfficeVO vo){
		return mybatis.selectList("officeDAO.categorySales", vo);
	}
	
	//월 첫날
	public String startDate(String date) {
		return mybatis.selectOne("officeDAO.startDate", date);
	}
	//월 마지막날
	public String endDate(String date) {
		return mybatis.selectOne("officeDAO.endDate", date);
	}

	public List<OfficeVO> StoreSales(OfficeVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("officeDAO.StoreSales", vo);
	}
	
	public int getBookNo(OfficeVO vo) {
		return mybatis.selectOne("officeDAO.getBookNo", vo);
	}
}
