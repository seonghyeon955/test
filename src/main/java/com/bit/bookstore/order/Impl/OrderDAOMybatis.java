package com.bit.bookstore.order.Impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bit.bookstore.vo.BookVO;
import com.bit.bookstore.vo.CartBookVO;
import com.bit.bookstore.vo.GoodsVO;
import com.bit.bookstore.vo.OrdersVO;
import com.bit.bookstore.vo.StoreVO;
import com.spring.biz.cart.CartVO;

//데이터베이스 연동 코드 쓰는 곳
@Repository("orderDAOMybatis")
public class OrderDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public OrderDAOMybatis() {
		super();
	}
	
	public List<GoodsVO> getGoodsList(String nowDate){
		System.out.println("--Mybatis로 getGoodsList() 실행");
		
//		mybatis.selectOne("Order.e");
		return mybatis.selectList("Order.getGoodsList", nowDate);
	}
	
	public int getOrderBookSalePrice(int[] orderbook){
		Map<String, int[]> map = new HashMap<String, int[]>();
		map.put("orderbookArray", orderbook);
		return mybatis.selectOne("Order.getOrderBookSalePrice", map);
	}

	public List<BookVO> getOrderBookVOList(int[] orderbook_no) {
		// TODO Auto-generated method stub
		Map<String, int[]> map = new HashMap<String, int[]>();
		map.put("orderbook_no", orderbook_no);
		return mybatis.selectList("Order.getOrderBookVOList", map);
	}

	public List<CartBookVO> getOrderCartList(int[] ordercart_no) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("mybatis ordercart_no : " + Arrays.toString(ordercart_no));
		map.put("ordercart_no", ordercart_no);
		List<CartBookVO> list =  mybatis.selectList("Order.getOrderCartList", map);
		
		System.out.println("list : " + list);
		
		return list;
	}

	public List<GoodsVO> getOrderGoodsVOList(int[] goods_code) {
		// TODO Auto-generated method stub
		Map<String, int[]> map = new HashMap<String, int[]>();
		map.put("goods_codes", goods_code);
		return mybatis.selectList("Order.getOrderGoodsVOList", map);
	}

	public void updateBasic_addr(int zip_code, String street_addr, String remaining_addr, String id) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("zip_code", "" + zip_code);
		map.put("street_addr", street_addr);
		map.put("remaining_addr", "remaining_addr");
		map.put("id", "id");
		mybatis.update("Order.updateBasic_addr", map);
	}
	
	@Transactional
	public void insertOrderdeleteCart(OrdersVO ordervo, int[] cart_idx, int[] orderbook_no, int[] ordergoods_no, String store_code) {
		// TODO Auto-generated method stub
		System.out.println("insertOrderdeleteCart");
		//ORDERS 테이블에 추가
		if(store_code.equals("online")) {//온라인배송일 때
			mybatis.insert("Order.insertOrder", ordervo);
		}else {//바로드림일 때
			mybatis.insert("Order.insertOrderNotOnline", ordervo);
		}
		
		String id = ordervo.getOrder_user_id();
		int order_no = mybatis.selectOne("Order.selectOrdersById", id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cart_idxs", cart_idx);
		List<CartVO> cartList = mybatis.selectList("Order.selectCartVOList", map);
		
		//ORDER_BOOK 테이블에 추가
		map.clear();
		
		map.put("order_no", order_no); 
		map.put("order_office_no", store_code);
		map.put("cartList", cartList);//cartList통해서 책 상품번호와 판매수량을 넣어줌
		
		mybatis.update("Order.updateBookStock2", map);
		
		if(store_code.equals("online")) {//온라인배송 
			map.put("order_delivery_type", 0); 
			map.put("state", "배송준비중"); 
		}else {//지점 바로드림
			map.put("order_delivery_type", 2); 
			map.put("state", "결제완료"); 
		}
		
		mybatis.insert("Order.insertOrder_book", map);
		
		//ORDER_GOODS 테이블에 추가
		map.clear();
		map.put("order_no", order_no); 
		map.put("ordergoods_no", ordergoods_no);
		mybatis.insert("Order.insertOrder_goods", map);
		
		
		
		//Cart 테이블 삭제
		map.clear();
		map.put("cart_idxs", cart_idx);
		mybatis.delete("Order.deleteCart", map);
	}
	
	@Transactional
	public void insertOrderDirect(OrdersVO ordervo, int[] orderbook_no, int orderbook_cnt, int[] ordergoods_no, String store_code) {
		// TODO Auto-generated method stub
		//ORDERS 테이블에 추가
		System.out.println("Orders테이블추가");
		if(store_code.equals("online")) {//온라인배송일 때
			mybatis.insert("Order.insertOrder", ordervo);
		}else {//바로드림일 때
			mybatis.insert("Order.insertOrderNotOnline", ordervo);
		}
		String id = ordervo.getOrder_user_id();
		int order_no = mybatis.selectOne("Order.selectOrdersById", id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//ORDER_BOOK 테이블에 추가
		map.clear();
		
		map.put("order_no", order_no); 
		map.put("order_office_no", store_code);
		map.put("orderbook_no", orderbook_no);//배열이지만 배열 아님...(개수 하나 but 확인용으로 for문 돌려줄 것)
		map.put("orderbook_cnt", orderbook_cnt);
		
		mybatis.update("Order.updateBookStock1", map);
		
		if(store_code.equals("online")) {//온라인배송 
			map.put("order_delivery_type", 0); 
			map.put("state", "배송준비중"); 
		}else {//지점 바로드림
			map.put("order_delivery_type", 2); 
			map.put("state", "결제완료"); 
		}
		System.out.println("Order_book테이블추가");
		mybatis.insert("Order.insertOrder_book2", map);
		
		//ORDER_GOODS 테이블에 추가
		map.clear();
		map.put("order_no", order_no); 
		map.put("ordergoods_no", ordergoods_no);
		System.out.println("Order_goods테이블추가");
		mybatis.insert("Order.insertOrder_goods", map);
		
		
				
	}
	
	public StoreVO getStoreInfo(String store_code) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Order.selectStore", store_code);
	}

	public List<CartBookVO> getNonMemberOrderList(List<CartVO> nonMemberCart) {
		// TODO Auto-generated method stub
		List<CartBookVO> list = new ArrayList<CartBookVO>(); 
		int book_no;

		for(int i = 0; i < nonMemberCart.size(); i++) {
			book_no = nonMemberCart.get(i).getBook_no();
			list.add(mybatis.selectOne("Order.selectCBook", book_no));
			list.get(i).setCnt(nonMemberCart.get(i).getCnt());
			System.out.println("비회원 카트북vo리스트 : " + list);
		}
		
		
		
		return list;
	}

	
	@Transactional
	public void insertOrderNonNumber(OrdersVO ordervo, List<CartVO> orderbook, int[] ordergoods_no, String store_code) {
		// TODO Auto-generated method stub
		System.out.println("Orders테이블추가");
		if(store_code.equals("online")) {//온라인배송일 때
			mybatis.insert("Order.insertOrder", ordervo);
		}else {//바로드림일 때
			mybatis.insert("Order.insertOrderNotOnline", ordervo);
		}
		
		
		String id = ordervo.getOrder_user_id();
		int order_no = mybatis.selectOne("Order.selectOrdersById", id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//ORDER_BOOK 테이블에 추가
		map.clear();
		
		map.put("order_no", order_no); 
		map.put("order_office_no", store_code);
		map.put("cartList", orderbook);//book_no, book_cnt저장되어있는 CartVO형 리스트
		System.out.println("????");
		mybatis.update("Order.updateBookStock2", map);
		
		if(store_code.equals("online")) {//온라인배송 
			map.put("order_delivery_type", 0); 
			map.put("state", "배송준비중"); 
		}else {//지점 바로드림
			map.put("order_delivery_type", 2); 
			map.put("state", "결제완료"); 
		}
		System.out.println("Order_book테이블추가");
		mybatis.insert("Order.insertOrder_book", map);
		
		//ORDER_GOODS 테이블에 추가
		map.clear();
		map.put("order_no", order_no); 
		map.put("ordergoods_no", ordergoods_no);
		System.out.println("Order_goods테이블추가");
		mybatis.insert("Order.insertOrder_goods", map);
		
		
	}

	public void updateMyOrderData(String order_user_id) {
		// TODO Auto-generated method stub
		mybatis.update("Order.updateMyOrderData", order_user_id);
	}

	
	
	
	
	
	
	
	
}
