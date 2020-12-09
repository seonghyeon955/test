package com.bookstore.order.vo;


public class MyOrderBookVO {
   private int order_b_no; //주문 하위번호 order_book
   private int order_no; //주문번호 //order_book
   private String order_office_no; //지점번호 orderbook
   private int book_no; //책 상품번호 book
   private String book_name; //책이름 book
   private int book_saleprice; //책가격 book
   private int order_b_cnt; //order_book 판매수량
   private int order_delivery_type; //order_book 배송방법
   private String state; //order_book 배송상태
   private String book_img; //order_book 배송상태

   public MyOrderBookVO() {
      super();
   }

   public int getOrder_b_no() {
      return order_b_no;
   }

   public void setOrder_b_no(int order_b_no) {
      this.order_b_no = order_b_no;
   }

   public int getOrder_no() {
      return order_no;
   }

   public void setOrder_no(int order_no) {
      this.order_no = order_no;
   }

   public String getOrder_office_no() {
      return order_office_no;
   }

   public void setOrder_office_no(String order_office_no) {
      this.order_office_no = order_office_no;
   }

   public int getBook_no() {
      return book_no;
   }

   public void setBook_no(int book_no) {
      this.book_no = book_no;
   }

   public String getBook_name() {
      return book_name;
   }

   public void setBook_name(String book_name) {
      this.book_name = book_name;
   }

   public int getBook_saleprice() {
      return book_saleprice;
   }

   public void setBook_saleprice(int book_saleprice) {
      this.book_saleprice = book_saleprice;
   }

   public int getOrder_b_cnt() {
      return order_b_cnt;
   }

   public void setOrder_b_cnt(int order_b_cnt) {
      this.order_b_cnt = order_b_cnt;
   }

   public int getOrder_delivery_type() {
      return order_delivery_type;
   }

   public void setOrder_delivery_type(int order_delivery_type) {
      this.order_delivery_type = order_delivery_type;
   }

   public String getState() {
      return state;
   }

   public void setState(String state) {
      this.state = state;
   }

   public String getBook_img() {
      return book_img;
   }

   public void setBook_img(String book_img) {
      this.book_img = book_img;
   }

   @Override
   public String toString() {
      return "MyOrderBookVO [order_b_no=" + order_b_no + ", order_no=" + order_no + ", order_office_no="
            + order_office_no + ", book_no=" + book_no + ", book_name=" + book_name + ", book_saleprice="
            + book_saleprice + ", order_b_cnt=" + order_b_cnt + ", order_delivery_type=" + order_delivery_type
            + ", state=" + state + ", book_img=" + book_img + "]";
   }


   }