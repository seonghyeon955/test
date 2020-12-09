package com.spring.biz.email;

import java.util.Calendar;

public class DM {
   
	//회원가입시 인증번호발송
	public static String dmCertification(int authCode) {
		//날짜
		Calendar now = Calendar.getInstance();
		 
		//HTML BLOCK 
		String sb="";
		 
		sb="<!DOCTYPE html>\r\n" + 
		   "<html lang=\"ko\" style=\"font-size:16px;\">\r\n" + 
		   "<head>\r\n" + 
		   "   <meta charset=\"UTF-8\">\r\n" + 
		   "   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1\">\r\n" + 
		   "   <title>DMcertification</title>\r\n" + 
		   "   <style>\r\n" + 
		   "      .dmtit span{float:left;display:inline-block;font-size:1.35rem;font-weight:700;color:#474747;letter-spacing:-0.05em;margin-left:1vw;}\r\n" + 
		   "      .dmtit:after{content:display:block;clear:both;}\r\n" + 
		   "      @media screen and (max-width:768px){.dmtit span{font-size:0.8rem}}\r\n" + 
		   "   </style>\r\n" + 
		   "</head>\r\n" + 
		   "<body style=\"font-size: 1rem;\">      \r\n" + 
		   "   <div id=\"dmwrap\" style=\"width:100%;height:100%;margin:0 auto;\">      \r\n" + 
		   "      <div class=\"marginwrap\" style=\"width:90%; margin: 0 auto;padding-top:5vh;\" >\r\n" + 
		   "         <div class=\"dmtit\" style=\"margin:0 auto;padding-bottom:2vh;border-bottom:2px solid #9F5252;\">\r\n" + 
		   "            <img style=\"display:block;width:300px;\" src=\"https://postfiles.pstatic.net/MjAyMDA5MjhfOTUg/MDAxNjAxMjYzNTI2NTQz.HDty7kqSed4rFt5JF6tSjBoZ6kkmJrZcup4PX3or3gYg.rXPeHSkaSMWQfcuUmNi-SdP48_3yfjkRB26oewDC6MMg.PNG.patty_96/logo.png?type=w966\" alt=\"#\" >\r\n" + 
		   "         </div>\r\n" + 
		   "      <div class=\"dm_contents\" style=\"margin-top:5vh;margin-bottom:12vh;\">\r\n" + 
		   "         <p style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">\r\n" + 
		   "         안녕하세요! <strong style=\"font-weight:700;color:#9F5252;margin-right:0.5vw;\">지니문고</strong>입니다.<br>\r\n" + 
		   "         인증번호를 다음과 같이 알려드립니다.\r\n" + 
		   "         </p>\r\n" + 
		   "         <p class=\"con\" style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;margin:3vh 0;\">\r\n" + 
		   "         인증번호 : <strong>" + authCode + "</strong><br>\r\n" + 
		   "         발급시간 : "+ now.get(Calendar.YEAR) + "년 " + (now.get(Calendar.MONTH) + 1) + "월 " + now.get(Calendar.DAY_OF_MONTH) + "일 " + now.get(Calendar.HOUR_OF_DAY) + ":" + (now.get(Calendar.MINUTE) >= 10 ? now.get(Calendar.MINUTE) : "0" + now.get(Calendar.MINUTE)) + "\r\n" + 
		   "         </p>\r\n" + 
		   "         <p style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">감사합니다.</p>\r\n" + 
		   "      </div>\r\n" + 
		   "      </div>\r\n" + 
		   "   </div>\r\n" + 
		   "   <div class=\"dmfoot\">\r\n" + 
		   "      <div class=\"dm_foot\" style=\"text-align:center;background-color:#f9f9f9;padding:2vh;\">\r\n" + 
		   "         <p style=\"font-size:0.8rem;font-weight:300;letter-spacing:-0.05em;word-break:keep-all;line-height:1.2rem;color:#474747;\" > (주)지니문고 서울시 종로구 종로1 | 대표이사:원윤희 | 대표전화 : 1544-8282(발신자 부담전화) | 팩스:3822-087-5711(지역번호 공통)  </p>\r\n" + 
		   "         <p style=\"font-size:0.8rem;font-weight:300;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">by 지니문고\r\n" + 
		   "      </div>\r\n" + 
		   "   </div>\r\n" + 
		   "</body>\r\n" + 
		   "</html>";
		     
		return sb;
	}
	
	//임시비밀번호 발송
	public static String dmCertification(String pwd) {
		//날짜
		Calendar now = Calendar.getInstance();
		 
		//HTML BLOCK 
		String sb="";
		 
		sb="<!DOCTYPE html>\r\n" + 
		   "<html lang=\"ko\" style=\"font-size:16px;\">\r\n" + 
		   "<head>\r\n" + 
		   "   <meta charset=\"UTF-8\">\r\n" + 
		   "   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1\">\r\n" + 
		   "   <title>DMcertification</title>\r\n" + 
		   "   <style>\r\n" + 
		   "      .dmtit span{float:left;display:inline-block;font-size:1.35rem;font-weight:700;color:#474747;letter-spacing:-0.05em;margin-left:1vw;}\r\n" + 
		   "      .dmtit:after{content:display:block;clear:both;}\r\n" + 
		   "      @media screen and (max-width:768px){.dmtit span{font-size:0.8rem}}\r\n" + 
		   "   </style>\r\n" + 
		   "</head>\r\n" + 
		   "<body style=\"font-size: 1rem;\">      \r\n" + 
		   "   <div id=\"dmwrap\" style=\"width:100%;height:100%;margin:0 auto;\">      \r\n" + 
		   "      <div class=\"marginwrap\" style=\"width:90%; margin: 0 auto;padding-top:5vh;\" >\r\n" + 
		   "         <div class=\"dmtit\" style=\"margin:0 auto;padding-bottom:2vh;border-bottom:2px solid #9F5252;\">\r\n" + 
		   "            <img style=\"display:block;width:300px;\" src=\"https://postfiles.pstatic.net/MjAyMDA5MjhfOTUg/MDAxNjAxMjYzNTI2NTQz.HDty7kqSed4rFt5JF6tSjBoZ6kkmJrZcup4PX3or3gYg.rXPeHSkaSMWQfcuUmNi-SdP48_3yfjkRB26oewDC6MMg.PNG.patty_96/logo.png?type=w966\" alt=\"#\" >\r\n" + 
		   "         </div>\r\n" + 
		   "      <div class=\"dm_contents\" style=\"margin-top:5vh;margin-bottom:12vh;\">\r\n" + 
		   "         <p style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">\r\n" + 
		   "         안녕하세요! <strong style=\"font-weight:700;color:#9F5252;margin-right:0.5vw;\">지니문고</strong>입니다.<br>\r\n" + 
		   "         임시비밀번호를 다음과 같이 알려드립니다.\r\n" + 
		   "         </p>\r\n" + 
		   "         <p class=\"con\" style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;margin:3vh 0;\">\r\n" + 
		   "         임시비밀번호 : <strong>" + pwd + "</strong><br>\r\n" + 
		   "         발급시간 : "+ now.get(Calendar.YEAR) + "년 " + (now.get(Calendar.MONTH) + 1) + "월 " + now.get(Calendar.DAY_OF_MONTH) + "일 " + now.get(Calendar.HOUR_OF_DAY) + ":" + (now.get(Calendar.MINUTE) >= 10 ? now.get(Calendar.MINUTE) : "0" + now.get(Calendar.MINUTE)) + "\r\n" + 
		   "         </p>\r\n" + 
		   "         <p style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">감사합니다.</p>\r\n" + 
		   "      </div>\r\n" + 
		   "      </div>\r\n" + 
		   "   </div>\r\n" + 
		   "   <div class=\"dmfoot\">\r\n" + 
		   "      <div class=\"dm_foot\" style=\"text-align:center;background-color:#f9f9f9;padding:2vh;\">\r\n" + 
		   "         <p style=\"font-size:0.8rem;font-weight:300;letter-spacing:-0.05em;word-break:keep-all;line-height:1.2rem;color:#474747;\" > (주)지니문고 서울시 종로구 종로1 | 대표이사:원윤희 | 대표전화 : 1544-8282(발신자 부담전화) | 팩스:3822-087-5711(지역번호 공통)  </p>\r\n" + 
		   "         <p style=\"font-size:0.8rem;font-weight:300;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">by 지니문고\r\n" + 
		   "      </div>\r\n" + 
		   "   </div>\r\n" + 
		   "</body>\r\n" + 
		   "</html>";
		     
		return sb;
	}

}