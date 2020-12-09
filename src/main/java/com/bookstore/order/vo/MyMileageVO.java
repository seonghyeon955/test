package com.bookstore.order.vo;


public class MyMileageVO {
	private int idx;
	private String id;
	private String order_date;
    private String point_content;
    private int order_accu_point;
    private int point;
    private int point_usded;
    

	public MyMileageVO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public int getIdx() {
		return idx;
	}



	public void setIdx(int idx) {
		this.idx = idx;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getOrder_date() {
		return order_date;
	}



	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}



	public String getPoint_content() {
		return point_content;
	}



	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}



	public int getOrder_accu_point() {
		return order_accu_point;
	}



	public void setOrder_accu_point(int order_accu_point) {
		this.order_accu_point = order_accu_point;
	}



	public int getPoint() {
		return point;
	}



	public void setPoint(int point) {
		this.point = point;
	}



	public int getPoint_usded() {
		return point_usded;
	}



	public void setPoint_usded(int point_usded) {
		this.point_usded = point_usded;
	}



	@Override
	public String toString() {
		return "MyMileageVO [idx=" + idx + ", id=" + id + ", order_date=" + order_date + ", point_content="
				+ point_content + ", order_accu_point=" + order_accu_point + ", point=" + point + ", point_usded="
				+ point_usded + "]";
	}


	}

