package com.spring.biz.book;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reviewDAO")
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ReviewDAO() {
		System.out.println("ReviewDAO 생성~~~");
	}
	
	// 게시글(Review)의 전체 건수 조회
	public  int getTotalCount() {
//		mybatis.selectOne("bookmapper.totalCount");
		return 1;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기
	public   List<ReviewVO> getList(Map<String,Integer> map){
		 List<ReviewVO> list = mybatis.selectList("bookmapper.getList", map);
		 return list;
	}
	
	//게시글 조회
	public  ReviewVO selectOne(int review_no) {
		ReviewVO vo = mybatis.selectOne("bookmapper.getReview", review_no);
		return vo;
	}
	
	//게시글 입력처리
	public  int insertReview(ReviewVO rvo) {
		int result =  mybatis.insert("bookmapper.insertReview",rvo);
		return result;
	}
	
	//게시글 수정
	public  int updateReview(int review_no) {
		int result = mybatis.update("bookmapper.updateReview", review_no);
		return result;
	}
	
	//게시글 삭제
	public  int deleteReview(int review_no) {
		int result = mybatis.delete("bookmapper.deleteReview", review_no);
		return result;
	}
	
//	//조회수 1 증가 처리(게시글수정)
//	public static int updateHit(int review_no) {
//		int result = mybatis.update("bookmapper.updateHit", review_no);
//		return result;
//	}
	
	//댓글관련~~~~~~~~///////////////////////////////////////////////////////////
	
	
	public  List<CommVO> getCommList(int review_co_no){
		List<CommVO> list = mybatis.selectList("bookmapper.commList", review_co_no);
		return list;
	}
	
	//댓글 입력처리
	public  int insertComment(CommVO cvo) {
		int result = mybatis.insert("bookmapper.insertComm", cvo);
		return result;
	}
	
	//댓글삭제
	public  int deleteComment(int review_co_no ) {
		int result = mybatis.delete("bookmapper.deleteComm", review_co_no);
		return result;
		
	}
	
	
	
//	public void insertReview(ReviewVO vo) {
//		mybatis.insert("bookmapper.insertReview", vo);
//	}
//	
//	public void updateReview(ReviewVO vo) {
//		mybatis.update("bookmapper.updateReview", vo);
//	}
//	
//	public void deleteReview(String review_mem_id) {
//		mybatis.delete("bookmapper.deleteReview", review_mem_id);
//	}
//	
//	public List<ReviewVO> getReview(int book_no) {
//		return mybatis.selectList("bookmapper.getReviewList", book_no);
//	}
//	
	
}
