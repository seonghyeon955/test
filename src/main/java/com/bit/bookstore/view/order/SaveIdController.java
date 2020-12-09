package com.bit.bookstore.view.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.bookstore.vo.CartVO;
import com.bit.bookstore.vo.UserVO;

//개인으로 지금 할 때 로그인이 안 되어있으니 로그인 되었다고 생각하고 세션에 회원정보 저장
@Controller
@RequestMapping("/soomin/order")
public class SaveIdController {
	
	
	
	@RequestMapping("/login.do")
	public String saveId(HttpSession session) {
		//*********회원인척 session에 저장
		UserVO user = new UserVO();
		user.setId("genie");
		user.setUser_name("지니");
		user.setPhone_number1("010-0731-0518");
		user.setEmail("genie@gmail.com");
		user.setPoint(2000);
		user.setZip_code("1195");
		user.setStreet_addr("경기도 구리시 사노동");
		user.setRemaining_addr("주택");
		session.setAttribute("user", user);
		//****************
		
		return "Memberindex.jsp";
	}
	
	@RequestMapping("/nonMember.do")
	public String nonMember(HttpSession session) {
		//*********비회원일 때 장바구니에 있는 거 살 때 <-세션에 장바구니 저장
		CartVO cvo = new CartVO();
		List<CartVO> nonMemberCart = new ArrayList<CartVO>();
		
		cvo.setBook_no(1);
		cvo.setCnt(3);
		nonMemberCart.add(cvo);
		System.out.println("nonMemberCart : " + nonMemberCart.toString());
		CartVO cvo2 = new CartVO();
		cvo2.setBook_no(2);
		cvo2.setCnt(1);
		nonMemberCart.add(cvo2);
		System.out.println("nonMemberCart : " + nonMemberCart.toString());
		CartVO cvo3 = new CartVO();
		cvo3.setBook_no(21);
		cvo3.setCnt(23);
		nonMemberCart.add(cvo3);
		
		System.out.println("nonMemberCart : " + nonMemberCart.toString());
		session.setAttribute("nonMemberCart", nonMemberCart);
		
		return "index.jsp";
	}
}
