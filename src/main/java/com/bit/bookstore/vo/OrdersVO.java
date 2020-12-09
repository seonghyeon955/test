package com.bit.bookstore.vo;

import java.util.Date;

public class OrdersVO {
	private int order_no;
	private String order_user_id;
	private String order_recv_name;
	private String order_recv_phone;
	private Date order_date;
	private int order_total_cost;
	private String order_message;
	private String order_recv_street_addr;
	private String order_recv_remaining_addr;
	private int order_recv_zip_code;
	private String state;
	private int order_accu_point;
	private String order_nonmem_email;
	
	
	public OrdersVO() {
		super();
	}


	public OrdersVO(int order_no, String order_user_id, String order_recv_name, String order_recv_phone, Date order_date,
			int order_total_cost, String order_message, String order_recv_street_addr, String order_recv_remaining_addr,
			int order_recv_zip_code, String state, int order_accu_point, String order_nonmem_email) {
		super();
		this.order_no = order_no;
		this.order_user_id = order_user_id;
		this.order_recv_name = order_recv_name;
		this.order_recv_phone = order_recv_phone;
		this.order_date = order_date;
		this.order_total_cost = order_total_cost;
		this.order_message = order_message;
		this.order_recv_street_addr = order_recv_street_addr;
		this.order_recv_remaining_addr = order_recv_remaining_addr;
		this.order_recv_zip_code = order_recv_zip_code;
		this.state = state;
		this.order_accu_point = order_accu_point;
		this.order_nonmem_email = order_nonmem_email;
	}


	public int getOrder_no() {
		return order_no;
	}


	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}


	public String getOrder_user_id() {
		return order_user_id;
	}


	public void setOrder_user_id(String order_user_id) {
		this.order_user_id = order_user_id;
	}


	public String getOrder_recv_name() {
		return order_recv_name;
	}


	public void setOrder_recv_name(String order_recv_name) {
		this.order_recv_name = order_recv_name;
	}


	public String getOrder_recv_phone() {
		return order_recv_phone;
	}


	public void setOrder_recv_phone(String order_recv_phone) {
		this.order_recv_phone = order_recv_phone;
	}


	public Date getOrder_date() {
		return order_date;
	}


	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}


	public int getOrder_total_cost() {
		return order_total_cost;
	}


	public void setOrder_total_cost(int order_total_cost) {
		this.order_total_cost = order_total_cost;
	}


	public String getOrder_message() {
		return order_message;
	}


	public void setOrder_message(String order_message) {
		this.order_message = order_message;
	}


	public String getOrder_recv_street_addr() {
		return order_recv_street_addr;
	}


	public void setOrder_recv_street_addr(String order_recv_street_addr) {
		this.order_recv_street_addr = order_recv_street_addr;
	}


	public String getOrder_recv_remaining_addr() {
		return order_recv_remaining_addr;
	}


	public void setOrder_recv_remaining_addr(String order_recv_remaining_addr) {
		this.order_recv_remaining_addr = order_recv_remaining_addr;
	}


	public int getOrder_recv_zip_code() {
		return order_recv_zip_code;
	}


	public void setOrder_recv_zip_code(int order_recv_zip_code) {
		this.order_recv_zip_code = order_recv_zip_code;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public int getOrder_accu_point() {
		return order_accu_point;
	}


	public void setOrder_accu_point(int order_accu_point) {
		this.order_accu_point = order_accu_point;
	}


	public String getOrder_nonmem_email() {
		return order_nonmem_email;
	}


	public void setOrder_nonmem_email(String order_nonmem_email) {
		this.order_nonmem_email = order_nonmem_email;
	}


	@Override
	public String toString() {
		return "OdersVO [order_no=" + order_no + ", order_user_id=" + order_user_id + ", order_recv_name="
				+ order_recv_name + ", order_recv_phone=" + order_recv_phone + ", order_date=" + order_date
				+ ", order_total_cost=" + order_total_cost + ", order_message=" + order_message
				+ ", order_recv_street_addr=" + order_recv_street_addr + ", order_recv_remaining_addr="
				+ order_recv_remaining_addr + ", order_recv_zip_code=" + order_recv_zip_code + ", state=" + state
				+ ", order_accu_point=" + order_accu_point + ", order_nonmem_email=" + order_nonmem_email + "]";
	}
	
	
	
	
}
