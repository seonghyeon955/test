package com.spring.biz.event;

import java.util.Date;

public class EventVO {

	public int event_idx, views, event_exist, event_book_rate, category_no,
		book_no,event_cnt;
	public String event_type, event_title, event_content, img_path, event_file_name;
	public Date event_start, event_end, event_write_date;
	
	public EventVO() {
		System.out.println("EventVO 생성~~~");
		
	}
	
	
	public EventVO(int event_cnt,int event_idx, int views, int event_exist, int event_book_rate, int category_no, int book_no,
			String event_type, String event_title, String event_content, String img_path, String event_file_name,
			Date event_start, Date event_end, Date event_write_date) {
		super();
		this.event_cnt=event_cnt;
		this.event_idx = event_idx;
		this.views = views;
		this.event_exist = event_exist;
		this.event_book_rate = event_book_rate;
		this.category_no = category_no;
		this.book_no = book_no;
		this.event_type = event_type;
		this.event_title = event_title;
		this.event_content = event_content;
		this.img_path = img_path;
		this.event_file_name = event_file_name;
		this.event_start = event_start;
		this.event_end = event_end;
		this.event_write_date = event_write_date;
	}
	public void setEvent_cnt(int event_cnt) {
		this.event_cnt = event_cnt;
	}
	
	public int getEvent_cnt() {
		return event_cnt;
	}
	
	public int getEvent_idx() {
		return event_idx;
	}


	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}


	public int getViews() {
		return views;
	}


	public void setViews(int views) {
		this.views = views;
	}


	public int getEvent_exist() {
		return event_exist;
	}


	public void setEvent_exist(int event_exist) {
		this.event_exist = event_exist;
	}


	public int getEvent_book_rate() {
		return event_book_rate;
	}


	public void setEvent_book_rate(int event_book_rate) {
		this.event_book_rate = event_book_rate;
	}


	public int getCategory_no() {
		return category_no;
	}


	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}


	public int getBook_no() {
		return book_no;
	}


	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}


	public String getEvent_type() {
		return event_type;
	}


	public void setEvent_type(String event_type) {
		this.event_type = event_type;
	}


	public String getEvent_title() {
		return event_title;
	}


	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}


	public String getEvent_content() {
		return event_content;
	}


	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}


	public String getImg_path() {
		return img_path;
	}


	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}


	public String getEvent_file_name() {
		return event_file_name;
	}


	public void setEvent_file_name(String event_file_name) {
		this.event_file_name = event_file_name;
	}


	public Date getEvent_start() {
		return event_start;
	}


	public void setEvent_start(Date event_start) {
		this.event_start = event_start;
	}


	public Date getEvent_end() {
		return event_end;
	}


	public void setEvent_end(Date event_end) {
		this.event_end = event_end;
	}


	public Date getEvent_write_date() {
		return event_write_date;
	}


	public void setEvent_write_date(Date event_write_date) {
		this.event_write_date = event_write_date;
	}


	@Override
	public String toString() {
		return "EventVO [event_idx=" + event_idx + ", views=" + views + ", event_exist=" + event_exist
				+ ", event_book_rate=" + event_book_rate + ", category_no=" + category_no + ", book_no=" + book_no
				+ ", event_type=" + event_type + ", event_title=" + event_title + ", event_content=" + event_content
				+ ", img_path=" + img_path + ", event_file_name=" + event_file_name + ", event_start=" + event_start
				+ ", event_end=" + event_end + ", event_write_date=" + event_write_date + "]";
	}
	
	
	
	
	
	
	
}
