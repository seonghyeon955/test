package com.spring.biz.view.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.bit.bookstore.vo.StoreVO;
import com.bit.bookstore.vo.UserVO;
import com.spring.biz.email.DM;
import com.spring.biz.user.UserService;
import com.spring.jung.store.StoreInfoService;

@Controller
@SessionAttributes("user") 
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private StoreInfoService storeInfoService;
	
	@RequestMapping(value="/login1.do", method=RequestMethod.GET)
	public String goSignup() {
		
		return "/Jungha/mem_login.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value = "/ID_Check.do", produces="text/plain")
	public String ID_Check(@RequestBody String paramData) {
		String id = paramData.trim();
		return Integer.toString(userService.ID_Check(id));
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailAuth.do", produces="text/plain")
	public String sendEmail(@RequestBody String email) throws AddressException, MessagingException {
		//6자리 인증코드 생성
		int rand = (int) (Math.random() * 899999) + 100000;
		  
		//보내는 사람 이메일 사이트
		String host = "smtp.gmail.com";
		  
		final String hostName = "geniebooks168";
		final String hostPwd = "wlslansrh168";
		int port = 465;//구글일 경우 465 네이버일 경우 587
		  
		//메일 내용
		String recieverEmail = email;
		String subject = "[지니문고] 이메일 인증번호 인증";
		String body = DM.dmCertification(rand);
		  
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
		mimeMessage.setFrom(new InternetAddress("geniebooks168@gmail.com"));//발신자 세팅
		mimeMessage.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(recieverEmail));//수신자 세팅
		  
		mimeMessage.setSubject(subject);//제목세팅
		mimeMessage.setContent(body, "text/html;charset=utf-8");//내용세팅
		Transport.send(mimeMessage);
		  
		return rand + "";
	}
	
	@RequestMapping(value = "/signup.do", method=RequestMethod.POST)
	public String signup(@ModelAttribute UserVO vo) {
		
		if(vo.getPhone1() != null && vo.getPhone2() != null && vo.getPhone3() != null) {
			vo.setPhone_number1(vo.getPhone1() + "-" + vo.getPhone2() + "-" + vo.getPhone3());
		}
		if(vo.getPhone4() != null && vo.getPhone5() != null && vo.getPhone6() != null) {
			vo.setPhone_number2(vo.getPhone4() + "-" + vo.getPhone5() + "-" + vo.getPhone6());
		}
		if(vo.getBirthday() != null) {
			String[] array = vo.getBirthday().split("-");
			vo.setBirthday_year(array[0]); 
			vo.setBirthday_month(array[1]);
			vo.setBirthday_day(array[2]);
		}
		vo.setEmail(vo.getEmail_f()+ "@" + vo.getEmail_b());
		
		userService.UserSingup(vo);
		
		return "redirect:/login1.do";
	}
	
	@RequestMapping(value= "/login1.do", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, HttpServletResponse response) throws IOException {
		
		int result = userService.Login(vo);
		String url = "";
		
		//로그인 성공
		if(result == 1) {
			//로그인 시 로그인한 유저 정보 업데이트 해주기... 
			userService.LoginUpdate(vo.getId());
			
			//세션에 유저 정보 저장(user)
			UserVO user = userService.getUser(vo.getId());
			
			//cart_idx_cnt userVO에 받아넣기(회원 정보 비밀번호 빼고 불러오기)
			int cart_idx_cnt = userService.getCartIdxCnt(vo.getId());
			user.setCart_idx_cnt(cart_idx_cnt);
			
			session.setAttribute("user", user);
			
			url= "/main.do"; /////////////////////////////////////////////////////////////////메인페이지로
			
		}else {
			//로그인 실패 
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아이디와 비밀번호를 확인해주세요!'); history.go(-1);</script>");
            out.flush();
		}
		
		return url;
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, SessionStatus sessionStatus){

		session.invalidate(); // 세션 초기화
		sessionStatus.setComplete();
  
		return "redirect:/Jungha/mem_login.jsp";
	}   	
	
	@RequestMapping("/findId.do")
	public String findId(UserVO vo, Model model) {
		vo.setEmail(vo.getEmail_f() + "@" + vo.getEmail_b());
		
		List<String> list = userService.findId(vo);
		model.addAttribute("idList", list);
		
		return "/Jungha/showId.jsp";
	}
	
	@RequestMapping("/findPwd.do")
	public String findPwd(UserVO vo, Model model) throws AddressException, MessagingException {
		String email = vo.getEmail_f() + "@" + vo.getEmail_b();
		vo.setEmail(email);
		
		int result = userService.findPwd(vo);
		
		if(result == 1) { //해당되는 회원정보가 있을 때 
			String pwd = "";
			for (int i = 0; i < 12; i++) {
				pwd += (char) ((Math.random() * 26) + 97);
			}
			
			//임시비밀번호로 회원정보 업데이트
			vo.setPwd(pwd);
			userService.updatePwd(vo);
			
			//보내는 사람 이메일 사이트
			String host = "smtp.gmail.com";
			  
			final String hostName = "geniebooks168";
			final String hostPwd = "wlslansrh168";
			int port = 465;//구글일 경우 465 네이버일 경우 587
			  
			//메일 내용
			String recieverEmail = email;
			String subject = "[지니문고] 비밀번호 확인";
			String body = DM.dmCertification(pwd); 
			  
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
			mimeMessage.setFrom(new InternetAddress("geniebooks168@gmail.com"));//발신자 세팅
			mimeMessage.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(recieverEmail));//수신자 세팅
			  
			mimeMessage.setSubject(subject);//제목세팅
			mimeMessage.setContent(body, "text/html;charset=utf-8");//내용세팅
			Transport.send(mimeMessage);
			
			model.addAttribute("result", 1);
			  
		} else { //해당되는 회원 정보가 없을 때
			
			model.addAttribute("result", 0);
			
		}
		
		return "/Jungha/showPwd.jsp";
	}
	
	@RequestMapping("/checkPwd.do")
	public String checkPwd(HttpServletResponse response, HttpSession session,String type, String pwd) throws IOException {
		
		//String type = request.getParameter("type");
		int result = 0;
		String url = "";
		
		if(type.equals("mem_update") || type.equals("mem_delete")) {
			String id = ((UserVO)session.getAttribute("user")).getId();
			UserVO vo = new UserVO();
			vo.setPwd(pwd);
			vo.setId(id);
			result = userService.Login(vo);
		} else if (type.equals("store_update") || type.equals("store_delete")) {
			
			String store_code = (String)session.getAttribute("admin");
			StoreVO vo = new StoreVO();
			vo.setStore_pwd(pwd);
			vo.setStore_code(store_code);
			result = storeInfoService.Login(vo);
		}
		
		if(result == 1 ) { //비밀번호가 맞으면
			if(type.equals("mem_update")) {
				url = "memUpdate.do";
			}else if(type.equals("mem_delete")) {
				url =  "/Jungha/leave.jsp?type=mem";
			}else if(type.equals("store_update")) {
				url =  "storeUpdate.do";
			}else if(type.equals("store_delete")) {
				url =  "/Jungha/leave.jsp?type=store";
			}else {
				//에러
			}
		}else { //비밀번호가 틀렸으면
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호를 확인해주세요!'); history.go(-1);</script>");
			out.flush();
		}
		
		return url;
	}
	
	@RequestMapping("/memUpdate.do")
	public String memUpdate(HttpSession session, Model model) {
		String id = ((UserVO)session.getAttribute("user")).getId();
		UserVO vo = userService.getUserInfo(id);
		String[] email = vo.getEmail().split("@");
		vo.setEmail_f(email[0]);
		vo.setEmail_b(email[1]);
		String[] phone_number1 = vo.getPhone_number1().split("-");
		vo.setPhone1(phone_number1[0]);
		vo.setPhone2(phone_number1[1]);
		vo.setPhone3(phone_number1[2]);
		if(vo.getPhone_number2() != null) {
			String[] phone_number2 = vo.getPhone_number2().split("-");
			vo.setPhone4(phone_number2[0]);
			vo.setPhone5(phone_number2[1]);
			vo.setPhone6(phone_number2[2]);
		}
		model.addAttribute("mem", vo);
		
		return "/Jungha/memUpdate.jsp";
	}
	
	@RequestMapping("/doMemUpdate.do")
	public String doMemUpdate(UserVO vo, HttpSession session) {
		if(vo.getPhone1() != null && vo.getPhone2() != null && vo.getPhone3() != null) {
			vo.setPhone_number1(vo.getPhone1() + "-" + vo.getPhone2() + "-" + vo.getPhone3());
		}
		if(vo.getPhone4() != null && vo.getPhone5() != null && vo.getPhone6() != null) {
			vo.setPhone_number2(vo.getPhone4() + "-" + vo.getPhone5() + "-" + vo.getPhone6());
		}
		vo.setEmail(vo.getEmail_f()+ "@" + vo.getEmail_b());
		vo.setId(((UserVO)session.getAttribute("user")).getId());
		
		//멤버 업데이트 해주기 
		userService.userUpdate(vo);
		
		//비밀번호 null 아니면 비밀번호도 업데이트 해주기
		if(vo.getPwd() != "") {
			userService.updatePwd(vo);
		}
		
		//돌아가기
		return "/kyungnan/myOrderSearch.jsp"; ///////////////////////////////////////////////////////내정보로 돌아가기
	}
	
	@RequestMapping("/memDelete.do")
	public String memDelete(HttpSession session, SessionStatus sessionStatus) {
		
		String id = ((UserVO)session.getAttribute("user")).getId();
		userService.userLeave(id);
		
		session.invalidate();
		sessionStatus.setComplete();
		
		return "/mainBook/index.jsp"; //////////////////////////////////////////////////////메인으로 돌아가기
	}
	
}
