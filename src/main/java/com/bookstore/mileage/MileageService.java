package com.bookstore.mileage;

import java.util.HashMap;
import java.util.List;

import com.bookstore.order.vo.MyMileageVO;


public interface MileageService {

	List<MyMileageVO> getMyMileage(int order_no);
	List<MyMileageVO> getMyMileageDateList(HashMap<String, String> map);
	
}