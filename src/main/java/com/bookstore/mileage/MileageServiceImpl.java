package com.bookstore.mileage;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.order.vo.MyMileageVO;

//@Service : @Component 상속확장 어노테이션
//비즈니스 로직처리 서비스 영역에 사용
@Service("mileageService")
public class MileageServiceImpl implements MileageService {
	@Autowired
	private MileageDAOMybatis mileageDAO;
	public MileageServiceImpl() {
	System.out.println(">>mileageServiceeImpl() 객체생성");
	}
	@Override
	public List<MyMileageVO> getMyMileage(int order_no) {
		return mileageDAO.getMyMileage(order_no);
				}
	@Override
	public List<MyMileageVO> getMyMileageDateList(HashMap<String, String> map) {
		return mileageDAO.getMyMileageDateList(map);
	}

 }
