package com.spring.biz.view.book;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.store.StoreService;

@Controller
@SessionAttributes("store")
public class StoreController {
	@Autowired
	private StoreService storeService;
	
	public StoreController() {
		System.out.println("--->> StoreController() 객체생성" + storeService);
	}
	
//	@RequestMapping(value="/getStore.do", method=RequestMethod.GET)
//	public String getStore(String store_code, Model model) {
//		System.out.println(">>> 가게상세 - String getStore()");
//		StoreVO storeVO = storeService.getStore(store_code);
//		model.addAttribute("storeVO",storeVO);
//		System.out.println("getStore() store : " + storeVO);
//		
//		return "bookDetail.jsp";
//		
//		
//	}//bookcontroller에서 다 해결 
	
//	@RequestMapping(value="/getStore.do", method=RequestMethod.GET)
//	public String getStoreList(Model model) {
//		System.out.println(">>>지점들 ");
////		List<StoreVO> storelist = storeService.getStoreList();
////		model.addAttribute("storelist", storelist);
//		return "/view/bookDetail.jsp";
//	}
	
}
