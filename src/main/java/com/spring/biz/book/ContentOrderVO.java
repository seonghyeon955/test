package com.spring.biz.book;

public class ContentOrderVO {

	private int content_idx, book_no, content_order;
	private String content;
	
	public ContentOrderVO() {
		System.out.println("ContentOrderVO 생성");
	}
	
	public ContentOrderVO(int content_idx, int book_no, int content_order, String content) {
		super();
		this.content_idx = content_idx;
		this.book_no = book_no;
		this.content_order = content_order;
		this.content = content;
	}

	public int getContent_idx() {
		return content_idx;
	}

	public void setContent_idx(int content_idx) {
		this.content_idx = content_idx;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public int getContent_order() {
		return content_order;
	}

	public void setContent_order(int content_order) {
		this.content_order = content_order;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ContentOrderVO [content_idx=" + content_idx + ", book_no=" + book_no + ", content_order="
				+ content_order + ", content=" + content + "]";
	}
	
	
	
	
}
