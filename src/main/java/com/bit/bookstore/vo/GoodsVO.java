package com.bit.bookstore.vo;

import java.util.Date;

public class GoodsVO {
	private int goods_code;
	private String goods_name;
	private int goods_price;
	private int goods_saleprice;
	private Date goods_start_date;
	private Date goods_end_date;
	private String goods_image;
	
	
	
	public GoodsVO() {
		super();
	}



	public GoodsVO(int goods_code, String goods_name, int goods_price, int goods_saleprice, Date goods_start_date,
			Date goods_end_date, String goods_image) {
		super();
		this.goods_code = goods_code;
		this.goods_name = goods_name;
		this.goods_price = goods_price;
		this.goods_saleprice = goods_saleprice;
		this.goods_start_date = goods_start_date;
		this.goods_end_date = goods_end_date;
		this.goods_image = goods_image;
	}



	public int getGoods_code() {
		return goods_code;
	}



	public void setGoods_code(int goods_code) {
		this.goods_code = goods_code;
	}



	public String getGoods_name() {
		return goods_name;
	}



	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}



	public int getGoods_price() {
		return goods_price;
	}



	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}



	public int getGoods_saleprice() {
		return goods_saleprice;
	}



	public void setGoods_saleprice(int goods_saleprice) {
		this.goods_saleprice = goods_saleprice;
	}



	public Date getGoods_start_date() {
		return goods_start_date;
	}



	public void setGoods_start_date(Date goods_start_date) {
		this.goods_start_date = goods_start_date;
	}



	public Date getGoods_end_date() {
		return goods_end_date;
	}



	public void setGoods_end_date(Date goods_end_date) {
		this.goods_end_date = goods_end_date;
	}



	public String getGoods_image() {
		return goods_image;
	}



	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}



	@Override
	public String toString() {
		return "GoodsVO [goods_code=" + goods_code + ", goods_name=" + goods_name + ", goods_price=" + goods_price
				+ ", goods_saleprice=" + goods_saleprice + ", goods_start_date=" + goods_start_date
				+ ", goods_end_date=" + goods_end_date + ", goods_image=" + goods_image + "]";
	}
	
	
	
}
