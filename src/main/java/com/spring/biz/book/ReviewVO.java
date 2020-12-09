package com.spring.biz.book;

import java.util.Date;

public class ReviewVO {

	private int review_no, review_b_no, review_count, review_status;
	private String review_title, review_mem_id, review_content;
	private Date review_date;
	
	public ReviewVO() {
		System.out.println("ReviewVO 생성 ~~");
	}

	public ReviewVO(int review_no, int review_b_no, int review_count, int review_status, String review_title,
			String review_mem_id, String review_content, Date review_date) {
		super();
		this.review_no = review_no;
		this.review_b_no = review_b_no;
		this.review_count = review_count;
		this.review_status = review_status;
		this.review_title = review_title;
		this.review_mem_id = review_mem_id;
		this.review_content = review_content;
		this.review_date = review_date;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getReview_b_no() {
		return review_b_no;
	}

	public void setReview_b_no(int review_b_no) {
		this.review_b_no = review_b_no;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public int getReview_status() {
		return review_status;
	}

	public void setReview_status(int review_status) {
		this.review_status = review_status;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_mem_id() {
		return review_mem_id;
	}

	public void setReview_mem_id(String review_mem_id) {
		this.review_mem_id = review_mem_id;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", review_b_no=" + review_b_no + ", review_count=" + review_count
				+ ", review_status=" + review_status + ", review_title=" + review_title + ", review_mem_id="
				+ review_mem_id + ", review_content=" + review_content + ", review_date=" + review_date + "]";
	}
	
	
	
	
}

