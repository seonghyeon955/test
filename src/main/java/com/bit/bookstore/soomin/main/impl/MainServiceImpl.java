package com.bit.bookstore.soomin.main.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bookstore.order.OrderService;
import com.bit.bookstore.soomin.main.MainService;
import com.bit.bookstore.vo.BookVO;
import com.bit.bookstore.vo.CartBookVO;
import com.bit.bookstore.vo.CartVO;
import com.bit.bookstore.vo.GoodsVO;
import com.bit.bookstore.vo.OrdersVO;
import com.bit.bookstore.vo.QNAVO;
import com.bit.bookstore.vo.StoreVO;


@Service("mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAOMybatis mainDAOMybatis;
	
	public MainServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("-- MainServiceImpl() 객체 생성");
	}

	@Override
	public List<String> getCategoryMain(String category_code) {
		// TODO Auto-generated method stub
		return mainDAOMybatis.getCategoryMain(category_code);
	}

	@Override
	public List<String> getCategoryName(String string) {
		// TODO Auto-generated method stub
		return mainDAOMybatis.getCategoryName(string);
	}

	@Override
	public List<String> getCategoryCode1() {
		// TODO Auto-generated method stub
		return mainDAOMybatis.getCategoryCode1();
	}

	@Override
	public List<Integer> getBestSellerBookNo() {
		// TODO Auto-generated method stub
		return mainDAOMybatis.getBestSellerBookNo();
	}

	@Override
	public List<BookVO> getBookListByBookNo(List<Integer> bookList) {
		// TODO Auto-generated method stub
		return mainDAOMybatis.getBookListByBookNo(bookList);
	}

	@Override
	public List<Integer> getSteadySellerBookNo() {
		// TODO Auto-generated method stub
		return mainDAOMybatis.getSteadySellerBookNo();
	}

	@Override
	public List<Integer> getNewBookBookNo() {
		// TODO Auto-generated method stub
		return mainDAOMybatis.getNewBookBookNo();
	}

	@Override
	public List<GoodsVO> getNewGoodsList() {
		// TODO Auto-generated method stub
		return mainDAOMybatis.getNewGoodsList();
	}

	@Override
	public int insertQnA(QNAVO qnavo) {
		// TODO Auto-generated method stub
		return mainDAOMybatis.insertQnA(qnavo);
	}

	@Override
	public int updateQnA(QNAVO qnavo) {
		// TODO Auto-generated method stub
		return mainDAOMybatis.updateQnA(qnavo);
	}

	@Override
	public void updateQnACnt(int qna_no) {
		// TODO Auto-generated method stub
		mainDAOMybatis.updateQnACnt(qna_no);
	}

	@Override
	public int deleteQnA(int qna_no) {
		// TODO Auto-generated method stub
		return mainDAOMybatis.deleteQnA(qna_no);
	}
	
	
	
	

}
