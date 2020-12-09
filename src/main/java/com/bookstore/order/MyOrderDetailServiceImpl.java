package com.bookstore.order;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.order.vo.MyOrderBookVO;
import com.bookstore.order.vo.MyOrderGoodsVO;
import com.bookstore.order.vo.MyOrderVO;
import com.bookstore.order.vo.MyReturnVO;
//@Service : @Component 상속확장 어노테이션
//비즈니스 로직처리 서비스 영역에 사용
@Service("myorderdetailService")
public class MyOrderDetailServiceImpl implements MyOrderDetailService {
	@Autowired
	private MyOrderDetailDAOMybatis myorderdetailDAO;
	public MyOrderDetailServiceImpl() {
	System.out.println(">>myorderServiceImpl() 객체생성");
	}

	@Override
	public MyOrderVO getMyOrder(MyOrderVO vo) {
	return myorderdetailDAO.getMyOrder(vo);
	}
	
	@Override
	public List<MyOrderVO> getMyOrderId(String myid) {
    return myorderdetailDAO.getMyOrderId(myid);
    }
    @Override
    public List<MyOrderVO> getMyOrderList(MyOrderVO vo) {
    return myorderdetailDAO.getMyOrderList(vo);
    }

	@Override
	public List<MyOrderVO> getMyOrderDateList(HashMap<String, String> map) {
		return myorderdetailDAO.getMyOrderDateList(map);
	}

	@Override
	public List<MyOrderBookVO> getOrderBookList(int order_no) {
		return myorderdetailDAO.getOrderBookList(order_no);
	}

	@Override
	public List<MyOrderGoodsVO> getOrderGoodsList(int order_no) {
		return myorderdetailDAO.getOrderGoodsList(order_no);
	}

	@Override
	public MyOrderVO getDelivery(int order_no) {
		return myorderdetailDAO.getDelivery(order_no);
	}

	@Override
	public MyReturnVO getMyRetrun(MyReturnVO vo) {
		return myorderdetailDAO.getMyRetrun(vo);
	}

	@Override
	public MyReturnVO getMyRetrunVo(MyReturnVO vo) {
		return myorderdetailDAO.getMyRetrunVo(vo);
	}

	@Override
	public List<MyReturnVO> getMyRetrunId(int order_no) {
		return myorderdetailDAO.getMyRetrunId(order_no);
	}

	@Override
	public List<MyReturnVO> getMyRetrunId(String myreturnid) {
		return myorderdetailDAO.getMyRetrunId(myreturnid);

	}

	@Override
	public List<MyReturnVO> getMyRetrunDateList(HashMap<String, String> map) {
		return myorderdetailDAO.getMyRetrunDateList(map);
	}
 }
