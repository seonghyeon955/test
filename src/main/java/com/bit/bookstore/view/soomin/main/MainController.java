package com.bit.bookstore.view.soomin.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.bit.bookstore.Paging;
import com.bit.bookstore.soomin.main.MainService;
import com.bit.bookstore.soomin.online.OnlineStoreService;
import com.bit.bookstore.soomin.view.online.ProductController;
import com.bit.bookstore.soomin.view.online.StaticMethod;
import com.bit.bookstore.vo.GoodsVO;
import com.bit.bookstore.vo.QNAVO;
import com.bit.bookstore.vo.QNA_commentVO;
import com.bit.bookstore.vo.UserVO;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@Autowired
	OnlineStoreService onlineStoreService;
	
	//메인페이지(카테고리 리스트로 받아서 jsp페이지에 전달해야 함
	@RequestMapping("/main.do")
	public String mainPage(Model model) {
		
		//category_code찾기->category_main찾기->category_name찾기=>카테고리 전체 리스트 찾아서 jsp에서 for문 돌려주자 ㅎㅎ
		
		mainPageCategory(model);
		
		
		//book_no, book_img, book_name, book_published_date 받아오면 됨
		//베스트셀러 책 리스트 6개
		//책 넘버만 받아옴
		List<Integer> bookList = mainService.getBestSellerBookNo();
		System.out.println(bookList);
		List<com.bit.bookstore.vo.BookVO> bestSellerList = mainService.getBookListByBookNo(bookList);
		System.out.println(bestSellerList);
		model.addAttribute("bestSellerList", bestSellerList);
		
		
		//스테디셀러 책 리스트 6개
		bookList = mainService.getSteadySellerBookNo();
		List<com.bit.bookstore.vo.BookVO> steadySellerList = mainService.getBookListByBookNo(bookList);
		System.out.println(steadySellerList);
		model.addAttribute("steadySellerList", steadySellerList);
		
		
		//신간 책 리스트 6개
		bookList = mainService.getNewBookBookNo();
		List<com.bit.bookstore.vo.BookVO> newBookList = mainService.getBookListByBookNo(bookList);
		System.out.println(newBookList);
		model.addAttribute("newBookList", newBookList);
		
		
		//새로입고된 굿즈 리스트 6개
		List<GoodsVO> newGoodsList = mainService.getNewGoodsList();
		model.addAttribute("newGoodsList", newGoodsList);
		
		return "mainBook/main.jsp";
	}
	
	
	//QNA리스트
	@RequestMapping("/QnAList.do")
	public String QnAList(
			@RequestParam(required = false, defaultValue = "1") int cPage,//현재 페이지
			@RequestParam(required = false) String search,//검색어
			@RequestParam(required = false, defaultValue = "2") int qna_answer,//답변 된 것만, 또는 전체 등등
			@RequestParam(required = false, defaultValue = "0") int search_where,//제목, 작성자 등등 어떤 걸로 검색할 건지
			Model model, HttpSession session) {
		
		//*************로그인 되어있다고 가정
//		UserVO user = new UserVO();
//		user.setId("genie");
//		session.setAttribute("user", user);
		//**************
		
		
		
		//main 카테고리 뽑기
		mainPageCategory(model);
		
		//Q&A리스트 뽑기
		
		//페이징 처리를 위한 pageing 객체 생성해서 값 읽고 설정
		
		//1.전체 게시물의 수 구하기(QNAList의 모든 데이터)
		int totalRecord = onlineStoreService.getQNAListTotalCount(search, qna_answer, search_where);//DB에 저장된 전체 데이터 수를 가져옴
		Paging p = StaticMethod.pagingMethod(totalRecord, cPage);
		
		List<QNAVO> QNAList = onlineStoreService.getQNAList(
				p.getBegin(), p.getEnd(), search, qna_answer, search_where);
		
		
		System.out.println(totalRecord);
		
		//리스트와 p객체 저장해서 전달
		model.addAttribute("QNAList", QNAList);
		model.addAttribute("pvo", p);
		model.addAttribute("search", search);
		model.addAttribute("qna_answer", qna_answer);
		model.addAttribute("search_where", search_where);
		
		
		return "soomin/QnA/QnAList.jsp";
	}
	
	
	
	
	//QNADetial
	@RequestMapping("/QnADetail.do")
	public String QnADetail(
			@RequestParam(required = false, defaultValue = "0") int qna_no ,Model model, HttpSession session) {
		
		//main 카테고리 뽑기
		mainPageCategory(model);
		
		//qna 글 vo 가져오기
		QNAVO qnavo = onlineStoreService.getQNAVO(qna_no);
		
		//로그인 안 되어있거나
		//작성자가 아닐 경우 조회수 +1
		if(session.getAttribute("user") == null || ((UserVO)session.getAttribute("user")).getId() != qnavo.getQna_mem_id()) {
			mainService.updateQnACnt(qna_no);
			
			qnavo.setQna_count(qnavo.getQna_count() + 1);
		}
		
		if(qnavo.getQna_answer() == 1) {
			List<QNA_commentVO> qna_commentList = onlineStoreService.getQNA_commentList(qna_no);
			model.addAttribute("qna_commentList", qna_commentList);
		}
		
		
		model.addAttribute("qnavo", qnavo);
		
		
		return "soomin/QnA/QnADetail.jsp";
	}
	
	
	//QNAWrite
	@RequestMapping("/QnAWrite.do")
	public String QnAWrite(Model model) {
		//main 카테고리 뽑기
		mainPageCategory(model);
		
		
		return "soomin/QnA/QnAWrite.jsp";
	}
	
	//QnA작성완료, 수정 -> 데이터 넣기, 수정
	@RequestMapping(value = "/QnAWriteFinish.do", method = RequestMethod.POST)
	public String QnAWriteFinish(
			@ModelAttribute QNAVO qnavo, 
			HttpServletRequest request,
			MultipartFile uploadFile, 
			Model model) throws IOException {
		
		System.out.println("qnavo : " + qnavo);
		
		String alert = "";
		String path = "";
		
		
		
		//uploadFile 비어있는지 확인
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();//기존 파일명
			String f_path = request.getServletContext().getRealPath("resources/images/qna");
			System.out.println("저장 경로 : " + path);
			fileName = new ProductController().fileUploadMethod(fileName, uploadFile.getBytes(), f_path, uploadFile);
			qnavo.setQna_file_name(fileName);
		}
		
		int insertSuccess = 0;
		
		
		if(qnavo.getQna_no() != 0) {//수정일 경우
			insertSuccess = mainService.updateQnA(qnavo);
			if(insertSuccess != 1) {
				alert = "QnA수정이 제대로 되지 않고 에러가 발생했습니다. 다시 시도하세요.";
				path = "QnAModify.do?qna_no=" + qnavo.getQna_no();
			}else {
				alert = "수정이 완료되었습니다.";
				path = "QnADetail.do?qna_no=" + qnavo.getQna_no();
			}
		}else {//새로운 글 작성일 경우
			insertSuccess = mainService.insertQnA(qnavo);
			if(insertSuccess != 1) {
				alert = "QnA작성이 제대로 되지 않고 에러가 발생했습니다. 다시 시도하세요.";
				path = "QnAWrite.do";
			}else {
				alert = "글이 제대로 작성되었습니다.";
				path = "QnAList.do";
			}
		}
		
		
		
		model.addAttribute("alert", alert);
		model.addAttribute("path", path);

		
		return "soomin/alert.jsp";
	}
	
	
	//QNA수정완료하기
	@RequestMapping("QnAModify.do")
	public String QnAModify(@RequestParam int qna_no, Model model) {
		
		//main 카테고리 뽑기
		mainPageCategory(model);
		
		//qna 글 vo 가져오기
		QNAVO qnavo = onlineStoreService.getQNAVO(qna_no);
		model.addAttribute("qnavo", qnavo);
		
		return "soomin/QnA/QnAModify.jsp";
	}
	
	
	//QNA삭제하기
	@RequestMapping("/QnADelete.do")
	public String QnADelete(@RequestParam int qna_no, Model model) {
		
		int deleteSuccess = mainService.deleteQnA(qna_no);
		
		String alert = "";
		String path = "";
		
		if(deleteSuccess != 1) {
			alert = "삭제가 제대로 작동하지 않았습니다. 다시 시도하여 주제요.";
			path = "QnADetail.do?qna_no=" + qna_no;
		}else {
			alert = "삭제되었습니다.";
			path = "QnAList.do";
		}
		
		model.addAttribute("alert", alert);
		model.addAttribute("path", path);
		
		return "soomin/alert.jsp";
	}
	
	
	
	//카테고리 저장
	public void mainPageCategory(Model model) {
		List<String> categoryCode = mainService.getCategoryCode1();
//		System.out.println(categoryCode);
		model.addAttribute("categoryCode", categoryCode);
		
		Map<String, List<String>> codemainmap = new HashMap<String, List<String>>();
		
		List<String> CategorymainList = new ArrayList<String>();
		
		Map<String, List<String>> mainnamemap = new HashMap<String, List<String>>();
		List<String> CategorynameList = new ArrayList<String>();
		
		for(int c = 0; c < categoryCode.size(); c++) {
//			System.out.println("category_code : " + categoryCode.get(c));
			String category_code = categoryCode.get(c);
			CategorymainList = mainService.getCategoryMain(category_code);
			codemainmap.put(category_code, CategorymainList);
			for(int m = 0; m < CategorymainList.size(); m++) {
				CategorynameList = mainService.getCategoryName(CategorymainList.get(m));
//				System.out.println("categorymainList : " + CategorymainList);
				mainnamemap.put(CategorymainList.get(m), CategorynameList);
			}
			
		}
		
		model.addAttribute("codemainmap", codemainmap);
		model.addAttribute("mainnamemap", mainnamemap);
	}
	
	
}
