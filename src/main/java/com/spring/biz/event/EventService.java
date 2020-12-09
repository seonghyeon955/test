package com.spring.biz.event;

import java.util.List;

public interface EventService {
	void insertEvent(EventVO vo);
	void updateEvent(EventVO vo);
	void deleteEvent(EventVO vo);
	EventVO getEvent(EventVO vo);
	List<EventVO> getEvents(int book_no);
	int getEventCnt(int book_no);
	
		
}
