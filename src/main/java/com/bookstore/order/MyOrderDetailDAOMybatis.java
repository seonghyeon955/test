package com.bookstore.order;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookstore.order.vo.MyOrderBookVO;
import com.bookstore.order.vo.MyOrderGoodsVO;
import com.bookstore.order.vo.MyOrderVO;
import com.bookstore.order.vo.MyReturnVO;


@Repository("myorderdetailDAO")
public class MyOrderDetailDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MyOrderDetailDAOMybatis() {
		System.out.println(">> MyOrderDAOMybatis 객체생성");
	}

	// 첵 조회(상세조회)
	public MyOrderVO getMyOrder(MyOrderVO vo) {
		System.out.println("===> MyBatis로 getmod() 실행");
		return mybatis.selectOne("MyOrderDetailDAO.getMyOrder", vo);
	}
	// 첵 조회(상세조회)
		public MyOrderVO getMyOrderVo(MyOrderVO vo) {
			System.out.println("===> MyBatis로 getmod() 실행");
			return mybatis.selectOne("MyOrderDetailDAO.getMyOrderVo", vo);
		}

		public List<MyOrderVO> getMyOrderId(String myid) {
			System.out.println("===> MyBatis로 getlist() 실행");
			List<MyOrderVO> list = mybatis.selectList("MyOrderDetailDAO.getmyid", myid);
			return list;
		}
		//검색
		public List<MyOrderVO> getMyOrderDate(Date order_date) {
			System.out.println("===> MyBatis로 getList(order_date) 실행");
			
			return mybatis.selectList("MyOrderDAO.getMyOrderDate", order_date);
		}	

	
	public List<MyOrderVO> getMyOrderList(MyOrderVO vo) {
		System.out.println("===> MyBatis로 getList(vo) 실행");
		
		return mybatis.selectList("MyOrderDetailDAO.getMyOrderList", vo);
	}

	public List<MyOrderVO> getMyOrderDateList(HashMap<String, String> map) {
		System.out.println("ㅎㅎ제발");
		return mybatis.selectList("MyOrderDetailDAO.getMyOrderDateList", map);
	}	
	//주문내역조회
	public List<MyOrderBookVO> getOrderBookList(int order_no) {
		System.out.println("-----> Mybatis로 MyOrderBookVO() 실행");
		System.out.println(order_no);
		return mybatis.selectList("MyOrderDetailDAO.getOrderBookList", order_no);
	}

	public List<MyOrderGoodsVO> getOrderGoodsList(int order_no) {
		System.out.println(order_no);
		return mybatis.selectList("MyOrderDetailDAO.getOrderGoodsList", order_no);
	}

	public MyOrderVO getDelivery(int order_no) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("MyOrderDetailDAO.getDelivery", order_no);
	}
	
	//리턴--------------------------------------------------------
	public MyReturnVO getMyRetrun(MyReturnVO vo) {
		System.out.println("===> MyBatis로 getmod() 실행");
		return mybatis.selectOne("MyOrderDetailDAO.getMyReturn", vo);
	}
	// 첵 조회(상세조회)
		public MyReturnVO getMyRetrunVo(MyReturnVO vo) {
			System.out.println("===> MyBatis로 getmod() 실행");
			return mybatis.selectOne("MyOrderDetailDAO.getMyRetrunrVo", vo);
		}

		public List<MyReturnVO> getMyRetrunId(int order_no) {
			System.out.println("===> MyBatis로 getlist() 실행");
			List<MyReturnVO> returnList = mybatis.selectList("MyOrderDetailDAO.getMyRetrunId", order_no);
			return returnList;
		}

		public List<MyReturnVO> getMyRetrunId(String myreturnid) {
			List<MyReturnVO> returnList = mybatis.selectList("MyOrderDetailDAO.getMyRetrunId", myreturnid);
			return returnList;
		}

		public List<MyReturnVO> getMyRetrunDateList(HashMap<String, String> map) {
			// TODO Auto-generated method stub
			return mybatis.selectList("MyOrderDetailDAO.getMyRetrunDateList", map);
		}
}








