package com.bookstore.order.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.bookstore.vo.UserVO;
import com.bookstore.order.MyOrderDetailService;
import com.bookstore.order.vo.MyOrderBookVO;
import com.bookstore.order.vo.MyOrderGoodsVO;
import com.bookstore.order.vo.MyOrderVO;
import com.bookstore.order.vo.MyReturnVO;

@Controller("MOD")
@RequestMapping("/kyungnan")
public class MyOrderDetailController {
	
	@Autowired
	MyOrderDetailService myorderdetailService;
	
	//------------------Search 검색
	@RequestMapping("/getMyOrderList.do")
	public String getMyOrderList(Model model,HttpSession session) {
	
		//String myid = ((UserVO) session.getAttribute("user")).getId();
		String myorder = "genie";

		List<MyOrderVO> myorderList = myorderdetailService.getMyOrderId(myorder);
		System.out.println(myorderList);
		model.addAttribute("myOrderList", myorderList);
		
		return "myOrderSearch.jsp";
	}
	
	//---------------------Search 날짜검색
	@RequestMapping("/getMyOrderdate.do")
	public String getMyOrderdate(@RequestParam(required = false,defaultValue = "2020") String start_year,
													@RequestParam(required = false,defaultValue = "01") String start_month,
													@RequestParam(required = false,defaultValue = "2020") String end_year,
													@RequestParam(required = false,defaultValue = "12") String end_month ,Model model,
													HttpSession session) {
		String start_date = start_year + "-" + start_month;
		String end_date = end_year + "-" + (Integer.parseInt(end_month)+1);
		
		UserVO user = (UserVO) session.getAttribute("user");
		String id = user.getId();
		System.out.println(id);
		System.out.println(start_date + end_date);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("id", id);
		
		List<MyOrderVO> myorderdateList = myorderdetailService.getMyOrderDateList(map);
		model.addAttribute("myorderdateList",myorderdateList);
		
		return "myOrderSearch.jsp";
	}
	
	//------------------------------------Detail 책 조회
	@RequestMapping("/getMyOrderBook.do")
	public String  getOrderBookList(int order_no, Model model) {
		System.out.println(">> 책페이지 이동");
		System.out.println(">>order_no" + order_no);
		List<MyOrderBookVO> orderBookList = myorderdetailService.getOrderBookList(order_no);
		model.addAttribute("orderBookList", orderBookList);
		
		return "myOrderDetail.jsp";
	}
	
	//------------------------------------Detail 굿즈 조회
	@RequestMapping("/getMyOrderGoods.do")
	public String  getOrderGoodsList(int order_no, Model model) {
		System.out.println(">> 굿즈관리페이지 이동");
		System.out.println(">>order_no" + order_no);
		List<MyOrderGoodsVO> orderGoodsList = myorderdetailService.getOrderGoodsList(order_no);
		model.addAttribute("orderGoodsList", orderGoodsList);
		
		return "myOrderDetail.jsp";
	}	
	
	//------------------------------------Detail 조회
	@RequestMapping("/getMyOrderDetailList.do")
	public String getMyOrderDetailList(@RequestParam(required = false) int order_no, Model model,HttpSession session) {
		System.out.println("111");
		List<MyOrderBookVO> orderBookList = myorderdetailService.getOrderBookList(order_no);
		System.out.println("111");
		List<MyOrderGoodsVO> orderGoodsList = myorderdetailService.getOrderGoodsList(order_no);
		model.addAttribute("orderBookList", orderBookList);
		model.addAttribute("orderGoodsList", orderGoodsList);
		System.out.println("111");
		MyOrderVO delivery = myorderdetailService.getDelivery(order_no);
		model.addAttribute("delivery", delivery);
		System.out.println("111");
//		List<MyOrderVO> myorderList = myorderdetailService.getMyOrderId(myid);
		//System.out.println(myorderList);
//		model.addAttribute("myOrderList", myorderList);
		
		return "myOrderDetail.jsp";
	}
	
	//---------------------Return Search 날짜검색
	@RequestMapping("/getMyRetrunDateList.do")
	public String getMyRetrunDateList(@RequestParam(required = false,defaultValue = "2020") String start_year,
													@RequestParam(required = false,defaultValue = "01") String start_month,
													@RequestParam(required = false,defaultValue = "2020") String end_year,
													@RequestParam(required = false,defaultValue = "12") String end_month ,Model model) {
		String start_date = start_year + "-" + start_month;
		String end_date = end_year + "-" + end_month;
		
		System.out.println("ㄱㄱㄱㄱ");
		String id="genie";
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		System.out.println(start_date +end_date) ;
		List<MyReturnVO> myreturndateList = myorderdetailService.getMyRetrunDateList(map);
		model.addAttribute("myreturndateList",myreturndateList);
		System.out.println(myreturndateList) ;
		return "myReturn.jsp";
	}
	
	//------------------------------------Return 책 조회
	@RequestMapping("/getMyRetrun.do")
	public String getMyOrderReturn(int order_no,Model model,HttpSession session) {
	
		//String myid = ((UserVO) session.getAttribute("user")).getId();

		List<MyReturnVO> myreturnList = myorderdetailService.getMyRetrunId(order_no);
		
		model.addAttribute("myReturnList", myreturnList);
		System.out.println(myreturnList);
		return "myReturn.jsp";
	}
	
}




