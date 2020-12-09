package com.spring.biz.jego;

public class JegoVO {
	
	public String store_code, store_pwd, street_addr, remaining_addr, email, store_phone_number, store_name;	
	public int zip_code;
	public int stock_idx, book_no, cnt;
	
	public JegoVO() {
		System.out.println("재고VO생성~~~~~~~");
	}
	
	public JegoVO(String store_code, String store_pwd, String street_addr, String remaining_addr, String email,
			String store_phone_number, String store_name, int zip_code, int stock_idx, int book_no, int cnt) {
		super();
		this.store_code = store_code;
		this.store_pwd = store_pwd;
		this.street_addr = street_addr;
		this.remaining_addr = remaining_addr;
		this.email = email;
		this.store_phone_number = store_phone_number;
		this.store_name = store_name;
		this.zip_code = zip_code;
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
	public String getStore_pwd() {
		return store_pwd;
	}
	public void setStore_pwd(String store_pwd) {
		this.store_pwd = store_pwd;
	}
	public String getStreet_addr() {
		return street_addr;
	}
	public void setStreet_addr(String street_addr) {
		this.street_addr = street_addr;
	}
	public String getRemaining_addr() {
		return remaining_addr;
	}
	public void setRemaining_addr(String remaining_addr) {
		this.remaining_addr = remaining_addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStore_phone_number() {
		return store_phone_number;
	}
	public void setStore_phone_number(String store_phone_number) {
		this.store_phone_number = store_phone_number;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public int getZip_code() {
		return zip_code;
	}
	public void setZip_code(int zip_code) {
		this.zip_code = zip_code;
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
		return "JegoVO [store_code=" + store_code + ", store_pwd=" + store_pwd + ", street_addr=" + street_addr
				+ ", remaining_addr=" + remaining_addr + ", email=" + email + ", store_phone_number="
				+ store_phone_number + ", store_name=" + store_name + ", zip_code=" + zip_code + ", stock_idx="
				+ stock_idx + ", book_no=" + book_no + ", cnt=" + cnt + "]";
	}
	
	
	
	
}
