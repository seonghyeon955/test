package com.bit.bookstore.vo;

public class StoreVO {
	private String store_code;
	private String store_pwd;
	private String zip_code;
	private String street_addr;
	private String remaining_addr;
	private String email;
	private String email_f;
	private String email_b;
	private String store_phone_number;
	private String phone1;
	private String phone2;
	private String phone3;
	private String store_name;
	private String store_approval;
	
	public StoreVO() {
		super();
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

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
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

	public String getEmail_f() {
		return email_f;
	}

	public void setEmail_f(String email_f) {
		this.email_f = email_f;
	}

	public String getEmail_b() {
		return email_b;
	}

	public void setEmail_b(String email_b) {
		this.email_b = email_b;
	}

	public String getStore_phone_number() {
		return store_phone_number;
	}

	public void setStore_phone_number(String store_phone_number) {
		this.store_phone_number = store_phone_number;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_approval() {
		return store_approval;
	}

	public void setStore_approval(String store_approval) {
		this.store_approval = store_approval;
	}

	@Override
	public String toString() {
		return "StoreVO [store_code=" + store_code + ", store_pwd=" + store_pwd + ", zip_code=" + zip_code
				+ ", street_addr=" + street_addr + ", remaining_addr=" + remaining_addr + ", email=" + email
				+ ", email_f=" + email_f + ", email_b=" + email_b + ", store_phone_number=" + store_phone_number
				+ ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", store_name=" + store_name
				+ ", store_approval=" + store_approval + "]";
	}

	
}
