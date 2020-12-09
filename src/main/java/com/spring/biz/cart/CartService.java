package com.spring.biz.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CartService {
	int insertCart(Map<String,Object> cartmap);
	void updateCart(CartVO vo);
	void deleteCart(int cart_idx);
	CartVO getCart(CartVO vo);
	List<CartVO> getCartlist();//selectCartList
	
	int checkSame(HashMap<String, Object> cartmap);
	int cartidx(HashMap<String, Object> cartmap);
	List<CartVO> getCartList2(String user_id);
	List<CartVO> getAll(String user_id);
	List<CartVO> getAll(String user_id, String store_code);
	int updateCartCnt(int cnt, int cart_idx);
	int getCartCnt(int cart_idx);
	String getQuickPickCart(String user_id);
	void deleteQuickPicCart(Map<String,Object> cartmap);
	void noSameBaro(Map<String,Object> cartbaromap);
	
}
