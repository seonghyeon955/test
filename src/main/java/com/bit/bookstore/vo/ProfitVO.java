package com.bit.bookstore.vo;

public class ProfitVO {
	
	//하루 총 매출
	private int totalDaySales;
	
	//월 매출
	private String monthSales;
	
	//오늘 날짜 받아 올 변수
	private String date;
	
	//일매출
	private String dailySales;
	private int dayTotalSales;
	
	//카테고리 매출
	private int categorySales;
	
	private String startDate;
	private String endDate;
	
	//카테고리테이블
	private String category_code;
	private String category_main;
	private String category_middle;
	private String category_name;
	
	//주문당 디테일 갯수
	private String ordercnt;

	public ProfitVO() {
		super();
	}

	public int getTotalDaySales() {
		return totalDaySales;
	}

	public void setTotalDaySales(int totalDaySales) {
		this.totalDaySales = totalDaySales;
	}

	public String getMonthSales() {
		return monthSales;
	}

	public void setMonthSales(String monthSales) {
		this.monthSales = monthSales;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDailySales() {
		return dailySales;
	}

	public void setDailySales(String dailySales) {
		this.dailySales = dailySales;
	}

	public int getDayTotalSales() {
		return dayTotalSales;
	}

	public void setDayTotalSales(int dayTotalSales) {
		this.dayTotalSales = dayTotalSales;
	}

	public int getCategorySales() {
		return categorySales;
	}

	public void setCategorySales(int categorySales) {
		this.categorySales = categorySales;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
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

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getOrdercnt() {
		return ordercnt;
	}

	public void setOrdercnt(String ordercnt) {
		this.ordercnt = ordercnt;
	}

	@Override
	public String toString() {
		return "ProfitVO [totalDaySales=" + totalDaySales + ", monthSales=" + monthSales + ", date=" + date
				+ ", dailySales=" + dailySales + ", dayTotalSales=" + dayTotalSales + ", categorySales=" + categorySales
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", category_code=" + category_code
				+ ", category_main=" + category_main + ", category_middle=" + category_middle + ", category_name="
				+ category_name + ", ordercnt=" + ordercnt + "]";
	}
	
	
	
	
}
