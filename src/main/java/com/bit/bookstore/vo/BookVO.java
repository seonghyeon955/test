package com.bit.bookstore.vo;

import java.util.Date;

public class BookVO {
	private int book_no;
	private int category_no;
	private String book_name;
	private String book_writer;
	private String book_publisher;
	private int book_price;
	private int book_saleprice;
	private String book_info;
	private Date book_published_date;
	private int book_total_page;
	private Date book_entered_date;
	private int ebook;
	private int book_isbn;
	private String book_img;
	
	public BookVO() {
		super();
	}

	public BookVO(int book_no, int category_no, String book_name, String book_writer, String book_publisher,
			int book_price, int book_saleprice, String book_info, Date book_published_date, int book_total_page,
			Date book_entered_date, int ebook, int book_isbn, String book_img) {
		super();
		this.book_no = book_no;
		this.category_no = category_no;
		this.book_name = book_name;
		this.book_writer = book_writer;
		this.book_publisher = book_publisher;
		this.book_price = book_price;
		this.book_saleprice = book_saleprice;
		this.book_info = book_info;
		this.book_published_date = book_published_date;
		this.book_total_page = book_total_page;
		this.book_entered_date = book_entered_date;
		this.ebook = ebook;
		this.book_isbn = book_isbn;
		this.book_img = book_img;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_writer() {
		return book_writer;
	}

	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}

	public String getBook_publisher() {
		return book_publisher;
	}

	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public int getBook_saleprice() {
		return book_saleprice;
	}

	public void setBook_saleprice(int book_saleprice) {
		this.book_saleprice = book_saleprice;
	}

	public String getBook_info() {
		return book_info;
	}

	public void setBook_info(String book_info) {
		this.book_info = book_info;
	}

	public Date getBook_published_date() {
		return book_published_date;
	}

	public void setBook_published_date(Date book_published_date) {
		this.book_published_date = book_published_date;
	}

	public int getBook_total_page() {
		return book_total_page;
	}

	public void setBook_total_page(int book_total_page) {
		this.book_total_page = book_total_page;
	}

	public Date getBook_entered_date() {
		return book_entered_date;
	}

	public void setBook_entered_date(Date book_entered_date) {
		this.book_entered_date = book_entered_date;
	}

	public int getEbook() {
		return ebook;
	}

	public void setEbook(int ebook) {
		this.ebook = ebook;
	}

	public int getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(int book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	@Override
	public String toString() {
		return "BookVO [book_no=" + book_no + ", category_no=" + category_no + ", book_name=" + book_name
				+ ", book_writer=" + book_writer + ", book_publisher=" + book_publisher + ", book_price=" + book_price
				+ ", book_saleprice=" + book_saleprice + ", book_info=" + book_info + ", book_published_date="
				+ book_published_date + ", book_total_page=" + book_total_page + ", book_entered_date="
				+ book_entered_date + ", ebook=" + ebook + ", book_isbn=" + book_isbn + ", book_img=" + book_img + "]";
	}

	
	
}
