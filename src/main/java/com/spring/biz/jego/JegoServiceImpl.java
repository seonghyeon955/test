package com.spring.biz.jego;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("jegoService")
public class JegoServiceImpl implements JegoService {
	
	@Autowired
	private JegoDAO jegodao;

	@Override
	public List<JegoVO> getjego(int book_no) {
		return jegodao.getJego(book_no);
		
	}


	@Override
	public JegoVO getJego(String store_code) {
		return jegodao.getJego(store_code);
	}


	@Override
	public JegoVO getJego2(String store_code) {
		return jegodao.getJego2(store_code);
	}


	@Override
	public List<JegoVO> getPickupjego(int book_no) {
		return jegodao.getPickupjego(book_no);
	}

}
