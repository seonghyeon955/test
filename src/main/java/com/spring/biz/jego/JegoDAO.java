package com.spring.biz.jego;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JegoDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public JegoDAO() {
		System.out.println("JegoDAO 생성");
	}
	
	public List<JegoVO> getJego(int book_no ) {
		return mybatis.selectList("jegomapper.getJego", book_no);
	}
	
	public JegoVO getJego(String store_code){
		return mybatis.selectOne("jegomapper.getJego",store_code);
	}
	
	public JegoVO getJego2(String store_code){
		return null;
	}
	public List<JegoVO> getPickupjego(int book_no){
		return mybatis.selectList("jegomapper.getPickupjego", book_no);
	}
}
