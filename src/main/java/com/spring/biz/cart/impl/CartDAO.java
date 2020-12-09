package com.spring.biz.cart.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.cart.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CartDAO(){
		System.out.println(">>CartDAO 객체생성");
	};

	
	public int insertCart(Map<String, Object> cartmap) {
		int cartvo = mybatis.insert("cartmapper.insertCart", cartmap);
		return cartvo;
		
	}
	
	public void updateCart(CartVO vo) {
		mybatis.update("cartmapper.updateCart", vo);
	}
	
	public void deleteCart(int cart_idx) {//cart_idx, user_id로 카트삭제(장바구니 체크박스에서 사용) 
		mybatis.delete("cartmapper.deleteCart", cart_idx);
	}
	
	public CartVO getCart(CartVO vo) {
		return mybatis.selectOne("cartmapper.selectCart", vo);
	}
	
	public List<CartVO> getCartList(){
		return mybatis.selectList("cartmapper.selectCartList");
	}

	public int checkSame(HashMap<String, Object> cartmap) {
		return mybatis.selectOne("cartmapper.checkSame",cartmap);
	}
	public int getCartIdx(HashMap<String, Object> cartmap) {
		return mybatis.selectOne("cartmapper.getCartIdx",cartmap);
	}
	
	public List<CartVO> getCartList2(String user_id){
		return mybatis.selectList("cartmapper.getCartList2", user_id);
	}
	
	public List<CartVO> getAll(String user_id) {
		HashMap<String, Object> baroMap = new HashMap<>();
		baroMap.put("id", user_id);
		return mybatis.selectList("cartmapper.getAll",baroMap);
	}
	
	public List<CartVO> getAll(String user_id, String store_code) {
		HashMap<String, Object> baroMap = new HashMap<>();
		baroMap.put("store_code", store_code);
		baroMap.put("id", user_id);
		return mybatis.selectList("cartmapper.getAll",baroMap);
	}

	public int updateCartCnt(int cnt, int cart_idx) {
		HashMap<String, Object> cartmap = new HashMap<String,Object>();
		cartmap.put("cnt", cnt);
		cartmap.put("cart_idx", cart_idx);
		return mybatis.update("cartmapper.updateCartCnt", cartmap);
	}
	
	public int getCartCnt(int cart_idx) {
		return mybatis.selectOne("cartmapper.getCartCnt", cart_idx);
	}

	public List<CartVO> selectCarts(int book_no, String user_id) {
		HashMap<String,Object> cartmap = new HashMap<String,Object>();
		cartmap.put("book_no", book_no);
		cartmap.put("user_id", user_id);
		return mybatis.selectList("cartmapper.selectNonCartsInfo", cartmap);
		
	}
	
	public String getQuickPickCart(String user_id) {
		return mybatis.selectOne("cartmapper.getQuickPickCart", user_id);
	}
	
	public void deleteQuickPicCart(Map<String, Object> cartmap) {
		mybatis.delete("cartmapper.deleteQuickPicCart", cartmap);
	}
	
	public void noSameBaro(Map<String, Object> cartbaromap) {
		mybatis.delete("cartmapper.noSameBaro",cartbaromap);
	}
	
	
	
}
