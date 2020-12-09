package com.bit.bookstore.view.order;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.biz.email.DM;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@RestController
@RequestMapping("/soomin/order")
public class ConfrimController {
	
	@RequestMapping("/sendSms.do")
	public String sendSms(String phoneNumber) {
		System.out.println("문자메세지 전송 controller");
	
		//6자리 인증코드 생성
		int rand = (int) (Math.random() * 899999) + 100000;
		
		//키 적용
		String api_key = "NCSPRGKVGG5Y5YVB";
		String api_secret = "STAQXHAUKG8JX1KCMR7G5XPTZEYY8TOI";
		
		//메세지 보내기 객체 생성
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("to", phoneNumber);//수신번호
		map.put("from", "01074533546");//발신번호
		map.put("text", "지니문고입니다. 인증번호는 [" + rand + "] 입니다.");//문자메세지
		map.put("type", "sms");//문자 타입
		
		try {
			JSONObject result = coolsms.send(map);
			System.out.println("문자메세지전송 결과 : " + result.toString());
		}catch(CoolsmsException e) {
			System.out.println("에러 : " + e.getMessage());
		}
		
		
		
		
		return rand + "";
	}
	
	
	@RequestMapping("/sendEmail.do")
	public String sendEmail(String email) throws AddressException, MessagingException {
		//6자리 인증코드 생성
		int rand = (int) (Math.random() * 899999) + 100000;
		
		//보내는 사람 이메일 사이트
		String host = "smtp.gmail.com";
		
		final String hostName = "tnals5152";
		final String hostPwd = "fgukmqoifmnffzuv";
		int port = 465;//구글일 경우 465 네이버일 경우 587
		
		//메일 내용
		String recieverEmail = email;
		String subject = "[지니문고] 이메일인증";
		String body = "[지니문고]의 인증메일입니다.\n인증번호는 " + rand + "입니다.";
		
		Properties props = System.getProperties();//정보를 담기 위한 객체 생성
		
		//SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		
		//session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = hostName;
			String pw = hostPwd;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		
		session.setDebug(true);
		
		MimeMessage mimeMessage = new MimeMessage(session);//MimeMessage생성
		mimeMessage.setFrom(new InternetAddress("tnals5152@gmail.com"));//발신자 세팅
		mimeMessage.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(recieverEmail));//수신자 세팅
		
		mimeMessage.setSubject(subject);//제목세팅
		mimeMessage.setContent(DM.dmCertification(rand), "text/html;charset=utf-8");
		Transport.send(mimeMessage);
		
		
		
		
		return rand + "";
	}
	
	
}
