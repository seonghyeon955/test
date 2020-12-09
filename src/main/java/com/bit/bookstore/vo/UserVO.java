package com.bit.bookstore.vo;

import java.util.Date;

public class UserVO {
   private String id;
   private String pwd;
   private String user_name;
   private String nickname;
   private String phone_number1;
   private String phone1;
   private String phone2;
   private String phone3;
   private int sms_receive;
   private String phone_number2;
   private String phone4;
   private String phone5;
   private String phone6;
   private String birthday_year;
   private String birthday_month;
   private String birthday_day;
   private String birthday;
   private String zip_code;
   private String street_addr;
   private String remaining_addr;
   private String email;
   private String email_f;
   private String email_b;
   private int email_receive;
   private int point;
   private int rate_idx;
   private int purchase_cnt;
   private int purchase_6month;
   private Date signup_date;
   private int absence;
   private int coupon_cnt;
   private int cart_idx_cnt;
   
   public UserVO() {
      super();
   }

   
   public UserVO(String id, String pwd, String user_name, String nickname, String phone_number1, String phone1,
         String phone2, String phone3, int sms_receive, String phone_number2, String phone4, String phone5,
         String phone6, String birthday_year, String birthday_month, String birthday_day, String birthday,
         String zip_code, String street_addr, String remaining_addr, String email, String email_f, String email_b,
         int email_receive, int point, int rate_idx, int purchase_cnt, int purchase_6month, Date signup_date,
         int absence, int coupon_cnt, int cart_idx_cnt) {
      super();
      this.id = id;
      this.pwd = pwd;
      this.user_name = user_name;
      this.nickname = nickname;
      this.phone_number1 = phone_number1;
      this.phone1 = phone1;
      this.phone2 = phone2;
      this.phone3 = phone3;
      this.sms_receive = sms_receive;
      this.phone_number2 = phone_number2;
      this.phone4 = phone4;
      this.phone5 = phone5;
      this.phone6 = phone6;
      this.birthday_year = birthday_year;
      this.birthday_month = birthday_month;
      this.birthday_day = birthday_day;
      this.birthday = birthday;
      this.zip_code = zip_code;
      this.street_addr = street_addr;
      this.remaining_addr = remaining_addr;
      this.email = email;
      this.email_f = email_f;
      this.email_b = email_b;
      this.email_receive = email_receive;
      this.point = point;
      this.rate_idx = rate_idx;
      this.purchase_cnt = purchase_cnt;
      this.purchase_6month = purchase_6month;
      this.signup_date = signup_date;
      this.absence = absence;
      this.coupon_cnt = coupon_cnt;
      this.cart_idx_cnt = cart_idx_cnt;
   }


   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPwd() {
      return pwd;
   }

   public void setPwd(String pwd) {
      this.pwd = pwd;
   }

   public String getUser_name() {
      return user_name;
   }

   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }

   public String getNickname() {
      return nickname;
   }

   public void setNickname(String nickname) {
      this.nickname = nickname;
   }

   public String getPhone_number1() {
      return phone_number1;
   }

   public void setPhone_number1(String phone_number1) {
      this.phone_number1 = phone_number1;
   }

   public int getSms_receive() {
      return sms_receive;
   }

   public void setSms_receive(int sms_receive) {
      this.sms_receive = sms_receive;
   }

   public String getPhone_number2() {
      return phone_number2;
   }

   public void setPhone_number2(String phone_number2) {
      this.phone_number2 = phone_number2;
   }

   public String getBirthday_year() {
      return birthday_year;
   }

   public void setBirthday_year(String birthday_year) {
      this.birthday_year = birthday_year;
   }

   public String getBirthday_month() {
      return birthday_month;
   }

   public void setBirthday_month(String birthday_month) {
      this.birthday_month = birthday_month;
   }

   public String getBirthday_day() {
      return birthday_day;
   }

   public void setBirthday_day(String birthday_day) {
      this.birthday_day = birthday_day;
   }

   public String getZip_code() {
      return zip_code;
   }

   public void setZip_code(String zip_code) {
      this.zip_code = zip_code;
   }

   public String getStreet_addr() {
      return street_addr;
   }

   public void setStreet_addr(String street_addr) {
      this.street_addr = street_addr;
   }

   public String getRemaining_addr() {
      return remaining_addr;
   }

   public void setRemaining_addr(String remaining_addr) {
      this.remaining_addr = remaining_addr;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public int getEmail_receive() {
      return email_receive;
   }

   public void setEmail_receive(int email_receive) {
      this.email_receive = email_receive;
   }

   public int getPoint() {
      return point;
   }

   public void setPoint(int point) {
      this.point = point;
   }

   public int getRate_idx() {
      return rate_idx;
   }

   public void setRate_idx(int rate_idx) {
      this.rate_idx = rate_idx;
   }

   public int getPurchase_cnt() {
      return purchase_cnt;
   }

   public void setPurchase_cnt(int purchase_cnt) {
      this.purchase_cnt = purchase_cnt;
   }

   public int getPurchase_6month() {
      return purchase_6month;
   }

   public void setPurchase_6month(int purchase_6month) {
      this.purchase_6month = purchase_6month;
   }

   public Date getSignup_date() {
      return signup_date;
   }

   public void setSignup_date(Date signup_date) {
      this.signup_date = signup_date;
   }

   public int getAbsence() {
      return absence;
   }

   public void setAbsence(int absence) {
      this.absence = absence;
   }

   public int getCoupon_cnt() {
      return coupon_cnt;
   }

   public void setCoupon_cnt(int coupon_cnt) {
      this.coupon_cnt = coupon_cnt;
   }

   public String getPhone1() {
      return phone1;
   }

   public void setPhone1(String phone1) {
      this.phone1 = phone1;
   }

   public String getPhone2() {
      return phone2;
   }

   public void setPhone2(String phone2) {
      this.phone2 = phone2;
   }

   public String getPhone3() {
      return phone3;
   }

   public void setPhone3(String phone3) {
      this.phone3 = phone3;
   }

   public String getPhone4() {
      return phone4;
   }

   public void setPhone4(String phone4) {
      this.phone4 = phone4;
   }

   public String getPhone5() {
      return phone5;
   }

   public void setPhone5(String phone5) {
      this.phone5 = phone5;
   }

   public String getPhone6() {
      return phone6;
   }

   public void setPhone6(String phone6) {
      this.phone6 = phone6;
   }

   public String getBirthday() {
      return birthday;
   }

   public void setBirthday(String birthday) {
      this.birthday = birthday;
   }

   public String getEmail_f() {
      return email_f;
   }

   public void setEmail_f(String email_f) {
      this.email_f = email_f;
   }

   public String getEmail_b() {
      return email_b;
   }

   public void setEmail_b(String email_b) {
      this.email_b = email_b;
   }
   

   public int getCart_idx_cnt() {
      return cart_idx_cnt;
   }

   public void setCart_idx_cnt(int cart_idx_cnt) {
      this.cart_idx_cnt = cart_idx_cnt;
   }


   @Override
   public String toString() {
      return "UserVO [id=" + id + ", pwd=" + pwd + ", user_name=" + user_name + ", nickname=" + nickname
            + ", phone_number1=" + phone_number1 + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3="
            + phone3 + ", sms_receive=" + sms_receive + ", phone_number2=" + phone_number2 + ", phone4=" + phone4
            + ", phone5=" + phone5 + ", phone6=" + phone6 + ", birthday_year=" + birthday_year + ", birthday_month="
            + birthday_month + ", birthday_day=" + birthday_day + ", birthday=" + birthday + ", zip_code="
            + zip_code + ", street_addr=" + street_addr + ", remaining_addr=" + remaining_addr + ", email=" + email
            + ", email_f=" + email_f + ", email_b=" + email_b + ", email_receive=" + email_receive + ", point="
            + point + ", rate_idx=" + rate_idx + ", purchase_cnt=" + purchase_cnt + ", purchase_6month="
            + purchase_6month + ", signup_date=" + signup_date + ", absence=" + absence + ", coupon_cnt="
            + coupon_cnt + ", cart_idx_cnt=" + cart_idx_cnt + "]";
   }


   
   
   
}