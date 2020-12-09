package com.spring.biz.book;

import java.util.List;
import java.util.Map;

public interface ReviewService {

//	void insertReview(ReviewVO vo);
//	void updateReview(ReviewVO vo);
//	void deleteReview(String review_mem_id);
//	List<ReviewVO> getReviewList(int book_no);
	
	int getTotalCount();
	List<ReviewVO>getList(Map<String,Integer> map);
	ReviewVO selectOne(int review_no);
	int insertReview(ReviewVO rvo);
	int updateReview(int review_no);
	int deleteReview(int review_no);
	
	List<CommVO>getCommList(int review_co_no);
	int insertComment(CommVO cvo);
	int deleteComment(int review_co_no);
	
	
}
