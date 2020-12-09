package com.spring.biz.book;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boarddao;
	
	@Override
	public List<ArticleVO> getReviewList() {
		return boarddao.getList();
	}

	@Override
	public void insertArticle(ArticleVO vo) {
		boarddao.insertArticle(vo);
		
	}

	@Override
	public ArticleVO getReview(int review_no) {
		return boarddao.getReview(review_no);
	}

	@Override
	public Integer getCntArticle(int book_no) {
		return boarddao.getCntArticle(book_no);
	}

	@Override
	public int delArticle(int review_no) {
		return boarddao.delArticle(review_no);
		
		
	}

	@Override
	public void modifyArticle(ArticleVO articleVO) {
		boarddao.modifyArticle(articleVO);
		System.out.println("serviceImpl출력중.....");
	}

	@Override
	public void plusReviewCount(int review_no) {
		boarddao.plusReviewCount(review_no);
		
	}

	

	
	

	
	
	

}
