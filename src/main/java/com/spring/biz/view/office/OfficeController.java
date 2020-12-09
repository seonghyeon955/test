package com.spring.biz.view.office;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.bookstore.order.OrderService;
import com.bit.bookstore.soomin.online.OnlineStoreService;
import com.google.gson.Gson;
import com.spring.biz.office.OfficeService;
import com.spring.biz.office.OfficeVO;
import com.spring.jung.store.StoreInfoService;



@Controller
@SessionAttributes("admin")
public class OfficeController {
	@Autowired
	private OfficeService officeService;
	
	@Autowired
	private OnlineStoreService onlineStoreService;
	
	public OfficeController() {
		System.out.println("---> OfficeController 실행");
		
	}
	
	//세션이 만료 혹은 관리자 로그인이 안 되어있는데 접근하려할 때의 메소드
	public Model notAdminLogin(Model model) {
		String alert = "관리자로그인을 해주세요.";
		String path = "main.do";
		model.addAttribute("alert", alert);
		model.addAttribute("path", path);
		return model;
	}
	
	
	@RequestMapping("/officeAdmin.do")
	public String officeAdmin(HttpSession session, Model model) {
		
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		String office_no = (String) session.getAttribute("admin");
		System.out.println(office_no);
		System.out.println(">> 관리페이지 이동");
		System.out.println(">> 되는건가?");
		System.out.println(">> ㅎㅎ?");
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		System.out.println(time);
		String date = format1.format(time);
		System.out.println(date);
		String startDate = officeService.startDate(date);
		String endDate = officeService.endDate(date);
		
		System.out.println(startDate);
		
		HashMap<String, Integer> sales = new HashMap<String, Integer>();
		HashMap<String, String> map = new HashMap<String, String>();
		//office_no = "store2";
		map.put("office_no", office_no);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("today", date);
		System.out.println(map);
		
		int daySales = officeService.todaySalesValue(map);
		int monthSales = officeService.monthSalesValue(map);
		
		sales.put("day", daySales);
		sales.put("month", monthSales);
		
		model.addAttribute("SalesValue", sales);
		
		
		List<OfficeVO> monthTOTList = officeService.monthTOTCost(office_no);
		model.addAttribute("monthTOTList", monthTOTList);
				
		return "/seongmi/officeAdmin.jsp";
	}
	
	@RequestMapping("/officeOrder.do")
	public String officeOrder(HttpSession session, Model model) {
		System.out.println(">> 주문관리페이지 이동");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		String store_code = (String) session.getAttribute("admin");
		
		List<OfficeVO> orderList = officeService.getOrderList(store_code);
		List<Integer> orderDetailCnt = officeService.orderDetailCnt(store_code);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderDetailCnt", orderDetailCnt);
		
		return "/seongmi/officeOrder.jsp";
	}
	
	@RequestMapping("/bookModify.do")
	public String bookModify(HttpSession session, int book_no,  Model model) {
		System.out.println("도서수정페이지 실행");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		String store_code = (String) session.getAttribute("admin");
		
		System.out.println(book_no);
		
		List<OfficeVO> categoryCode = officeService.getCategoryCode();
		System.out.println(categoryCode);
		model.addAttribute("categoryCode", categoryCode);
		
		
		OfficeVO bookInfo = officeService.getBookInfo(book_no);
		model.addAttribute("bookInfo", bookInfo);
		
		return "/seongmi/bookModify.jsp";
	}
	
	@RequestMapping("/modifyUpdate.do")
	@ResponseBody
	public ResponseEntity<Integer> modifyUpdate(HttpSession session, @ModelAttribute OfficeVO vo, Model model) throws Exception {
		ResponseEntity<Integer> entity = null;
		
		String store_code = (String) session.getAttribute("admin");
		
		System.out.println("도서업데이트 실행");

		
		try {
			int category_no = officeService.getCategoryNo(vo);
			//System.out.println(category_no);
			vo.setCategory_no(category_no);
			//System.out.println(vo);
			
			int result = officeService.modifyUpdate(vo);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
	}
	
	@RequestMapping("/officeProduct.do")
	public String officeProduct(HttpSession session, Model model) {
		System.out.println(">> 전체상품관리 페이지 이동");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		String store_code = (String) session.getAttribute("admin");
		
		List<OfficeVO> officeBookList = officeService.officeBookList(store_code); 
		model.addAttribute("officeBookList", officeBookList);
		
		return "/seongmi/officeProduct.jsp";
	}
	

	@RequestMapping("/officeNewBook.do")
	public String officeNewBook(HttpSession session, Model model) {
		System.out.println(">> 상품입고페이지 이동");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		
		List<OfficeVO> categoryCode = officeService.getCategoryCode();
		System.out.println(categoryCode);
		model.addAttribute("categoryCode", categoryCode);
		
		return "/seongmi/officeNewBook.jsp";
	}
	
	@RequestMapping(value="/newBook.do", method=RequestMethod.POST)
	public ResponseEntity<Integer> newBook(@ModelAttribute OfficeVO vo) {
		System.out.println("도서입고시작~!~!");
		ResponseEntity<Integer> entity = null;
		
		
		try { 
			
			int category_no = officeService.getCategoryNo(vo);
		 	vo.setCategory_no(category_no);
		
		 	//책삽입
		 	int result = officeService.newBook(vo); 
		 	System.out.println("result : " + result);
		 	
		 	
		 	int book_no = officeService.getBookNo(vo);
		 	System.out.println(book_no);
		 	List<String> store_codeList = onlineStoreService.getStore_codeList();
		 	onlineStoreService.insertBookInStore(book_no, store_codeList);
		 	
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
	
		 } catch (Exception e) { 
			 e.printStackTrace(); 
			 entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST); 
		 }
	
		return entity;
		
	}
	
	@RequestMapping("/getCategoryMain.do")
	@ResponseBody
	public ResponseEntity<List<OfficeVO>> getCategoryMain(String category_code) throws Exception {
		System.out.println(">> getCategoryMain 실행");
		ResponseEntity<List<OfficeVO>> entity = null;
		System.out.println("category_code: " + category_code);
		try {
			List<OfficeVO> list = officeService.getCategoryMain(category_code);
			System.out.println(list);
			entity = new ResponseEntity<List<OfficeVO>>(list, HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OfficeVO>>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
	}
	
	//카테고리 이름 가져오기
	@RequestMapping("/getCategoryName.do")
	@ResponseBody
	public ResponseEntity<List<OfficeVO>> getCategoryName(String category_code, String category_main) throws Exception {
		System.out.println(">> getCategoryMain 실행");
		ResponseEntity<List<OfficeVO>> entity = null;
		System.out.println("category_code: " + category_code);
		System.out.println("category_main: " + category_main);
		
		HashMap<String, String> category = new HashMap<String, String>();
		category.put("category_code", category_code);
		category.put("category_main", category_main);
		
		try {
			List<OfficeVO> list = officeService.getCategoryName(category);
			System.out.println(list);
			entity = new ResponseEntity<List<OfficeVO>>(list, HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OfficeVO>>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
	}
	
	@RequestMapping("/searchBookName.do")
	@ResponseBody
	public ResponseEntity<List<OfficeVO>> getBookName(String book_name, String category_name) throws Exception {
		System.out.println(">> getBookName 실행");
		System.out.println(book_name + "    " + category_name);
		ResponseEntity<List<OfficeVO>> entity = null;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("book_name", book_name);
		map.put("category_name", category_name);
		try {
			List<OfficeVO> list = officeService.searchBookName(map);
			System.out.println(list);
			entity = new ResponseEntity<List<OfficeVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OfficeVO>>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
	}
	
	
	
	
	@RequestMapping("/officeStock.do")
	public String officeStock(HttpSession session, Model model) {
		System.out.println(">> 재고관리 페이지 이동");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		String store_code = (String) session.getAttribute("admin");
		
		
		List<OfficeVO> officeBookList = officeService.officeBookList(store_code); 
		model.addAttribute("officeBookList", officeBookList);
		
		return "/seongmi/officeStock.jsp";
	}
	
	@RequestMapping("/modifyStock.do")
	public ResponseEntity<Integer> modifyStock(HttpSession session, @ModelAttribute OfficeVO vo) {
		System.out.println("재고조정~!~!");
		ResponseEntity<Integer> entity = null;
		String store_code = (String) session.getAttribute("admin");
		vo.setStore_code(store_code);
		
		System.out.println(vo.getStore_code() + "  " + vo.getCnt() + "  " + vo.getBook_no());
		
		try { 
		 	int result = officeService.modifyStock(vo); 
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
	
		 } catch (Exception e) { 
			 e.printStackTrace(); entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST); 
		 }
	
		return entity;
		
	}
	
	
	@RequestMapping("/officeSales.do")
	public String officeSales(HttpSession session, Model model) {
		System.out.println(">> 매출관리 페이지 이동");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		return "/seongmi/officeSales.jsp";
	}
	
	@RequestMapping("/officeMonthSales.do")
	public String officeMonthSales(HttpSession session, Model model) {
		System.out.println(">> 월별매출관리 페이지 이동");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		String store_code = (String) session.getAttribute("admin");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("store_code", store_code);
		map.put("startDate", "2020-01-01");
		map.put("endDate", "2020-12-31");
		
		//List<OfficeVO> monthTOT = officeService.monthSales(map);
		//model.addAttribute("monthTOT", monthTOT);
		
		return "/seongmi/officeMonthSales.jsp";
	}
	
	@RequestMapping("/monthSales.do")
	public @ResponseBody String monthSales(HttpSession session, String startDate, String endDate, Locale locale, Model model) {
		System.out.println("monthSales 실행");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		String store_code = (String) session.getAttribute("admin");
		
		
		Gson gson = new Gson();
		store_code = "store2";
		
		System.out.println(startDate + "   " + endDate);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("store_code", store_code);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		
		List<OfficeVO> monthSales = officeService.monthSales(map);
		//System.out.println(monthTOT);
		model.addAttribute("monthSales", monthSales);
		return gson.toJson(monthSales);
	}
	
	@RequestMapping("/officeDaySales.do")
	public String officeDaySales(HttpSession session, Model model) {
		System.out.println(">> 일별매출관리 페이지 이동");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		return "/seongmi/officeDaySales.jsp";
	}
	//월별 일 매출
	@RequestMapping("/daySales.do")
	public @ResponseBody String daySales(HttpSession session, String date, Locale locale, Model model) {
		System.out.println("daySales 실행");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		String store_code = (String) session.getAttribute("admin");
		
		Gson gson = new Gson();
		store_code = "store2";
		
		String startDate = officeService.startDate(date);
		String endDate = officeService.endDate(date);
		System.out.println(startDate + "   " + endDate);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("store_code", store_code);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		
		List<OfficeVO> daySales = officeService.daySales(map);
		//System.out.println(monthTOT);
		model.addAttribute("daySales", daySales);
		return gson.toJson(daySales);
	}
	
	@RequestMapping("/officeCategorySales.do")
	public String officeBookSales(HttpSession session, Model model) {
		System.out.println(">> 도서별매출관리 페이지 이동");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		
		return "/seongmi/officeCategorySales.jsp";
	}
	
	//카테고리별 월 매출
	@RequestMapping(value="/categorySales.do", produces="application/text; charset=UTF-8")
	public @ResponseBody String categorySales(HttpSession session, @ModelAttribute OfficeVO vo, Model model) {
		System.out.println("categorySales 실행");
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "/soomin/alert.jsp";
		}
		String store_code = (String) session.getAttribute("admin");
		
		Gson gson = new Gson();
		vo.setStore_code(store_code);
		
		vo.setStartDate(officeService.startDate(vo.getDate()));
		vo.setEndDate(officeService.endDate(vo.getDate()));
		
		List<OfficeVO> categorySales = officeService.categorySales(vo);
		System.out.println(categorySales);
		model.addAttribute("categorySales", categorySales);
		
		return gson.toJson(categorySales);
	}
	
	
	/*@RequestMapping("/monthSales.do")
	@ResponseBody
	public ResponseEntity<List<OfficeVO>> monthTOT(String store_code) throws Exception {
		System.out.println(">> monthTOT 실행");
		System.out.println(store_code);
		ResponseEntity<List<OfficeVO>> entity = null;
		
		
		try {
			List<OfficeVO> list = officeService.monthTOT(store_code);
			System.out.println(list);
			entity = new ResponseEntity<List<OfficeVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OfficeVO>>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
	}
	*/
	
	//4.지점매출비교
	@RequestMapping("/StoreCompare.do")
	public String StoreCompare(Model model, HttpSession session) {
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "../alert.jsp";
		}
		
		return "/seongmi/officeStoreCompare.jsp";
	}
	
	//매출비교
	@ResponseBody
	@RequestMapping("/Storecompare.do")
	public String Storecompare(
			String store,
			@ModelAttribute OfficeVO vo, 
			Model model, HttpSession session) {
		System.out.println("Storecompare.do 연결 메소드(responsebody)");
		
		Gson gson = new Gson();
		System.out.println(vo.getDate());
		vo.setStartDate(officeService.startDate(vo.getDate()));
		vo.setEndDate(officeService.endDate(vo.getDate()));
		String store_code = "";
		
		if(store.equals("online")) {
			//온라인지점 데이터 저장
			store_code = (String) session.getAttribute("admin");
		}else {
			//전체지점 데이터 저장
			store_code = "all";
		}
		
		
		
		
		
		vo.setStore_code(store_code);
		
		List<OfficeVO> categorySales = officeService.StoreSales(vo);
		System.out.println(categorySales);
		model.addAttribute("categorySales", categorySales);
		
		
		
		
		return gson.toJson(categorySales);
	}
	
	@RequestMapping("/goBookDetail.do")
	public String goBookDetail(int book_no, Model model) {
		
		return "/seongmi/bookDetail.jsp";
	}
}
