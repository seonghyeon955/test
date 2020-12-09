package com.spring.biz.book;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public BoardDAO() {
		System.out.println("BoardDAO생성~~~~~");
	}
	
	//게시글의 갯수 가져오기
	public int getCntArticle(int book_no) {
		Integer reviewCnt = mybatis.selectOne("bookmapper.getCntArticle", book_no);
		return reviewCnt;
	}
		
	//페이지에 해당하는 글목록(게시글) 가져오기
	public List<ArticleVO> getListPerPage(Map<String,Object> map){
		List<ArticleVO> list = mybatis.selectList("bookmapper.getListPerPage", map);
		return list;
	}
		
	//게시글 전체목록 가져오기
	public List<ArticleVO> getList(){
		List<ArticleVO> list=mybatis.selectList("bookmapper.getArticleList");
		return list;
	}
	
	
	
//	//게시글 조회
//	public ArticleVO selectArticle(int review_no ) {
//		ArticleVO articlevo = mybatis.selectOne("bookmapper.selectArticle", review_no);
//		return articlevo;
//	}
	
	
	//게시글 추가
	public int insertArticle(ArticleVO vo) {
		int result = mybatis.insert("bookmapper.insertArticle", vo);
		return result;
	}
	
	//게시글 수정
	public void modifyArticle(ArticleVO articleVO) {
		mybatis.update("bookmapper.modifyArticle", articleVO);
		System.out.println("마이바티스출력중");
	}
	
	//게시글 지우기
	public int delArticle(int review_no) {
		int result = mybatis.delete("bookmapper.delArticle", review_no);
		return result;
	}
	
	//조회수 구하기
	public void plusReviewCount(int review_no) {
		mybatis.update("bookmapper.plusReviewCount", review_no);
		
	}
	
	
	//게시글 넘버에 따른 게시글 한개 가져오기
	public ArticleVO getReview(int review_no) {
		ArticleVO vo = mybatis.selectOne("bookmapper.getArticle", review_no);
		return vo;
	}
	
	String changeDate(int book_no) {
		return mybatis.selectOne("bookmapper.changeDate", book_no);
	}
	
	

}
