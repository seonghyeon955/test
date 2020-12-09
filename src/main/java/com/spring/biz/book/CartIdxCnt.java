package com.spring.biz.book;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.biz.cart.CartService;

public class CartIdxCnt {
	//파일 합쳤을때 다 추가해줘야됨!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
//		@Autowired
//		static
//		CartService cartService;
//		
//		public static int cartIdxCnt(HttpSession session) {
//			String user_id = (String)session.getAttribute("user_id");
//			int cartIdxCnt = 0;
//			if(user_id != null) {//세션의 유저아이디 = 받아온 유저아이디일경우 : 해당회원의 장바구니 idx의 갯수 보여주기
//				cartIdxCnt = cartService.selectCartIdxCnt(user_id);
//				System.out.println("cartIdxCnt : " + cartIdxCnt);
//			}else {//세션의 유저아이디 != 받아온 유저아이디일경우 : 해당회원의 장바구니 idx의 갯수=0
//				cartIdxCnt = 0;
//				System.out.println("cartIdxCnt : " + cartIdxCnt);
//			}
//			return cartIdxCnt;
//			
//		}
}
