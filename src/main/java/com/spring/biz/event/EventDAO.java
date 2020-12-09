package com.spring.biz.event;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public EventDAO() {
		System.out.println("EventDAO 생성 ~~~~");
	}
	
	public void insertEvent(EventVO vo) {
		mybatis.insert("eventmapper.insertEvent", vo);
	}
	
	public void updateEvent(EventVO vo) {
		mybatis.update("eventmapper.updateEvent", vo);
	}
	
	public void deleteEvent(EventVO vo) {
		mybatis.delete("eventmapper.deleteEvent", vo);
	}
	
	public EventVO getEvent(EventVO vo) {
		return  mybatis.selectOne("eventmapper.selectEvent", vo);
		
	}
	
	public List<EventVO> getEvents(int book_no){
		return mybatis.selectList("eventmapper.selectEvents",book_no);
	}
	
	public int getEventCnt(int book_no) {
		System.out.println("왜안나오냐고옹");
		return mybatis.selectOne("eventmapper.selectEventCnt",book_no);
	}
}
