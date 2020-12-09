package com.spring.biz.view.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.cart.CartService;

@Controller
@SessionAttributes("cart")
public class CartController {
	@Autowired
	private CartService cartService;
	
	public CartController() {
		System.out.println("---> CartControlller() 객체 생성 : " + cartService);
	}
	
//	@RequestMapping(value="/cart.do", method= RequestMethod.POST)
//	public String cart(CartVO vo) {
//		System.out.println("CartVO vo : " + vo);
//		cartService.insertCart(vo);
//		return "cart.jsp";
//	}
	
	
	
	
}
