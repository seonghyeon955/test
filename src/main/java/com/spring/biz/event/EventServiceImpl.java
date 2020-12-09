package com.spring.biz.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("eventService")
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDAO eventdao;
	
	@Override
	public void insertEvent(EventVO vo) {
		eventdao.insertEvent(vo);		
	}

	@Override
	public void updateEvent(EventVO vo) {
		eventdao.updateEvent(vo);
		
	}

	@Override
	public void deleteEvent(EventVO vo) {
		eventdao.deleteEvent(vo);
		
	}

	@Override
	public EventVO getEvent(EventVO vo) {
		return eventdao.getEvent(vo);
		
	}

	@Override
	public List<EventVO> getEvents(int book_no) {
		return eventdao.getEvents(book_no);
		
	}

	@Override
	public int getEventCnt(int book_no) {
		return eventdao.getEventCnt(book_no);
	}

	
}
