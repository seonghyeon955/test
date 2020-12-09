package com.spring.biz.book;
import java.util.Date;


/*
 CREATE TABLE BOOK
(
    book_no                NUMBER            NOT NULL, 
    CATERORY_NO            NUMBER            NULL, 
    book_name              VARCHAR2(50)      NOT NULL, 
    book_writer            VARCHAR2(50)      NOT NULL, 
    book_publisher         VARCHAR2(50)      NOT NULL, 
    book_price             NUMBER            NOT NULL, 
    book_saleprice         NUMBER            NULL, 
    book_info              VARCHAR2(2000)    NULL, 
    book_published_date    DATE              NULL, 
    book_total_page        NUMBER            NULL, 
    book_entered_date      DATE              NULL, 
    ebook                  NUMBER            NULL, 
    book_isbn              NUMBER            NULL, 
    book_img               VARCHAR2(50)      NULL, 
    CONSTRAINT BOOK_PK PRIMARY KEY (book_no)
	
	cnt, store_code
 */


public class BookVO {
	private int book_no, category_no, book_price, book_saleprice, ebook, book_total_page; 
	private String book_name, book_writer, book_publisher, book_info, book_img, book_isbn, book_size, book_published_date;
	
	//수량, 수량별 금액
	private int quant;//장바구니에 담긴 수량
	private int totalprice;//수량별 금액(판매가*수량)
	private int point;//포인트
	
	private int cnt;//책권수
	private String store_code; // 스토어코드
	
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getStore_code() {
		return store_code;
	}

	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}

	public int getPoint() {
		int point = book_price * 5 / 100;
		return (int)point;
	}
	
	//할인율 조회 메소드
	public double getPercent() {
		double percent = (book_price - book_saleprice) * 100 / book_price;	
		return (double) percent;
	}
	
	//////////
	public int getSalega() {//10% 할인
		int salega = book_price * 10/100;
		return (int)salega;
	}
	//////////
	public int pluspoint() {
		int point = book_price * 5/100;
		return (int)point;
	}

	/////
	public int getQuant() {
		return quant;
	}
	
	public void setQuant(int quant) {
		this.quant = quant;
		totalprice = book_saleprice * quant; 
		//수량 변경시 수량별금액(total_price) 계산 후 변경 처리하기
	}
	
	////////
	public int getTotalprice() {
		return totalprice;
	}
	
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
	
	
	//setter,getter
	
	public BookVO() {
		System.out.println(">>BookVO 객체 생성");
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

	public int getEbook() {
		return ebook;
	}
	
	public void setBook_total_page(int book_total_page) {
		this.book_total_page = book_total_page;
	}
	
	public int getBook_total_page() {
		return book_total_page;
	}

	public void setEbook(int ebook) {
		this.ebook = ebook;
	}
	public void setBook_size(String book_size) {
		this.book_size = book_size;
	}
	
	public String getBook_size() {
		return book_size;
	}
	
	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
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

	public String getBook_info() {
		return book_info;
	}

	public void setBook_info(String book_info) {
		this.book_info = book_info;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	public String getBook_published_date() {
		return book_published_date;
	}

	public void setBook_published_date(String book_published_date) {
		this.book_published_date = book_published_date;
	}

	@Override
	public String toString() {
		return "BookVO [book_no=" + book_no + ", category_no=" + category_no + ", book_price=" + book_price
				+ ", book_saleprice=" + book_saleprice + ", ebook=" + ebook + ", book_isbn=" + book_isbn
				+ ", book_name=" + book_name + ", book_writer=" + book_writer + ", book_publisher=" + book_publisher
				+ ", book_info=" + book_info + ", book_img=" + book_img + ", book_published_date=" + book_published_date
				+ "]";
	}
	
	
	
	
	
	
	

}
