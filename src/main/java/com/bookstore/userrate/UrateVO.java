package com.bookstore.userrate;

public class UrateVO {
	private String rate_idx;
	private String purchase_6month;
	private String point;
	private String rate;
	
	public UrateVO() {}

	public UrateVO(String rate_idx, String purchase_6month, String point, String rate) {
	super();
	this.rate_idx = rate_idx;
	this.purchase_6month = purchase_6month;
	this.point = point;
	this.rate = rate;
}

	public void setRate_idx(String rate_idx) {
		this.rate_idx = rate_idx;
	}
	public String getPurchase_6month() {
		return purchase_6month;
	}
	public void setPurchase_6month(String purchase_6month) {
		this.purchase_6month = purchase_6month;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}


	@Override
	public String toString() {
		return "UrateVO [rate_idx=" + rate_idx + ", purchase_6month=" + purchase_6month + ", point=" + point + ", rate="
				+ rate + "]";

	}
}

