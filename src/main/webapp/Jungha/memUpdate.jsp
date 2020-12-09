<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<%@include file="/common/include.jspf"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
<%@include file="/resources/css/header.css"%>
<%@include file="/resources/css/footer.css"%>
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jungha.css">
<script src="${pageContext.request.contextPath}/resources/jungJs/email.js"></script>
<script src="${pageContext.request.contextPath}/resources/jungJs/password_address.js"></script>
<script>
	email_check = 1;

	$().ready(function(){
		
		
		//이메일 뒷부분 value가 vo에 있는 것과 같으면 selected해주기
		$("#email_select option").each(function(){
			if($(this).val() == "${mem.getEmail_b() }"){
				console.log($(this).val());
				$(this).prop("selected", true);	
				$("#email_b").prop("readonly", true);
				$("#email_b").val($(this).val());
			}
		});
		
		if($("#email_b").val() != "${mem.getEmail_b() }"){
			$("#email_select").val(0).prop("selected", true);	
			$("#email_b").prop("readonly", false);
			$("#email_b").val("${mem.getEmail_b() }");
		}
		
		var phone4 = "${mem.getPhone4() }";
		$('#phone4 option').each(function(){
			if($(this).val() == "${mem.getPhone4() }"){
				$(this).prop("selected", true);
			}
		});
		
		var zip_code = "${mem.getZip_code() }";
		if(zip_code != 0){
			$("#zip_code").val("${mem.getZip_code() }");
		}
		
		$(".email").change(function(){
			email_check = 0;
		});

	});
	
	/* 이메일 인증번호 확인  */
	function check_email1() {
		var email_f = $("#email_f").val().trim();
		var email_b = $("#email_b").val().trim();
		
		if(email_f != "" && email_b != ""){
			var email =  email_f + '@' + email_b;
			console.log("email : " + email);
			
			var key; //인증키
			var bool = true;
			
			if(bool) {
				$.ajax({
					url: "/biz/emailAuth.do",
					type : "POST",
					dataType: "text",
					contentType : "text/plain; charset=utf-8;",
					data : email,
		
					success: function(result){
						alert("인증번호가 발송되었습니다!");
						key = result;
						bool = false;
					},
					error : function(){
						alert("[예외발생]");
					}
				}); //ajax
				
				$("#email_certification").addClass("input-group-text");
				var text = '<b>인증코드 입력 :&nbsp;&nbsp;</b>'
					+'<input type="text" id="cer_num" placeholder="인증코드 입력">'
					+'<input type="button" id="getCernum" value="확인">'
				$("#email_certification").html(text);
				
				$("#getCernum").click(function(){
					var userContent = $("#cer_num").val();
					console.log("userContent : " + userContent);
					
					if(userContent == key){
						$("#emailResult").text("인증되었습니다!");
						email_check = 1;
					} else {
						$("#emailResult").text("인증번호가 틀렸습니다!");
						email_check = 0;
					}
				});
				
			} else {
				
			}
		} else {
			alert("이메일을 입력해주세요!");
		}
	}
	
	function update(frm){
		
		//닉네임
		var $nickname = $("#nickname");
		console.log("nickname : " + $nickname.val);
		if($nickname.val().trim() == ""){
			alert("닉네임을 입력해주세요!");
			$nickname.val("");
			$nickname.focus();
			
			return false;
		}
		
		//이메일 인증여부
		if(email_check != 1) {
			alert("이메일을 인증해주세요!");
			$("#email_f").focus();
			
			return false;
		} 
		
		if($("#pwd").val().trim() != ""){
			//비밀번호 양식 체크
			var $pwd = $("#pwd");
			console.log("pwd : " + $pwd.val())
			if(avail_pwd != 1){
				alert("비밀번호 양식을 확인해주세요!");
				$pwd.val("");
				$pwd.focus();
				
				return false;
			}
			
			//비밀번호 재확인 여부
			var $pwd2 = $("#pwd2");
			console.log("pwd2 : " + $pwd2.val())
			if(pwd_check != 1) {
				alert("비밀번호 재입력을 확인해주세요!");
				$pwd2.val("");
				$pwd2.focus();
				
				return false;
			}
		}
		
		//휴대전화
		var $phone1 = $("#phone1");
		var $phone2 = $("#phone2");
		var $phone3 = $("#phone3");
		console.log("phone : " + $phone1.val() + "-" + $phone2.val() + "-" + $phone3.val());
		if($phone1.val().trim() == "" || $phone2.val().trim() == "" || $phone3.val().trim() == ""){
			alert("휴대전화 란을 입력해주세요!");
			$phone1.val("");
			$phone2.val("");
			$phone3.val("");
			$phone1.focus();
			
			return false;
		} 
		
		console.log("회원가입");
		//frm.action="../signup.do";
		frm.submit();
		
	}
	
</script>
</head>
<body>
	<div class="container-fluid mainPage">
	<%@include file="/common/header.jspf"%>
	<%@include file="/common/menuBar.jspf"%>
    <div class="row">
       <!-- 왼쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
        
        <!-- 본문영역 -->
        <div class="col-xl-8 col-md-8 mb-8 bg-light">

	<form action="doMemUpdate.do" name="signup_frm" method="post">
		<h3>회원 정보 수정</h3>
		<hr>
		<table>
			<tr>
				<td>
					<table class="table table-borderless">
						<tr>
							<th><span class="red condition">*&nbsp;</span>이름</th>
							<td>
								${mem.getUser_name() }
							</td>
						</tr>
						<tr>
							<th><span class="red condition">*&nbsp;</span>아이디</th>
							<td>
								${sessionScope.user.getId() }
							</td>
						</tr>
						<tr>
							<th><span class="red condition">*&nbsp;</span>닉네임</th>
							<td>
								<input type="text" id="nickname" name="nickname" value="${mem.getNickname() }" maxlength="10" oninput="numberMaxLength(this)">
							</td>
						</tr>
						<tr>
							<th><span class="red condition">*&nbsp;</span>이메일</th>
							<td>
								<div class="input-group-append">
									<input type="text" id="email_f" name="email_f" class="email" value="${mem.getEmail_f() }">
									<div class="input-group-text">@</div>
									<input type="text" id="email_b" name="email_b" class="email" size="17">
									<select id="email_select" class="email">
										<option value=0>직접입력</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
									</select>
									<input type="button" id="checkEmail" onclick="check_email1()" value="인증코드 전송">
								</div>
								<div id="email_certification"></div>
								<span class="condition" id="emailResult"></span><br>
								<label><input type="checkbox" name="email_receive" value="1" checked="${mem.getEmail_receive() }">이메일 수신 여부</label>
							</td>
						</tr>
						<tr>
							<th><span class="red condition">*&nbsp;</span>비밀번호</th>
							<td>
								<div class="condition" id="pwd_check"></div>
								<input type="password" name="pwd" id="pwd" maxlength="20" oninput="numberMaxLength(this)">
							</td>
						</tr>
						<tr>
							<th><span class="red condition">*&nbsp;</span>비밀번호 재입력</th>
							<td>
								<div class="condition" id="pwd_check2"></div>
								<input type="password" id="pwd2" maxlength="20" oninput="numberMaxLength(this)">
							</td>
						</tr>
						<tr>
							<th><span class="red condition">*&nbsp;</span>휴대전화</th>
							<td>
								<input type="number" id="phone1" name="phone1" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)" value="${mem.getPhone1() }">-
								<input type="number" id="phone2" name="phone2" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)" value="${mem.getPhone2() }">-
								<input type="number" id="phone3" name="phone3" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)" value="${mem.getPhone3() }">
								<br>
								<label><input type="checkbox" name="sms_receive" value="1" checked="${mem.getSms_receive() }">문자 수신 여부</label>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<select name="phone4" id="phone4">
									<option value="02">02</option>
									<option value="051">051</option>
									<option value="053">053</option>
									<option value="032">032</option>
									<option value="062">062</option>
									<option value="042">042</option>
									<option value="052">052</option>
									<option value="044">044</option>
									<option value="031">031</option>
									<option value="033">033</option>
									<option value="043">043</option>
									<option value="041">041</option>
									<option value="063">063</option>
									<option value="061">061</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="064">064</option>
								</select>
								-<input type="number" name="phone5" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)" value="${mem.getPhone5() }">
								-<input type="number" name="phone6" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)" value="${mem.getPhone6() }">
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="number" id="zip_code" name="zip_code" readonly max="5" value="${mem.getZip_code() }">
								<input type="button" value="우편번호 검색" onclick="search_address()" class="btn btn-secondary btn-sm">
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="text" id="addr" name="street_addr" readonly size="60" value="${mem.getStreet_addr() }">
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="text" id="lot_addr" name="remaining_addr" onfocus="this.select()" size="60" maxlength="25" oninput="numberMaxLength(this)" value="${mem.getRemaining_addr() }">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="저장" class="btn btn-outline-danger" onclick="update(this.form)">
				</td>
			</tr>
		</table>
	</form>
	
	</div>
      <!-- 오른쪽 사이드바 -->
        <div class="col-xl-2 col-md-2 mb-2"></div>
    </div>
</div>
<%@include file="/common/footer.jspf"%>
</body>
</html>