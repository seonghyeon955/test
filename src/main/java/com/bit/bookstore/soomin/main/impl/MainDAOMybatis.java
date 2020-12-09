package com.bit.bookstore.soomin.main.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.bookstore.vo.BookVO;
import com.bit.bookstore.vo.GoodsVO;
import com.bit.bookstore.vo.QNAVO;

//데이터베이스 연동 코드 쓰는 곳
@Repository("mainDAOMybatis")
public class MainDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public MainDAOMybatis() {
		super();
	}

	public List<String> getCategoryMain(String category_code) {
		// TODO Auto-generated method stub
		return mybatis.selectList("MainMapper.getCategoryMain", category_code);
	}

	public List<String> getCategoryName(String string) {
		// TODO Auto-generated method stub
		return mybatis.selectList("MainMapper.getCategoryName", string);
	}

	public List<String> getCategoryCode1() {
		// TODO Auto-generated method stub
		return mybatis.selectList("MainMapper.getCategoryCode1");
	}

	public List<Integer> getBestSellerBookNo() {
		// TODO Auto-generated method stub
		return mybatis.selectList("MainMapper.getBestSellerBookNo");
	}

	public List<BookVO> getBookListByBookNo(List<Integer> bookList) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bookList", bookList);
		return mybatis.selectList("MainMapper.getBookListByBookNo", map);
	}

	public List<Integer> getSteadySellerBookNo() {
		// TODO Auto-generated method stub
		return mybatis.selectList("MainMapper.getSteadySellerBookNo");
	}

	public List<Integer> getNewBookBookNo() {
		// TODO Auto-generated method stub
		return mybatis.selectList("MainMapper.getNewBookBookNo");
	}

	public List<GoodsVO> getNewGoodsList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("MainMapper.getNewGoodsList");
	}

	public int insertQnA(QNAVO qnavo) {
		// TODO Auto-generated method stub
		return mybatis.insert("MainMapper.insertQnA", qnavo);
	}

	public int updateQnA(QNAVO qnavo) {
		// TODO Auto-generated method stub
		return mybatis.update("MainMapper.updateQnA", qnavo);
	}

	public void updateQnACnt(int qna_no) {
		// TODO Auto-generated method stub
		mybatis.update("MainMapper.updateQnACnt", qna_no);
	}

	public int deleteQnA(int qna_no) {
		// TODO Auto-generated method stub
		return mybatis.delete("MainMapper.deleteQnA", qna_no);
	}
	
	
	
	
	
	
	
	
	
	
}
