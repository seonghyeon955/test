package com.spring.biz.seongmi.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.bookstore.soomin.main.MainService;
import com.bit.bookstore.vo.UserVO;
import com.spring.biz.cart.CartVO;
import com.spring.biz.seongmi.bookList.BookListViewService;
import com.spring.biz.seongmi.bookList.BookListViewVO;

@Controller
public class BookListViewController {
	@Autowired
	private BookListViewService bookListViewService;
	
	@Autowired
	private MainService mainService;
	
	public BookListViewController() {
		System.out.println("----> BookListView 실행");
	}
	
	@RequestMapping("/cartUpdateValue.do")
	public ResponseEntity<Integer> cartUpdateValue(HttpSession session, Model model) {
		ResponseEntity<Integer> entity = null;
		UserVO vo = (UserVO) session.getAttribute("user");
		System.out.println(vo);
		int cnt = 0;
		if(vo == null) {
			if(session.getAttribute("nonMemCartList") == null) {
				cnt = 0;
			}else {
				@SuppressWarnings("unchecked")
				ArrayList<CartVO> cartlist = (ArrayList<CartVO>)(session.getAttribute("nonMemCartList")); 
				cnt = cartlist.size();
			}
			entity = new ResponseEntity<Integer>(cnt, HttpStatus.OK);
		} else {
		String id = vo.getId();
		System.out.println("id : " + vo.getId());
		
		try { 
			cnt = bookListViewService.cartUpdateValue(id);
		
			entity = new ResponseEntity<Integer>(cnt, HttpStatus.OK);
	
		 } catch (Exception e) { 
			 e.printStackTrace(); 
			 entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST); 
		 }
		
		
		}
		model.addAttribute("cnt", cnt);
		return entity;
	}
	
	@RequestMapping("/searchBook.do")
	public String searchBook(String keyword, Model model) {
		System.out.println(keyword);
		mainPageCategory(model);
		List<BookListViewVO> bookList = bookListViewService.getSearchList(keyword);
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("keyword", keyword);
		
		return "/bookListSet/searchList.jsp";
	}
	
	@RequestMapping("/bestSeller.do")
	public String bestSeller(Model model) {
		mainPageCategory(model);
		List<BookListViewVO> bookList = bookListViewService.bestSeller();
		
		model.addAttribute("bookList", bookList);
		
		return "/bookListSet/bestSeller.jsp";
	}
	
	@RequestMapping("/newBook.do")
	public String newBook(Model model) {
		mainPageCategory(model);
		List<BookListViewVO> bookList = bookListViewService.newBook();
		
		model.addAttribute("bookList", bookList);
		
		return "/bookListSet/bookListView.jsp";
	}
	
	@RequestMapping("/steadySeller.do")
	public String steadySeller(Model model) {
		List<BookListViewVO> bookList = bookListViewService.steadySeller();
		mainPageCategory(model);
		
		model.addAttribute("bookList", bookList);
		
		return "/bookListSet/steadySellerList.jsp";
	}
	
	@RequestMapping("/bookListView.do")
	public String bookListView(Model model, @ModelAttribute BookListViewVO vo) {
		
		mainPageCategory(model);
		
		List<BookListViewVO> bookList = bookListViewService.bookListView(vo);
		model.addAttribute("bookList", bookList);
		
		return "/bookListSet/bookList.jsp";
	}
	
	
	
	
	
	
	//카테고리 저장
	public void mainPageCategory(Model model) {
		List<String> categoryCode = mainService.getCategoryCode1();
//			System.out.println(categoryCode);
		model.addAttribute("categoryCode", categoryCode);
		
		Map<String, List<String>> codemainmap = new HashMap<String, List<String>>();
		
		List<String> CategorymainList = new ArrayList<String>();
		
		Map<String, List<String>> mainnamemap = new HashMap<String, List<String>>();
		List<String> CategorynameList = new ArrayList<String>();
		
		for(int c = 0; c < categoryCode.size(); c++) {
				System.out.println("category_code : " + categoryCode.get(c));
			String category_code = categoryCode.get(c);
			CategorymainList = mainService.getCategoryMain(category_code);
			codemainmap.put(category_code, CategorymainList);
			for(int m = 0; m < CategorymainList.size(); m++) {
				CategorynameList = mainService.getCategoryName(CategorymainList.get(m));
					System.out.println("categorymainList : " + CategorymainList);
				mainnamemap.put(CategorymainList.get(m), CategorynameList);
			}
			
		}

		
		
		model.addAttribute("codemainmap", codemainmap);
		model.addAttribute("mainnamemap", mainnamemap);
	}
}
