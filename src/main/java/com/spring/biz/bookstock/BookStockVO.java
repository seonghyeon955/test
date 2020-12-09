package com.spring.biz.bookstock;

public class BookStockVO {
	public String store_code;
	public int stock_idx, book_no, cnt;
	
	public BookStockVO() {
		System.out.println(">>>BookStockVo 객체 생성");
		
	}
	public BookStockVO(String store_code, int stock_idx, int book_no, int cnt) {
		super();
		this.store_code = store_code;
		this.stock_idx = stock_idx;
		this.book_no = book_no;
		this.cnt = cnt;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public int getStock_idx() {
		return stock_idx;
	}
	public void setStock_idx(int stock_idx) {
		this.stock_idx = stock_idx;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "BookStockVO [store_code=" + store_code + ", stock_idx=" + stock_idx + ", book_no=" + book_no
				+ ", cnt=" + cnt + "]";
	}
	
	
	
	
	
}
