package com.bit.bookstore.vo;

public class CartVO {
	private int cart_idx;
	private String user_id;
	private int book_no;
	private int cnt;
	private String store_code;
	
	public CartVO() {
		super();
	}
	
	public CartVO(int cart_idx, String user_id, int book_no, int cnt, String store_code) {
		super();
		this.cart_idx = cart_idx;
		this.user_id = user_id;
		this.book_no = book_no;
		this.cnt = cnt;
		this.store_code = store_code;
	}

	public int getCart_idx() {
		return cart_idx;
	}

	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getStore_code() {
		return store_code;
	}

	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}

	@Override
	public String toString() {
		return "CartVO [cart_idx=" + cart_idx + ", user_id=" + user_id + ", book_no=" + book_no + ", cnt=" + cnt
				+ ", store_code=" + store_code + "]";
	}

	
	
	
	
}
