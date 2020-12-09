package com.bit.bookstore.soomin.view.online;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.bookstore.soomin.online.OnlineStoreService;
import com.bit.bookstore.vo.QNAVO;
import com.bit.bookstore.vo.QNA_commentVO;

@Controller
@RequestMapping("/soomin/online")
public class BoardController {
	
	@Autowired
	private OnlineStoreService onlineStoreService;
	
	//qna상세 페이지
	@RequestMapping("/qnaDetail.do")
	public String qnaDetail(
			@RequestParam(required = false, defaultValue = "0") int qna_no,
			HttpSession session, Model model) {
		
		//세션에 관리자 로그인이 되어있는지 확인
		if(session.getAttribute("admin") == null) {
			new OnlineStoreController().notAdminLogin(model);
			return "../alert.jsp";
		}
		
		
		QNAVO qnavo = onlineStoreService.getQNAVO(qna_no);
		
		if(qnavo.getQna_answer() == 1) {
			List<QNA_commentVO> qna_commentList = onlineStoreService.getQNA_commentList(qna_no);
			model.addAttribute("qna_commentList", qna_commentList);
		}
		
		
		model.addAttribute("qnavo", qnavo);
		
		return "qnaDetail.jsp";
	}
	
	//qna 답글 넣기 메소드
	@RequestMapping(value = "/qnaCommentFinish.do")
	public String qnaCommentFinish(
			@ModelAttribute QNA_commentVO qna_commentvo,
			HttpSession session,
			Model model){
		
		System.out.println("qnaCommentFinish.do 연결 메소드");
		String alert = "";
		
		int success = onlineStoreService.insertQNA_comment(qna_commentvo);
		
		//insert성공시
		if(success == 1) {
			onlineStoreService.updateQNA_Answer(qna_commentvo.getQna_no());
			alert = "답변이 성공적으로 작성되었습니다.";
		}else {
			alert = "답변 작성에 실패하였습니다. 다시 시도하세요.";
		}
		
		model.addAttribute("alert", alert);
		model.addAttribute("path", "soomin/online/qnaList.do");
		
		return "../alert.jsp";
	}
	
}
