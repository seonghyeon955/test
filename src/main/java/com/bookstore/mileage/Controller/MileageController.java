package com.bookstore.mileage.Controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.mileage.MileageService;
import com.bookstore.order.vo.MyMileageVO;

@Controller("Mile")
@RequestMapping("/kyungnan")
public class MileageController {
	
	@Autowired
	MileageService mileageService;
	
	@RequestMapping("/getMyMileage.do")
	public String  getMyMileage(int order_no, Model model) {
		System.out.println(">> 마일리지페이지 이동");
		System.out.println(">>order_no" + order_no);
		List<MyMileageVO> MileageList = mileageService.getMyMileage(order_no);
		model.addAttribute("MileageList", MileageList);
		
		return "myOrderDetail.jsp";
	}
	@RequestMapping(value="/getMyMileageDateList.do", method=RequestMethod.POST)
	public String getMyMileageDateList(@RequestParam(required = false,defaultValue = "2020") String start_year,
													@RequestParam(required = false,defaultValue = "01") String start_month,
													@RequestParam(required = false,defaultValue = "2020") String end_year,
													@RequestParam(required = false,defaultValue = "12") String end_month ,Model model) {
		String start_date = start_year + "-" + start_month;
		String end_date = end_year + "-" + end_month;
		
		System.out.println("ㄱㄱㄱㄱㄱㄱㄱㄱㄱ");
		String id="genie";
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		System.out.println(start_date +end_date) ;
		List<MyMileageVO> mileagedateList = mileageService.getMyMileageDateList(map);
		model.addAttribute("mileagedateList",mileagedateList);
		System.out.println(mileagedateList) ;
		return "myMileage.jsp";
	}
	
}




