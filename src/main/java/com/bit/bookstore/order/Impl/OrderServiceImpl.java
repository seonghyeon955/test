package com.bit.bookstore.order.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.bookstore.order.OrderService;
import com.bit.bookstore.vo.BookVO;
import com.bit.bookstore.vo.CartBookVO;
import com.bit.bookstore.vo.GoodsVO;
import com.bit.bookstore.vo.OrdersVO;
import com.bit.bookstore.vo.StoreVO;
import com.spring.biz.cart.CartVO;


@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAOMybatis orderDAOMybatis;
	
	public OrderServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("-- OrderServiceImple() 객체 생성");
	}
	
	@Override
	public List<GoodsVO> getGoodsList(String nowDate) {
		// TODO Auto-generated method stub
		return orderDAOMybatis.getGoodsList(nowDate);
	}

	@Override
	public int getOrderBookSalePrice(int[] orderbook) {
		// TODO Auto-generated method stub
		return orderDAOMybatis.getOrderBookSalePrice(orderbook);
	}

	@Override
	public List<BookVO> getOrderBookVOList(int[] orderbook_no) {
		// TODO Auto-generated method stub
		return orderDAOMybatis.getOrderBookVOList(orderbook_no);
	}

	@Override
	public List<CartBookVO> getOrderCartList(int[] ordercart_no) {
		// TODO Auto-generated method stub
		return orderDAOMybatis.getOrderCartList(ordercart_no);
	}

	@Override
	public List<GoodsVO> getOrderGoodsVOList(int[] goods_code) {
		// TODO Auto-generated method stub
		return orderDAOMybatis.getOrderGoodsVOList(goods_code);
	}

	@Override
	public void updateBasic_addr(int zip_code, String street_addr, String remaining_addr, String id) {
		// TODO Auto-generated method stub
		orderDAOMybatis.updateBasic_addr(zip_code, street_addr, remaining_addr, id);
	}

	@Override
	public void insertOrderdeleteCart(OrdersVO ordervo, int[] cart_idx, int[] orderbook_no, int[] ordergoods_no, String store_code) {
		// TODO Auto-generated method stub
		orderDAOMybatis.insertOrderdeleteCart(ordervo, cart_idx, orderbook_no, ordergoods_no, store_code);
	}

	@Override
	public StoreVO getStoreInfo(String store_code) {
		// TODO Auto-generated method stub
		return orderDAOMybatis.getStoreInfo(store_code);
	}

	@Override
	public void insertOrderDirect(OrdersVO ordervo, int[] orderbook_no, int orderbook_cnt, int[] ordergoods_no, String store_code) {
		// TODO Auto-generated method stub
		orderDAOMybatis.insertOrderDirect(ordervo, orderbook_no, orderbook_cnt, ordergoods_no, store_code);
	}

	@Override
	public List<CartBookVO> getNonMemberOrderList(List<CartVO> nonMemberCart) {
		// TODO Auto-generated method stub
		return orderDAOMybatis.getNonMemberOrderList(nonMemberCart);
	}

	@Override
	public void insertOrderNonNumber(OrdersVO ordervo, List<CartVO> orderbook, int[] ordergoods_no, String store_code) {
		// TODO Auto-generated method stub
		orderDAOMybatis.insertOrderNonNumber(ordervo, orderbook, ordergoods_no, store_code);
	}

	@Override
	public void updateMyOrderData(String order_user_id) {
		// TODO Auto-generated method stub
		orderDAOMybatis.updateMyOrderData(order_user_id);
	}

	
	

}
