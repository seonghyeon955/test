package com.spring.biz.book;

import java.util.Date;

public class CommVO {
	private int review_co_no, review_no;
	private Date review_co_date;
	private String review_co_content, review_co_id;
	
	public CommVO() {
		System.out.println("CommVO 생성~~~~~");
	}
	
	public CommVO(int review_co_no, int review_no, Date review_co_date, String review_co_content, String review_co_id) {
		super();
		this.review_co_no = review_co_no;
		this.review_no = review_no;
		this.review_co_date = review_co_date;
		this.review_co_content = review_co_content;
		this.review_co_id = review_co_id;
	}

	public int getReview_co_no() {
		return review_co_no;
	}

	public void setReview_co_no(int review_co_no) {
		this.review_co_no = review_co_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public Date getReview_co_date() {
		return review_co_date;
	}

	public void setReview_co_date(Date review_co_date) {
		this.review_co_date = review_co_date;
	}

	public String getReview_co_content() {
		return review_co_content;
	}

	public void setReview_co_content(String review_co_content) {
		this.review_co_content = review_co_content;
	}

	public String getReview_co_id() {
		return review_co_id;
	}

	public void setReview_co_id(String review_co_id) {
		this.review_co_id = review_co_id;
	}

	@Override
	public String toString() {
		return "CommVO [review_co_no=" + review_co_no + ", review_no=" + review_no + ", review_co_date="
				+ review_co_date + ", review_co_content=" + review_co_content + ", review_co_id=" + review_co_id + "]";
	}
	
	
}
