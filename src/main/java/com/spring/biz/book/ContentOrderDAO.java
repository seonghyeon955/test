package com.spring.biz.book;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ContentOrderDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ContentOrderDAO() {
		System.out.println("EventDAO 생성 ~~~~");
	}
	
//	public void insertContentOrder(ContentOrderVO vo) {
//		mybatis.insert("bookmapper.insertContentOrder", vo);
//	}
//	
//	public void updateContentOrder(ContentOrderVO vo) {
//		mybatis.update("bookmapper.updateContentOrder", vo);
//	}
//	
//	public void deleteContentOrder(ContentOrderVO vo) {
//		mybatis.delete("bookmapper.deleteContentOrder", vo);
//	}
//	
	
	public List<ContentOrderVO> getContentOrders(int book_no){
		return mybatis.selectList("bookmapper.getContent",book_no);
	}
	
	
}
