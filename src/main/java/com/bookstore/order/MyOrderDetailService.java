package com.bookstore.order;

import java.util.HashMap;
import java.util.List;

import com.bookstore.order.vo.MyOrderBookVO;
import com.bookstore.order.vo.MyOrderGoodsVO;
import com.bookstore.order.vo.MyOrderVO;
import com.bookstore.order.vo.MyReturnVO;

public interface MyOrderDetailService {
	//CRUD 기능 구현 메소드 정의 총괄

	
	//CRUD 기능 구현 메소드 정의 책
	MyOrderVO getMyOrder(MyOrderVO vo);
	List<MyOrderVO> getMyOrderId(String myid);
	List<MyOrderVO> getMyOrderList(MyOrderVO vo);
	List<MyOrderVO> getMyOrderDateList(HashMap<String, String> map);
	List<MyOrderBookVO> getOrderBookList(int order_no);
	List<MyOrderGoodsVO> getOrderGoodsList(int order_no);
	MyOrderVO getDelivery(int order_no);

	MyReturnVO getMyRetrun(MyReturnVO vo);
	MyReturnVO getMyRetrunVo(MyReturnVO vo);
	List<MyReturnVO> getMyRetrunId(String myreturnid);
	List<MyReturnVO> getMyRetrunId(int order_no);
	List<MyReturnVO> getMyRetrunDateList(HashMap<String, String> map);
}