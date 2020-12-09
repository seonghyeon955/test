package com.spring.jung.view.store;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.bit.bookstore.vo.StoreVO;
import com.bit.bookstore.vo.UserVO;
import com.spring.biz.user.UserService;
import com.spring.jung.store.StoreInfoService;
import com.spring.jung.store.impl.StroreInfoServiceImpl;

@Controller
@SessionAttributes("storeInfo")
public class StoreInfoController {

	@Autowired
	private StoreInfoService storeInfoService;
	
	@RequestMapping(value= "/store_login.do", method=RequestMethod.POST)
	public String login(StoreVO vo, HttpSession session, HttpServletResponse response) throws IOException {
		
		int result = storeInfoService.Login(vo);
		String url = "";
		
		//로그인 성공
		if(result == 1) {
			//session에 로그인한 store_code저장
			session.setAttribute("admin", vo.getStore_code());
			
			if(vo.getStore_code().equals("online")) { //온라인
				url="redirect:/soomin/online/onlineStore.do"; /////////////////////////////////////////////// 온라인 관리자 페이지로 
			} else {
				url="redirect:/officeAdmin.do"; //////////////////////////////////////////////////////////////// 지점 관리자 페이지로
			}
			
		}else {
			//로그인 실패 
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아이디와 비밀번호를 확인해주세요!'); location.href='login1.do' </script>");
            out.flush();
		}
		
		return url;
	}
	
	@RequestMapping(value = "/store_signup.do", method=RequestMethod.POST)
	public String store_signup(@ModelAttribute StoreVO vo) {
		
		vo.setStore_phone_number(vo.getPhone1() + "-" + vo.getPhone2() + "-" + vo.getPhone3());
		vo.setEmail(vo.getEmail_f()+ "@" + vo.getEmail_b());
		
		storeInfoService.Signin(vo);
		
		return "redirect:/login1.do";
	}
	
	@RequestMapping("/storeUpdate.do")
	public String storeUpdate(HttpSession session, Model model) {
		
		String store_code = (String)session.getAttribute("admin");
		StoreVO vo = storeInfoService.getStore(store_code);
		String[] email = vo.getEmail().split("@");
		vo.setEmail_f(email[0]);
		vo.setEmail_b(email[1]);
		String[] phone_number = vo.getStore_phone_number().split("-");
		vo.setPhone1(phone_number[0]);
		vo.setPhone2(phone_number[1]);
		vo.setPhone3(phone_number[2]);
		
		model.addAttribute("store", vo);
		
		return "/Jungha/storeUpdate.jsp";
	}
	
	@RequestMapping("/doStoreUpdate.do")
	public String doStoreUpdate(HttpSession session, Model model, StoreVO vo) {
		if(vo.getPhone1() != null && vo.getPhone2() != null && vo.getPhone3() != null) {
			vo.setStore_phone_number(vo.getPhone1() + "-" + vo.getPhone2() + "-" + vo.getPhone3());
		}
		vo.setEmail(vo.getEmail_f()+ "@" + vo.getEmail_b());
		vo.setStore_code((String)session.getAttribute("admin"));
		
		storeInfoService.storeUpdate(vo);
		
		if(vo.getStore_pwd() != "") {
			storeInfoService.updatePwd(vo);
		}
		
		return "redirect:/officeAdmin.do"; //관리자 메인으로 돌아가기 /////////////////////////////////////
	}
	
	@RequestMapping("/storeDelete.do")
	public String storeDelete(HttpSession session, SessionStatus sessionStatus) {
		
		String store_code = (String)session.getAttribute("admin");
		storeInfoService.storeLeave(store_code);
		
		session.invalidate();
		sessionStatus.setComplete();

		return "/main.do"; ///////////////////////////////////메인으로
	}
	
}
