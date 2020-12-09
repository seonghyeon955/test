package com.bit.bookstore.soomin.view.online;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bit.bookstore.Paging;
import com.bit.bookstore.soomin.online.OnlineStoreService;
import com.spring.biz.office.OfficeVO;

public class StaticMethod {
	
	@Autowired
	static
	OnlineStoreService onlineStoreService;
	
	//페이징처리 메소드
	public static Paging pagingMethod(int totalRecord, int cPage) {
		Paging p = new Paging();
		p.setTotalRecord(totalRecord);//전체 게시글 수 저장
		p.setTotalPage();//하나당 페이지에 표시할 게시글 수를 계산해서 총 몇 페이지인지 계산하는 메소드 실행
		
		//2.현재 페이지 구하기
		p.setNowPage(cPage);
		
		//3.현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());//나타낼 게시물의 끝 번호
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);//나타낼 게시글의 시작 번호
		
		//3-1. 글 끝번호가 데이터 건 수보다 많아지면 데이터 건 수와 동일한 번호로 설정
		if(p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		//블록 = ex. 한페이지에 1, 2, 3 -> 1번째블록, 4, 5, 6 -> 2번째블록
		//4.블록의 시작페이지, 끝페이지 구하기(페이지 아래에서 블록 선택하기 위함)
		int nowBlock = (p.getNowPage() - 1) / p.getPagePerBlock() + 1;//현재블록 = (현재 페이지 - 1) / 페이지당 블록 수 + 1
		int endPage = nowBlock * p.getPagePerBlock();
		int beginPage = endPage - p.getPagePerBlock() + 1;
		p.setEndPage(endPage);
		p.setBeginPage(beginPage);
		
		//4-1.끝페이지(endpage)가 전체 페이지 수(totalPage)보다 크면
		//끝페이지를 전체 페이지수로 변경처리
		if(p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		return p;
	}
	
	//메인 카테고리 바에서 리스트로 뽑는 곳
	public static List<OfficeVO> categoryList(){
		
		//카테고리 코드 불러오기
		List<OfficeVO> categoryCode = onlineStoreService.getCategoryList();
		
		return categoryCode;
	}
	
	
}
