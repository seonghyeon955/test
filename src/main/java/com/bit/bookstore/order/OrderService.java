package com.bit.bookstore.order;

import java.util.List;

import com.bit.bookstore.vo.BookVO;
import com.bit.bookstore.vo.CartBookVO;
import com.bit.bookstore.vo.GoodsVO;
import com.bit.bookstore.vo.OrdersVO;
import com.bit.bookstore.vo.StoreVO;
import com.spring.biz.cart.CartVO;

public interface OrderService {
	List<GoodsVO> getGoodsList(String nowDate);
	int getOrderBookSalePrice(int[] orderbook);
	List<BookVO> getOrderBookVOList(int[] orderbook);
	List<CartBookVO> getOrderCartList(int[] ordercart_no);
	List<GoodsVO> getOrderGoodsVOList(int[] goods_code);
	void updateBasic_addr(int zip_code, String street_addr, String remaining_addr, String id);
	void insertOrderdeleteCart(OrdersVO ordervo, int[] cart_idx, int[] orderbook_no, int[] ordergoods_no, String store_code);
	StoreVO getStoreInfo(String store_code);
	void insertOrderDirect(OrdersVO ordervo, int[] orderbook_no, int orderbook_cnt, int[] ordergoods_no, String store_code);
	List<CartBookVO> getNonMemberOrderList(List<CartVO> nonMemberCart);
	void insertOrderNonNumber(OrdersVO ordervo, List<CartVO> orderbook, int[] ordergoods_no, String store_code);
	void updateMyOrderData(String order_user_id);
}
