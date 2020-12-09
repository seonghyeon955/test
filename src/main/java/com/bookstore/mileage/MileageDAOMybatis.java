package com.bookstore.mileage;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.order.vo.MyMileageVO;

@Repository("mileageDAO")
public class MileageDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MileageDAOMybatis() {
		System.out.println(">> MileageDAOMybatis 객체생성");
	}
	//검색
	public List<MyMileageVO> getMyMileageDateList(HashMap<String, String> map) {
		System.out.println("ㅎㅎ제발");
		return mybatis.selectList("MyOrderDetailDAO.getMyMileageDateList", map);
	}	
	//주문내역조회
	public List<MyMileageVO> getMyMileage(int order_no) {
		System.out.println("-----> Mybatis로 MyOrderBookVO() 실행");
		System.out.println(order_no);
		return mybatis.selectList("MyOrderDetailDAO.getMyMileage", order_no);
	}
}








