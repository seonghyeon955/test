package com.spring.biz.book;

import java.util.List;
import java.util.Map;


public interface BoardService {
	
	List<ArticleVO> getReviewList();
	void insertArticle(ArticleVO vo);
	ArticleVO getReview(int review_no);
	Integer getCntArticle(int book_no );
	int delArticle(int review_no);
	void modifyArticle(ArticleVO articleVO );
	void plusReviewCount(int review_no);
	
}
