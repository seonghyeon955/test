package com.bit.bookstore.soomin.view.online;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bookstore.Paging;
import com.bit.bookstore.soomin.online.OnlineStoreService;
import com.bit.bookstore.vo.BookStockVO;
import com.bit.bookstore.vo.ProfitVO;
import com.bit.bookstore.vo.QNAVO;
import com.bit.bookstore.vo.StoreVO;
import com.google.gson.Gson;
import com.spring.biz.email.DM;
import com.spring.biz.office.OfficeService;
import com.spring.biz.office.OfficeVO;

@Controller
@RequestMapping("/soomin/online")
public class OnlineStoreController {
	
	//온라인 관리자이므로 항상 store_code는 online
	String store_code = "online";
	
	
	
	
	@Autowired
	private OnlineStoreService onlineStoreService;
	
	@Autowired
	private OfficeService officeService;
	
	
	//세션이 만료 혹은 관리자 로그인이 안 되어있는데 접근하려할 때의 메소드
	public Model notAdminLogin(Model model) {
		String alert = "관리자로그인을 해주세요.";
		String path = "Jungha/mem_login.jsp";
		model.addAttribute("alert", alert);
		model.addAttribute("path", path);
		return model;
	}
	
	
	//get방식으로 접근했을 때
//	@RequestMapping(value = "/onlineStore.do", method = RequestMethod.GET)
//	public void firstStepLoginGet(HttpServletResponse response) throws IOException {
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		out.println("<script>alert('잘못된 접근입니다.');");
//		out.println("location.href = 'index2.jsp';</script>");
//		out.flush();
//	}
	
	
	//메인
	@RequestMapping(value = "/onlineStore.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String firstStepLogin(Model model, HttpSession session, HttpServletResponse response) throws IOException {
//	public String firstStepLogin() throws IOException {
		System.out.println(">>onlineStore.do 메소드");
		
//		StoreVO store = new StoreVO();
//		store.setStore_code("online");
//		session.setAttribute("admin", store);
		
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "../alert.jsp";
		}
		
		
		Map<String, Integer> sales = new HashMap<String, Integer>();
		
		
		
		//월별 온라인 모든(책, 굿즈) 판매 내역 
		
		//1.책
		int onlineMonthBookSales = onlineStoreService.onlineMonthBookSales(store_code);
		System.out.println("onlineMonthBookSales : " + onlineMonthBookSales);
		sales.put("onlineMonthBookSales", onlineMonthBookSales);
		
		//2.굿즈
		int onlineMonthGoodsSales = onlineStoreService.onlineGoodsSales(store_code);
		System.out.println("onlineMonthGoodsSales : " + onlineMonthGoodsSales);
		sales.put("onlineMonthGoodsSales", onlineMonthGoodsSales);
		
		//월별 모든 지점 모든(책, 굿즈) 판매 내역 
		
		//1.책
		int allMonthBookSales = onlineStoreService.allMonthBookSales();
		System.out.println("allMonthBookSales : " + allMonthBookSales);
		sales.put("allMonthBookSales", allMonthBookSales);
		
		//2.굿즈
		int allMonthGoodsSales = onlineStoreService.allMonthGoodsSales();
		System.out.println("allMonthGoodsSales : " + allMonthGoodsSales);
		sales.put("allMonthGoodsSales", allMonthGoodsSales);
		
		
		
		//일별 온라인 모든(책, 굿즈) 판매 내역
		
		//1.책
		int onlineDayBookSales = onlineStoreService.onlineDayBookSales(store_code);
		System.out.println("onlineDayBookSales : " + onlineDayBookSales);
		sales.put("onlineDayBookSales", onlineDayBookSales);
		
		//2.굿즈
		int onlineDayGoodsSales = onlineStoreService.onlineDayGoodsSales(store_code);
		System.out.println("onlineDayGoodsSales : " + onlineDayGoodsSales);
		sales.put("onlineDayGoodsSales", onlineDayGoodsSales);
		
		//일별 모든 지점 모든(책, 굿즈) 판매 내역
		//1.책
		int allDayBookSales = onlineStoreService.allDayBookSales();
		System.out.println("allDayBookSales : " + allDayBookSales);
		sales.put("allDayBookSales", allDayBookSales);
		
		//2.굿즈
		int allDayGoodsSales = onlineStoreService.allDayGoodsSales();
		System.out.println("allDayGoodsSales : " + allDayGoodsSales);
		sales.put("allDayGoodsSales", allDayGoodsSales);
		
		
		model.addAttribute("sales", sales);
		
		
		return "onlineAdmin.jsp";
	}
	
	//매출관리
	
	//1.달 매출
	@RequestMapping("/StoreMonthSales.do")
	public String StoreMonthSales(Model model, HttpSession session) {
		
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "../alert.jsp";
		}
		
		List<String> store_codeList = onlineStoreService.getStore_codeList();
		
		model.addAttribute("store_codeList", store_codeList);
		System.out.println(store_codeList);
		
		return "MonthSales.jsp";
	}
	
	//2.일 매출
	@RequestMapping("/StoreDailySales.do")
	public String StoreDailySales(Model model, HttpSession session) {
		
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "../alert.jsp";
		}
		
		return "DailySales.jsp";
	}
	
	//3.책별 매출
	@RequestMapping("/BookSales.do")
	public String BookSales(Model model, HttpSession session) {
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "../alert.jsp";
		}
		
		return "BookSales.jsp";
	}
	
	//4.지점매출비교
	@RequestMapping("/StoreCompare.do")
	public String StoreCompare(Model model, HttpSession session) {
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "../alert.jsp";
		}
		
		return "StoreCompare.jsp";
	}
	
	
	
	
	//이달의 매출
	@ResponseBody
	@RequestMapping("/daySales.do")
	public String daySales(
			@RequestParam(required = false, defaultValue = "0") String page, 
			String date, String store, Locale locale,
			Model model, HttpSession session) {
		System.out.println("daySales.do 연결 메소드(responsebody)");
		
		String store_code = "";
		
		//gson - json object를 java object로 또는 그 반대로 바꾸는 걸 돕는 라이브러리
		Gson gson = new Gson();
		
		if(store.equals("online")) {//온라인지점만 보는 거면 store_code를 지정해줌
			store_code = (String) session.getAttribute("admin");
		}else {
			store_code = "all";
		}
		
		
		//한달 전 날 + 1 = 시작 날짜, 오늘 날짜 = 끝 날짜
		String startDate;
		String endDate;
		
		if(page.equals("main")) {
			startDate = onlineStoreService.getStartDate(date);
			endDate = date;
		}else {
			startDate = officeService.startDate(date);
			endDate = officeService.endDate(date);
		}
		
		
		
		
		System.out.println("startDate : " + startDate + ", endDate : " + endDate);
		
		
		
		//일별 매출 뽑기
		Map<String, String> map = new HashMap<String, String>();
		map.put("store_code", store_code);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		List<OfficeVO> daySales = officeService.daySales(map);
		System.out.println("daySales : " + daySales);
		
		return gson.toJson(daySales);
	}
	
	
	
	
	
	
	//월별 매출
	@ResponseBody
	@RequestMapping("/monthSales.do")
	public String monthSales(
			String store, String startDate, String endDate, Locale locale, 
			Model model, HttpSession session) {
		System.out.println("monthSales.do 연결 메소드(responsebody)");
		
		String store_code = "";
		
		//gson - json object를 java object로 또는 그 반대로 바꾸는 걸 돕는 라이브러리
		Gson gson = new Gson();
		
		System.out.println("store : " + store);
		
		if(store.equals("online")) {//온라인 지점만 보는 거면 store_code를 지정해줌
			store_code = (String) session.getAttribute("admin");
		}else if(store.equals("all")){
			store_code = "all";
		}else {
			store_code = store;
		}
		
		
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("store_code", store_code);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		
		List<OfficeVO> monthSales = officeService.monthSales(map);//해당 지점의 해당년도의 전체 매출 리스트
		System.out.println(monthSales);
		model.addAttribute("monthSales", monthSales);
		
		return gson.toJson(monthSales);
	}
	
	
	
	//책별 매출
	@ResponseBody
	@RequestMapping(value="/categorySales.do", produces="application/text; charset=UTF-8")
	public String categorySales(
			String store,
			@ModelAttribute OfficeVO vo, 
			Model model, HttpSession session) {
		System.out.println("categorySales.do 연결 메소드(responsebody)");
		
		Gson gson = new Gson();
		
		vo.setStartDate(officeService.startDate(vo.getDate()));
		vo.setEndDate(officeService.endDate(vo.getDate()));
		
		
		if(store.equals("online")) {
			//온라인지점 데이터 저장
			store_code = (String) session.getAttribute("admin");
		}else {
			//전체지점 데이터 저장
			store_code = "all";
		}
		
		
		
		
		
		vo.setStore_code(store_code);
		
		List<OfficeVO> categorySales = officeService.categorySales(vo);
		System.out.println(categorySales);
		model.addAttribute("categorySales", categorySales);
		
		
		
		
		return gson.toJson(categorySales);
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
	
	
	
	
	
	//상품관리
	
	//1.상품입고
	@RequestMapping("/addBookORGoods.do")
	public String officeNewBook(Model model) {
		System.out.println(">> 상품입고페이지 이동");
		
		List<OfficeVO> categoryCode = officeService.getCategoryCode();
		System.out.println(categoryCode);
		model.addAttribute("categoryCode", categoryCode);
		
		return "addBookORGoods.jsp";
	}
	
	
	//게시판, 이벤트 관리
	
	//3.QNA 관리
	@RequestMapping(value = "/qnaList.do")
	public String qnaList(
			@RequestParam(required = false, defaultValue = "1") int cPage,//현재 페이지
			@RequestParam(required = false) String search,//검색어
			@RequestParam(required = false, defaultValue = "0") int qna_answer,//답변 된 것만, 또는 전체 등등
			@RequestParam(required = false, defaultValue = "0") int search_where,//제목, 작성자 등등 어떤 걸로 검색할 건지
			HttpSession session, Model model) {
		
		//session이 만료되어 관리자 로그인이 풀렸는지 확인
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "../alert.jsp";
		}
		
		
		//페이징 처리를 위한 paging 객체생성해서 값 읽고 설정
				
		//1.전체 게시물의 수 구하기(온라인상점의 모든 데이터)
		int totalRecord = onlineStoreService.getQNAListTotalCount(search, qna_answer, search_where);//DB에 저장된 전체 데이터 수를 가져옴
		Paging p = StaticMethod.pagingMethod(totalRecord, cPage);
		
		
//		List<QNAVO> qnavo = onlineStoreService.getQNAList();
		
		List<QNAVO> QNAList = onlineStoreService.getQNAList(p.getBegin(), p.getEnd(), search, qna_answer, search_where);;
		
		
		System.out.println(totalRecord);
		
		//리스트와 p객체 저장해서 전달
		model.addAttribute("QNAList", QNAList);
		model.addAttribute("pvo", p);
		model.addAttribute("search", search);
		model.addAttribute("qna_answer", qna_answer);
		model.addAttribute("search_where", search_where);
		
		return "qnaList.jsp";
	}
	
	
	//지점관리
	
	//1.지점추가승인리스트
	@RequestMapping("/NewStoreConfirm.do")
	public String NewStoreConfirm(Model model, HttpSession session) {
		System.out.println("NewStoreConfirm.do 연결 메소드");
		
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "../alert.jsp";
		}
		
		
		
		//'승인전'이라고 되어있는 지점 리스트 불러오기
		
		List<StoreVO> newStorevoList = onlineStoreService.getStorevoList("승인전");
		
		model.addAttribute("newStorevoList", newStorevoList);
		
		return "NewStoreConfirm.jsp";
	}
	
	
	//2.지점리스트
	@RequestMapping("/StoreList.do")
	public String StoreList(
			@RequestParam(required = false, defaultValue = "1") int cPage,//현재 페이지
			@RequestParam(required = false) String search,//검색어
			@RequestParam(required = false, defaultValue = "") String search_where,//제목, 작성자 등등 어떤 걸로 검색할 건지
			@RequestParam(required = false, defaultValue = "all") String store_approval, 
			Model model, HttpSession session) {
		System.out.println("NewStoreConfirm.do 연결 메소드");
		
		if(session.getAttribute("admin") == null) {
			notAdminLogin(model);
			return "../alert.jsp";
		}
		
		//1.전체 게시물 수 구하기(store의 모든 데이터
		//DB에 저장된 전체 데이터 수를 가져옴
		int totalRecord = onlineStoreService.getStoreListTotalCount(search, store_approval, search_where);
		
		
		Paging p = StaticMethod.pagingMethod(totalRecord, cPage);
		
		List<StoreVO> storevoLsit = onlineStoreService.getStoreList(
				p.getBegin(), p.getEnd(), search, store_approval, search_where);
		
		
		System.out.println("storevoLsit : " + storevoLsit);
		System.out.println("totalRecord : " + totalRecord);
		
		//리스트와 p객체 저장해서 전달
		model.addAttribute("storevoLsit", storevoLsit);
		model.addAttribute("pvo", p);
		model.addAttribute("search", search);
		model.addAttribute("store_approval", store_approval);
		model.addAttribute("search_where", search_where);
		
		return "StoreList.jsp";
	}
	
	
	//지점상세정보
	@ResponseBody
	@RequestMapping("/storeDetail.do")
	public StoreVO storeDetail(@RequestParam String store_code) {
		
		StoreVO storevo = onlineStoreService.getStorevo(store_code);
		System.out.println("storevo : " + storevo);
		return storevo;
	}
	
	//지점 폐점 or 재오픈
	@ResponseBody
	@RequestMapping("store_approvalend.do")
	public String store_approvalend(
			@RequestParam String store_code,
			@RequestParam String store_approval) {
		
		String change = "";
		
		if(store_approval.equals("폐점")) {
			change = "영업중";
		}else if(store_approval.equals("영업중")) {
			change = "폐점";
		}
		
		//store_approval을 폐점으로 전환
		int updateSuccess = onlineStoreService.updateStore_approval(store_code, change);
		
		if(updateSuccess != 1) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	//지점추가 승인 + email전송
	@ResponseBody
	@RequestMapping("store_approval.do")
	public String store_approval(
			@RequestParam String store_code, 
			@RequestParam String email) throws AddressException, MessagingException {
		
		//보내는 사람 이메일 사이트
		String host = "smtp.gmail.com";
		
		final String hostName = "tnals5152";
		final String hostPwd = "fgukmqoifmnffzuv";
		int port = 465;//구글 465, 네이버 587
		
		//메일 내용
		String recieverEmail = email;
		String subject = "[지니문고] 지점 승인 메일";
		
		
		Properties props = System.getProperties();//정보를 담기 위한 객체 생성
		
		//SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		
		//session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = hostName;
			String pw = hostPwd;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		
		session.setDebug(true);
		
		MimeMessage mimeMessage = new MimeMessage(session);//MimeMessage생성
		mimeMessage.setFrom(new InternetAddress("tnals5152@gmail.com"));//발신자 세팅
		mimeMessage.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(recieverEmail));//수신자세팅
		
		mimeMessage.setSubject(subject);//제목세팅
		mimeMessage.setContent(DM.dmCertification(store_code), "text/html;charset=utf-8");
		
		Transport.send(mimeMessage);
		
		//store_approval을 영업중으로 전환
		int updateSuccess = onlineStoreService.updateStore_approval(store_code, "영업중");
		
		if(updateSuccess != 1) {
			return "fail";
		}else {
			return "success";
		}
		
	}
	
}
