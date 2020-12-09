package com.spring.biz.book;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewdao;

	@Override
	public int getTotalCount() {
		return reviewdao.getTotalCount();

	}

	@Override
	public List<ReviewVO> getList(Map<String, Integer> map) {
		return reviewdao.getList(map);
		
	}

	@Override
	public ReviewVO selectOne(int review_no) {
		return reviewdao.selectOne(review_no);
	}

	@Override
	public int insertReview(ReviewVO rvo) {
		return reviewdao.insertReview(rvo);
	}

	@Override
	public int updateReview(int review_no) {
		return reviewdao.updateReview(review_no);
	}

	@Override
	public int deleteReview(int review_no) {
		return reviewdao.deleteReview(review_no);
	}

	@Override
	public List<CommVO> getCommList(int review_co_no) {
		return reviewdao.getCommList(review_co_no);
	}

	@Override
	public int insertComment(CommVO cvo) {
		return reviewdao.insertComment(cvo);
	}

	@Override
	public int deleteComment(int review_co_no) {
		return reviewdao.deleteComment(review_co_no);
	}

	

		
}
