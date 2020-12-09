package com.bit.bookstore.vo;

import java.util.Arrays;

public class OrderBookNGoodsNPointVO {
//	int[] orderbook_no;
	private int[] goods_code;
	private int extrapoint;
	private int extra;
	private int usedpoint;
	
	public OrderBookNGoodsNPointVO() {
		super();
	}

	public OrderBookNGoodsNPointVO(int[] goods_code, int extrapoint, int extra, int usedpoint) {
		super();
		this.goods_code = goods_code;
		this.extrapoint = extrapoint;
		this.extra = extra;
		this.usedpoint = usedpoint;
	}

	public int[] getGoods_code() {
		return goods_code;
	}

	public void setGoods_code(int[] goods_code) {
		this.goods_code = goods_code;
	}

	public int getExtrapoint() {
		return extrapoint;
	}

	public void setExtrapoint(int extrapoint) {
		this.extrapoint = extrapoint;
	}

	public int getExtra() {
		return extra;
	}

	public void setExtra(int extra) {
		this.extra = extra;
	}
	
	

	public int getUsedpoint() {
		return usedpoint;
	}

	public void setUsedpoint(int usedpoint) {
		this.usedpoint = usedpoint;
	}

	@Override
	public String toString() {
		return "OrderBookNGoodsNPointVO [goods_code=" + Arrays.toString(goods_code) + ", extrapoint=" + extrapoint
				+ ", extra=" + extra + ", usedpoint=" + usedpoint + "]";
	}

	
	
	
}
