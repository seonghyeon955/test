package com.bookstore.order.vo;

public class MyReturnVO {

	private int order_no;
	private String book_name;
	private String order_recv_name;
	private String order_date;
	private int category_code;
	private int return_exchange_delivery_type;
	private int return_exchange_status;;
	private String return_exchange_date;
	private int cnt;
	
	public MyReturnVO() {
		super();
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getOrder_recv_name() {
		return order_recv_name;
	}

	public void setOrder_recv_name(String order_recv_name) {
		this.order_recv_name = order_recv_name;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public int getCategory_code() {
		return category_code;
	}

	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}

	public int getReturn_exchange_delivery_type() {
		return return_exchange_delivery_type;
	}

	public void setReturn_exchange_delivery_type(int return_exchange_delivery_type) {
		this.return_exchange_delivery_type = return_exchange_delivery_type;
	}

	public int getReturn_exchange_status() {
		return return_exchange_status;
	}

	public void setReturn_exchange_status(int return_exchange_status) {
		this.return_exchange_status = return_exchange_status;
	}

	public String getReturn_exchange_date() {
		return return_exchange_date;
	}

	public void setReturn_exchange_date(String return_exchange_date) {
		this.return_exchange_date = return_exchange_date;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "MyReturnVO [order_no=" + order_no + ", book_name=" + book_name + ", order_recv_name=" + order_recv_name
				+ ", order_date=" + order_date + ", category_code=" + category_code + ", return_exchange_delivery_type="
				+ return_exchange_delivery_type + ", return_exchange_status=" + return_exchange_status
				+ ", return_exchange_date=" + return_exchange_date + ", cnt=" + cnt + "]";
	}
	
}