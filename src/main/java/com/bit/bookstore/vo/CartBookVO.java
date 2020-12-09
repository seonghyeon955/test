package com.bit.bookstore.vo;

public class CartBookVO {
	private int cart_idx;
	private String user_id;
	private int book_no;
	private int cnt;
	private String store_code;
	private String category_code;//대분류
	private String category_main;//중분류
	private String category_middle;//소분류
	private String category_name;//소분류
	private String book_name;
	private String book_img;
	private int book_saleprice;
	
	public CartBookVO() {
		super();
	}
	
	

	public CartBookVO(int cart_idx, String user_id, int book_no, int cnt, String store_code, String category_code,
			String category_main, String category_middle, String book_name, String book_img, int book_saleprice) {
		super();
		this.cart_idx = cart_idx;
		this.user_id = user_id;
		this.book_no = book_no;
		this.cnt = cnt;
		this.store_code = store_code;
		this.category_code = category_code;
		this.category_main = category_main;
		this.category_middle = category_middle;
		this.book_name = book_name;
		this.book_img = book_img;
		this.book_saleprice = book_saleprice;
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



	public String getCategory_code() {
		return category_code;
	}



	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}



	public String getCategory_main() {
		return category_main;
	}



	public void setCategory_main(String category_main) {
		this.category_main = category_main;
	}



	public String getCategory_middle() {
		return category_middle;
	}



	public void setCategory_middle(String category_middle) {
		this.category_middle = category_middle;
	}



	public String getBook_name() {
		return book_name;
	}



	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}



	public String getBook_img() {
		return book_img;
	}



	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}



	public int getBook_saleprice() {
		return book_saleprice;
	}



	public void setBook_saleprice(int book_saleprice) {
		this.book_saleprice = book_saleprice;
	}



	@Override
	public String toString() {
		return "CartBookVO [cart_idx=" + cart_idx + ", user_id=" + user_id + ", book_no=" + book_no + ", cnt=" + cnt
				+ ", store_code=" + store_code + ", category_code=" + category_code + ", category_main=" + category_main
				+ ", category_middle=" + category_middle + ", category_name=" + category_name + ", book_name="
				+ book_name + ", book_img=" + book_img + ", book_saleprice=" + book_saleprice + "]";
	}



	

	
	
	
}
