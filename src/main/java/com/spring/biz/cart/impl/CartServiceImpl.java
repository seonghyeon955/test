package com.spring.biz.cart.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.cart.CartService;
import com.spring.biz.cart.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDAO cartdao;
	@Override
	public int insertCart(Map<String, Object> cartmap) {
		int cartvo = cartdao.insertCart(cartmap);
		return cartvo;
		
	}

	@Override
	public void updateCart(CartVO vo) {
		cartdao.updateCart(vo);
		
	}

	@Override
	public void deleteCart(int cart_idx) {
		cartdao.deleteCart(cart_idx);
	}

	@Override
	public CartVO getCart(CartVO vo) {
		return cartdao.getCart(vo);
	}

	@Override
	public List<CartVO> getCartlist() {
		return cartdao.getCartList();
	}

	@Override
	public int checkSame(HashMap<String, Object> cartmap) {
		return cartdao.checkSame(cartmap);
		
	}

	@Override
	public int cartidx(HashMap<String, Object> cartmap) {
		return cartdao.getCartIdx(cartmap);
	}

	@Override
	public List<CartVO> getCartList2(String user_id) {
		return cartdao.getCartList2(user_id);
	}

	@Override
	public List<CartVO> getAll(String user_id) {
		return cartdao.getAll(user_id);
	}
	
	@Override
	public List<CartVO> getAll(String user_id,String store_code) {
		return cartdao.getAll(user_id,store_code);
	}

	@Override
	public int updateCartCnt(int cnt, int cart_idx) {
		return cartdao.updateCartCnt(cnt, cart_idx);
		
	}

	@Override
	public int getCartCnt(int cart_idx) {
		return cartdao.getCartCnt(cart_idx);
	}

	@Override
	public String getQuickPickCart(String user_id) {
		return cartdao.getQuickPickCart(user_id);
	}

	@Override
	public void deleteQuickPicCart(Map<String, Object> cartmap) {
		cartdao.deleteQuickPicCart(cartmap);
		
	}

	@Override
	public void noSameBaro(Map<String, Object> cartbaromap) {
		cartdao.noSameBaro(cartbaromap);
		
	}

	

}
