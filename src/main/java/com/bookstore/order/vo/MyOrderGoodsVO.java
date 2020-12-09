package com.bookstore.order.vo;


public class MyOrderGoodsVO {
   private int order_g_no;
   private int goods_code;
   private int order_no;
   private String goods_name;
   private int order_g_cnt;
   private int goods_saleprice;
   private String goods_image;
   
   


   public int getOrder_g_no() {
      return order_g_no;
   }




   public void setOrder_g_no(int order_g_no) {
      this.order_g_no = order_g_no;
   }




   public int getGoods_code() {
      return goods_code;
   }




   public void setGoods_code(int goods_code) {
      this.goods_code = goods_code;
   }




   public int getOrder_no() {
      return order_no;
   }




   public void setOrder_no(int order_no) {
      this.order_no = order_no;
   }




   public String getGoods_name() {
      return goods_name;
   }




   public void setGoods_name(String goods_name) {
      this.goods_name = goods_name;
   }




   public int getOrder_g_cnt() {
      return order_g_cnt;
   }




   public void setOrder_g_cnt(int order_g_cnt) {
      this.order_g_cnt = order_g_cnt;
   }




   public int getGoods_saleprice() {
      return goods_saleprice;
   }




   public void setGoods_saleprice(int goods_saleprice) {
      this.goods_saleprice = goods_saleprice;
   }




   public String getGoods_image() {
      return goods_image;
   }




   public void setGoods_image(String goods_image) {
      this.goods_image = goods_image;
   }




   @Override
   public String toString() {
      return "MyOrderGoodsVO [order_g_no=" + order_g_no + ", goods_code=" + goods_code + ", order_no=" + order_no
            + ", goods_name=" + goods_name + ", order_g_cnt=" + order_g_cnt + ", goods_saleprice=" + goods_saleprice
            + ", goods_image=" + goods_image + "]";
   }

   
}