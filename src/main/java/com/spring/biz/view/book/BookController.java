package com.spring.biz.view.book;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.bit.bookstore.vo.UserVO;
import com.spring.biz.book.ArticleVO;
import com.spring.biz.book.BoardService;
import com.spring.biz.book.BookService;
import com.spring.biz.book.BookVO;
import com.spring.biz.book.CartIdxCnt;
import com.spring.biz.book.ContentOrderService;
import com.spring.biz.book.ContentOrderVO;
import com.spring.biz.book.Paging;
import com.spring.biz.bookstock.BookStockService;
import com.spring.biz.bookstock.BookStockVO;
import com.spring.biz.cart.CartService;
import com.spring.biz.cart.CartVO;
import com.spring.biz.event.EventService;
import com.spring.biz.event.EventVO;
import com.spring.biz.jego.JegoService;
import com.spring.biz.jego.JegoVO;

@Controller
@SessionAttributes("book")
public class BookController {
	@Autowired
	private BookService bookservice;
	@Autowired
	private BookStockService bookstockService;
	@Autowired
	private JegoService jegoService;
	@Autowired
	private CartService cartService;
	@Autowired
	private EventService eventService;
	@Autowired
	private ContentOrderService contentOrderService;
	@Autowired
	private BoardService boardService;
	
	
	
	public BookController() {
		System.out.println("--->> BookController() 객체생성");
	}
	
	//상세페이지로 가기
	@RequestMapping(value="/goBookDetail.do", method=RequestMethod.GET)
	public String goBookDetail(int book_no, Model model,HttpSession session,
					@RequestParam(required = false, defaultValue="1") int cPage) {
		System.out.println(">>상세페이지");
		System.out.println("book_no : " + book_no);
		UserVO user = (UserVO)session.getAttribute("user");
		session.setAttribute("user", user);
		
		BookVO bookVo = bookservice.getBook(book_no);
		List<BookStockVO> bookstockvo = bookstockService.getBookStockList(book_no);
		List<JegoVO> jego = jegoService.getjego(book_no);
		List<EventVO> eventlist = eventService.getEvents(book_no);
		int eventCnt = eventService.getEventCnt(book_no);
		List<ContentOrderVO> ContentOrder = contentOrderService.getContentOrders(book_no);
		List<ArticleVO> articleVO = boardService.getReviewList();
		List<JegoVO> jegopickuplist = jegoService.getPickupjego(book_no);
		int cntArticle = boardService.getCntArticle(book_no);
		
		
		System.out.println("bookVo111 : " + bookVo);
		System.out.println(">>상세페이지1");
		
		model.addAttribute("bookVo", bookVo);
		model.addAttribute("bookstockvo", bookstockvo);
		model.addAttribute("jego",jego);
		model.addAttribute("eventlist", eventlist);
		model.addAttribute("eventCnt", eventCnt);
		model.addAttribute("ContentOrder", ContentOrder);
		model.addAttribute("articleVO", articleVO);
		model.addAttribute("cntArticle", cntArticle);
		model.addAttribute("jegopickuplist", jegopickuplist);
		
		
		System.out.println("jego : " + jego);
		System.out.println(">>상세페이지2");
		System.out.println("bookVo : " + bookVo);
		System.out.println(">>상세페이지3");
		System.out.println("bookstockvo : " + bookstockvo);
		System.out.println("jego : " + jego);
		System.out.println("eventlist : " + eventlist);
		System.out.println("eventCnt : " + eventCnt);
		System.out.println("ContentOrder : " + ContentOrder);
		System.out.println("articleVO : " + articleVO);
		System.out.println("jegopickuplist : " + jegopickuplist);
		
		//전체게시글수(리뷰) 가져오기
		int ArticleCnt = boardService.getCntArticle(book_no);
		Paging p = pagingMethod(ArticleCnt, cPage);
		System.out.println("p : " + p);
		model.addAttribute("pvo", p);
		
		return "/seonghyeon/bookDetail.jsp";
	}

	
	//재고 구하기
	@RequestMapping(value="/jego.do2",method=RequestMethod.GET)
	public String jego(int book_no, String store_code, Model model){
		System.out.println("재고 구하기");
		System.out.println("book_no : " + book_no);
		System.out.println("store_code : " + store_code);
		
		JegoVO jego2 = jegoService.getJego2(store_code);
		System.out.println("jego2 : " + jego2);
		model.addAttribute("jego2", jego2);
		return "/seonghyeon/ghmoonjego.jsp";
		
		
	}
	
	//회원일때 DB-장바구니에 넣기
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	@ResponseBody
	public String
	modifyUpdate(HttpSession session,int book_no, int cnt, 
	String store_code) throws Exception{
		
		ResponseEntity<String> entity = null;
		System.out.println("ReponseEntity() 실행");
		HashMap<String,Object> cartmap = new HashMap<>();
		UserVO user = (UserVO) session.getAttribute("user");
		String id = user.getId();
		System.out.println(id + "  " + book_no + "  " + cnt + "  " + store_code);
		cartmap.put("id", id);
		cartmap.put("book_no", book_no);
		cartmap.put("cnt", cnt);
		cartmap.put("store_code", store_code);
		System.out.println("cnt : " +cnt );
		String success="";
		
			try {
				int checkSame = cartService.checkSame(cartmap);
				System.out.println("checkSame : " + checkSame);
				if(checkSame==0) {//일치하는 값이 없으면 장바구니에 넣어준다
					int insertCart =cartService.insertCart(cartmap);
					System.out.println("성공");
					System.out.println("insertCart : " + insertCart);
					success = "success";
				}else {//일치하는 값이 있으면 alert창을 띄운다. (1이 아닌 다른 수를 넘김)
					int insertCart = 0;
					System.out.println("실패");
					System.out.println("insertCart : " + insertCart);
					success="fail";
				}
				System.out.println("success : " + success);
				 entity = new ResponseEntity<String>(success, HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
		         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);   
		      }
		      System.out.println("entity : " + entity);
		      return "{\"success\":\""+success+"\"}";
			}
	
	
	//회원일때 온라인배송, 바로드림 둘다 장바구니에 뿌려주기(지점코드,아이디 받아와서)
	   //닉네임, 잔여포인트, 쿠폰 데이터 가져오기
	   @RequestMapping(value="/gocart.do", method=RequestMethod.GET)
	   public String goCart(Model model,HttpSession session, HttpServletRequest request) throws IOException {
	      System.out.println("장바구니에 뿌려주기");
	      UserVO user = (UserVO)session.getAttribute("user");
	      String id = user.getId();
	      String nickname = user.getNickname();
	      int point = user.getPoint();
	      
	      System.out.println("user nickname : " + nickname);
	      System.out.println("user id : " + id);
	      System.out.println("user point : " + point);
	      
	      List<CartVO> cartlist = cartService.getAll(id,"online");//온라인배송 회원 장바구니 
	      List<CartVO> cartbarolist = cartService.getAll(id);//바로드림 회원 장바구니
	      model.addAttribute("cartlist", cartlist);
	      model.addAttribute("cartbarolist", cartbarolist);
	      return "seonghyeon/cart.jsp";
	      
	   }
	
	//비회원일때 세션-장바구니에 넣기
	@RequestMapping(value="/cartNonMem.do", method=RequestMethod.GET)
	@ResponseBody
	public String cartNonMem(int book_no, int cnt, String store_code, Model model, HttpSession session) {
		System.out.println("비회원 - 장바구니에 넣기");
		
		@SuppressWarnings("unchecked")
		ArrayList<CartVO> cartlist = (ArrayList<CartVO>)(session.getAttribute("nonMemCartList")); 
		CartVO cartvo = new CartVO();
		cartvo.setBook_no(book_no);
		cartvo.setStore_code(store_code);
		cartvo.setCnt(cnt);
		String success = "success";
		
		if(session.getAttribute("nonMemCartList") == null) {
			cartlist = new ArrayList<CartVO>(); 
		}
		for(int i=0; i<cartlist.size(); i++) {
			if(cartlist.get(i).getBook_no() == cartvo.getBook_no()) {
				success="fail";
			}
		}
		if(success.equals("success")) {
			cartlist.add(cartvo);
		}
		System.out.println("cartlist : " + cartlist);
		session.setAttribute("nonMemCartList", cartlist);
		return "{\"success\":\""+success+"\"}";
	}
	
	//비회원일때 장바구니창에 데이터 뿌려서 보여주기
	@RequestMapping(value="/gocartNon.do", method=RequestMethod.GET)
	public String gocartNon(Model model, HttpSession session) {
		System.out.println("비회원- 장바구니에 뿌리기");
		@SuppressWarnings("unchecked")
		ArrayList<CartVO> cartnonlist = (ArrayList<CartVO>)session.getAttribute("nonMemCartList");
		
		List<BookVO> nonBookVoList = new ArrayList<BookVO>();
		
		BookVO bookvo = new BookVO();
		//int cnt = (int)session.getAttribute("cnt");
		//String store_code = (String)session.getAttribute("store_code");
		if(cartnonlist != null) {
			for(CartVO cartvo : cartnonlist) {
				bookvo = null;
				int book_no = cartvo.getBook_no();
				bookvo = bookservice.getBook(book_no);
				bookvo.setCnt(cartvo.getCnt());
				bookvo.setStore_code(cartvo.getStore_code());
				nonBookVoList.add(bookvo); 
				System.out.println("bookvo.cnt : " + bookvo.getCnt());
				System.out.println("bookvo.book_name : " + bookvo.getBook_name());
				System.out.println("nonBookVoList : " + nonBookVoList);
			}
		
		
			//@SuppressWarnings("unchecked")
			model.addAttribute("nonBookVoList", nonBookVoList);
		}
		return "seonghyeon/cart.jsp";
	}
	
	
	
	//~~~~~~~~~~~~바로드림~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	
	
	
	
	
	//[바로드림]회원일때 DB에 넣기
    @RequestMapping(value="/quickPickCart.do", method=RequestMethod.POST)
    @ResponseBody
    public String
    quickPickCart(HttpSession session,int book_no,  int cnt, 
    String store_code) throws Exception{
       
       ResponseEntity<String> entity = null;
       System.out.println("ReponseEntity() 실행");
       HashMap<String,Object> quickPickCartMap = new HashMap<>();
       UserVO user = (UserVO) session.getAttribute("user");
       String id = user.getId();
       System.out.println(id + "  " + book_no + "  " + cnt + "  " + store_code);
       quickPickCartMap.put("id", id);
       quickPickCartMap.put("book_no", book_no);
       quickPickCartMap.put("cnt", cnt);
       quickPickCartMap.put("store_code", store_code);
       System.out.println("cnt : " +cnt );
       String success="";
			
		try {
			int checkSame = cartService.checkSame(quickPickCartMap);
			System.out.println("checkSame : " + checkSame);
			if(checkSame==0) {//일치하는 값이 없으면 장바구니에 넣어준다
				cartService.noSameBaro(quickPickCartMap);//store_code,id 비고해서 넣기 
				int insertCart =cartService.insertCart(quickPickCartMap);
				System.out.println("성공");
				System.out.println("[바로드림]insertCart : " + insertCart);
				
				success = "success";
			}else {//일치하는 값이 있으면 alert창을 띄운다. (1이 아닌 다른 수를 넘김)
				int insertCart = 0;
				System.out.println("실패");
				System.out.println("[바로드림]insertCart : " + insertCart);
				success="fail";
			}
			System.out.println("success : " + success);
			 entity = new ResponseEntity<String>(success, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);   
	      }
	      System.out.println("entity : " + entity);
	      return "{\"success\":\""+success+"\"}";
	}
	
		//[바로드림]회원일때 장바구니에 뿌려주기(지점코드,아이디 받아와서)
		//닉네임, 잔여포인트, 쿠폰 데이터 가져오기
		@RequestMapping(value="/goQuickPickCart.do", method=RequestMethod.GET)
		public String goQuickPickCart(Model model,HttpSession session, HttpServletRequest request) throws IOException {
			System.out.println("[바로드림]장바구니에 뿌려주기");
			UserVO user = (UserVO)session.getAttribute("user");
			String id = user.getId();
			String nickname = user.getNickname();
			int point = user.getPoint();
			
			System.out.println("user nickname : " + nickname);
			System.out.println("user id : " + id);
			System.out.println("quickpick point : " + point);
			
			List<CartVO> cartlist = cartService.getAll(id);
			model.addAttribute("quickPickCartList", cartlist);
			return "/gocart.do";
			
		}
		
		//[바로드림]비회원일때 세션-장바구니에 넣기
		@RequestMapping(value="/quickCartNonMem.do", method=RequestMethod.POST)
		@ResponseBody
		public String quickCartNonMem(int book_no, int cnt, String store_code, HttpSession session) {
			System.out.println("[바로드림]비회원 - 장바구니에 넣기");
			CartVO cartvo = new CartVO();
			cartvo.setBook_no(book_no);
			cartvo.setStore_code(store_code);
			cartvo.setCnt(cnt);
			
			@SuppressWarnings("unchecked")
			ArrayList<CartVO> cartlist = (ArrayList<CartVO>)(session.getAttribute("nonMemCartList")); 
			
			if(session.getAttribute("nonMemCartList") == null) {
				cartlist = new ArrayList<CartVO>(); 
			}
			cartlist.add(cartvo);
			session.setAttribute("nonMemCartList", cartlist);
			String success = "success";
			return "{\"success\":\""+success+"\"}";
		}
	
		
		
		//[바로드림]비회원일때 장바구니창에 데이터 뿌려서 보여주기
		@RequestMapping(value="/goQuickCartNonMem.do", method=RequestMethod.GET)
		public String goQuickCartNonMem(Model model, HttpSession session) {
			System.out.println("비회원- 장바구니에 뿌리기");
			@SuppressWarnings("unchecked")
			ArrayList<CartVO> cartnonlist = (ArrayList<CartVO>)session.getAttribute("nonMemCartList");
			
			List<BookVO> nonBookVoList = new ArrayList<BookVO>();
			
			BookVO bookvo = new BookVO();
			//int cnt = (int)session.getAttribute("cnt");
			//String store_code = (String)session.getAttribute("store_code");
			
			for(CartVO cartvo : cartnonlist) {
				bookvo = null;
				int book_no = cartvo.getBook_no();
				bookvo = bookservice.getBook(book_no);
				bookvo.setCnt(cartvo.getCnt());
				bookvo.setStore_code(cartvo.getStore_code());
				nonBookVoList.add(bookvo); 
				System.out.println("bookvo.cnt : " + bookvo.getCnt());
				System.out.println("bookvo.book_name : " + bookvo.getBook_name());
				System.out.println("nonBookVoList : " + nonBookVoList);
			}
			
			//@SuppressWarnings("unchecked")
			model.addAttribute("nonBookVoList", nonBookVoList);
//			return "gocartNon.do";
			return "seonghyeon/cart.jsp";
		}
	
	
	//장바구니 책 갯수 수정 
	@RequestMapping(value="/changeCartBookCnt.do", method=RequestMethod.POST)
	@ResponseBody
	public String changeCartBookCnt(int cnt, int cart_idx) {
		String success="";
		int result = cartService.updateCartCnt(cnt, cart_idx);
		if(result == 1) {
			success="success";
		}else {
			success="fail";
		}
		return success;
	}
	
	//비회원 장바구니 책 갯수 수정(일반배송, 바로드림) 
	@RequestMapping(value="/nonChangeCartBookCnt.do", method=RequestMethod.POST)
	@ResponseBody
	public String nonChangeCartBookCnt(HttpSession session, int cnt, int book_no, String store_code) {
		
		List<CartVO> sessionList = (List<CartVO>)session.getAttribute("nonMemCartList");
		System.out.println("뭐임?????????");
		for(int i = 0; i < sessionList.size(); i++){
			 if(sessionList.get(i).getBook_no() == book_no && (sessionList.get(i).getStore_code()).equals(store_code)){
				 CartVO vo = sessionList.get(i);
				 vo.setCnt(cnt);
				 sessionList.set(i, vo);
			 }
		}
		session.setAttribute("nonMemCartList", sessionList);
		System.out.println("sessionList : " + sessionList);
		return "success";
	}
	
	//게시글(리뷰) 상세창으로 이동
		@RequestMapping(value="/goDetailReview.do",method=RequestMethod.GET)
		public String detailReview(int review_no, Model model, HttpSession session) {
			System.out.println("리뷰상세창으로 이동");
			System.out.println("review_no : " + review_no);
			ArticleVO vo = boardService.getReview(review_no);
			boardService.plusReviewCount(review_no);//조회수+1
			System.out.println("조회수증가 메소드 후 ");
			model.addAttribute("articleVO", vo);
			System.out.println("리뷰 articleVO : " + vo);
			return "/seonghyeon/detailReview.jsp";
		}
		
		
	//댓글게시물 작성, 댓글갯수 구하기
	@RequestMapping(value="/insertBoard.do", method=RequestMethod.GET)
	public String insertBoard(HttpSession session, ArticleVO articleVO, int review_b_no) throws IllegalStateException, IOException {
		System.out.println("댓글게시물 새로작성하기");
		System.out.println("review_b_no : " + review_b_no);
//		String id = "hyeon";
		String id = ((UserVO)session.getAttribute("user")).getId();
		//로그인한 사람 아이디 받아오기로 추후에 수정
//		
		articleVO.setReview_mem_id(id);
		System.out.println("id : " + id);
		System.out.println("새로 작성한 articleVO : " + articleVO);
		boardService.insertArticle(articleVO);
		
		return "goBookDetail.do?book_no=" + review_b_no;
	}
	
	@RequestMapping(value= "/goModifyArticle")
	public String goModifyArticle(Model model, HttpSession session, int review_no) {
		String id = ((UserVO)session.getAttribute("user")).getId();
		ArticleVO art = boardService.getReview(review_no);
		art.setReview_mem_id(id);
		model.addAttribute("art", art);
		
		return "/seonghyeon/modifyArticle.jsp";
	}
	
	//게시글(리뷰) 수정 - 제목,내용
	@RequestMapping(value="/modifyBoard.do", method=RequestMethod.GET)
	public String modifyArticle(Model model, HttpSession session, ArticleVO articleVO, int review_no) {
		System.out.println("게시글 수정");
		UserVO user = (UserVO) session.getAttribute("user");
		String id = user.getId();
		articleVO.setReview_mem_id(id);
		articleVO.setReview_no(review_no);
		System.out.println("수정한 articleVO : " + articleVO);
		
		boardService.modifyArticle(articleVO);
		ArticleVO vo = boardService.getReview(review_no);
		
		System.out.println("수정한 articleVO 최종 : " + vo);
		String review_mem_id = articleVO.getReview_mem_id();
		String review_date = articleVO.getReview_date();
		int review_b_no = articleVO.getReview_b_no();
		model.addAttribute("review_mem_id", review_mem_id);
		model.addAttribute("review_date", review_date);
		model.addAttribute("review_b_no", review_b_no);
		return "goDetailReview.do?review_no=" + review_no;
	}
	
	//게시글(리뷰) 삭제 
	@RequestMapping(value="/delArticle.do", method=RequestMethod.POST)
	@ResponseBody
	public int delArticle(int review_no, int review_b_no) {
		System.out.println("게시글 삭제");
		int result=0;
		result = boardService.delArticle(review_no);
		if(result == 1) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		return result;
		
	}

	//카트의 담긴 책 부분 삭제 
	@RequestMapping(value="/deleteCart.do", method=RequestMethod.POST)
	@ResponseBody
	
	public int deleteCart(HttpSession session,
		@RequestParam(value="chBox[]") List<String> chBox)throws Exception {
		System.out.println("deleteCart.do 실행");
		int result = 0;
		int cart_idx = 0;
		
			for(String i : chBox) {
				cart_idx = Integer.parseInt(i);
				cartService.deleteCart(cart_idx);
			}
			result = 1;
		
		return result;
	}
	
	
	@RequestMapping(value="/NondeleteCart.do", method=RequestMethod.POST)
	@ResponseBody
	public int NondeleteCart(HttpSession session,
		@RequestParam(value="chBox[]") List<Integer> chBox)throws Exception {
		@SuppressWarnings("unchecked")
		List<CartVO> sessionList = (List<CartVO>) session.getAttribute("nonMemCartList");
		int[] array = new int[chBox.size()];
		
		int a = 0;
		
		for(int str: chBox) {//지우려고 선택한 체크박스 
			for(int i=0; i<sessionList.size(); i++) {
				if(sessionList.get(i).getBook_no() == str) {
					array[a] = i;
				}
			}
			a++;
		}
		
		for(int b= array.length -1;  b>=0 ; b--) {//array : 지워야할책인덱스 
			sessionList.remove(array[b]);
		}
		session.setAttribute("nonMemCartList", sessionList);
		System.out.println("nonMemCart request : " + sessionList);
		int result = 1;
		return result;
	}
	
	
	
	
	//페이징처리 메소드
	   public static Paging pagingMethod(int totalRecord, int cPage) {
	      Paging p = new Paging();
	      p.setTotalRecord(totalRecord);//전체 게시글 수 저장
	      p.setTotalPage();//하나당 페이지에 표시할 게시글 수를 계산해서 총 몇 페이지인지 계산하는 메소드 실행
	      
	      //2.현재 페이지 구하기
	      p.setNowPage(cPage);
	      
	      //3.현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
	      p.setEnd(p.getNowPage() * p.getNumPerPage());//나타낼 게시물의 끝 번호
	      p.setBegin(p.getEnd() - p.getNumPerPage() + 1);//나타낼 게시글의 시작 번호
	      
	      //3-1. 글 끝번호가 데이터 건 수보다 많아지면 데이터 건 수와 동일한 번호로 설정
	      if(p.getEnd() > p.getTotalRecord()) {
	         p.setEnd(p.getTotalRecord());
	      }
	      
	      //블록 = ex. 한페이지에 1, 2, 3 -> 1번째블록, 4, 5, 6 -> 2번째블록
	      //4.블록의 시작페이지, 끝페이지 구하기(페이지 아래에서 블록 선택하기 위함)
	      int nowBlock = (p.getNowPage() - 1) / p.getPagePerBlock() + 1;//현재블록 = (현재 페이지 - 1) / 페이지당 블록 수 + 1
	      int endPage = nowBlock * p.getPagePerBlock();
	      int beginPage = endPage - p.getPagePerBlock() + 1;
	      p.setEndPage(endPage);
	      p.setBeginPage(beginPage);
	      
	      //4-1.끝페이지(endpage)가 전체 페이지 수(totalPage)보다 크면
	      //끝페이지를 전체 페이지수로 변경처리
	      if(p.getEndPage() > p.getTotalPage()) {
	         p.setEndPage(p.getTotalPage());
	      }
	      
	      return p;
	   }
	
	
	
	
	
	
	
	
	
	
}
