<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<script src="${pageContext.request.contextPath}/resources/jungJs/idCheck.js"></script>
<script src="${pageContext.request.contextPath}/resources/jungJs/terms.js"></script>
<script>
	
	function sign_up(frm) {
		
		//이름 입력 여부
		var $name = $("#name");
		console.log("name : " + $name.val());
		if($name.val().trim() == ""){
			alert("이름을 입력해주세요!");
			$name.val("");
			$name.focus();
			
			return false;
		}
		
		//아이디 입력 여부
		var $id = $("#id");
		console.log("id : " + $id.val());
		if($id.val().trim() == "" || $id.val() == null) {
			alert("아이디를 입력해주세요!");
			$id.val("");
			$name.focus();
			
			return false;
		}
		
		//아이디 사용 가능 여부
		console.log("availID : " + availID);
		if(availID == 0 ){
			alert("아이디 양식을 확인해주세요!");
			$id.val("");
			$id.focus();
			
			return false;
		}
		
		//아이디 중복 체크 여부
		console.log("idChecked : " + idChecked);
		if (idChecked == 0) {
			alert("아이디 중복 체크를 해주세요!");
			$id.focus();
			
			return false;
		}
		
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
		
		//약관 동의 여부
		if(terms_check != 1){
			alert("모든 필수 약관에 동의해야 합니다!");
			
			return false;
		}
		
		console.log("회원가입");
		frm.submit();
	}
	

	$().ready(function(){
		//이메일 값 바뀌면 다시 인증 받도록
		$(".email").change(function(){
			if(email_check == 1) {
				email_check = 0;
				$("#emailResult").text("다시 인증해주세요!");
			}
		});
	});
	
	
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

	<form action="${pageContext.request.contextPath}/signup.do" name="signup_frm" method="post">
		<h3>회원가입</h3>
		<hr>
		<table>
			<tr>
				<td>
					<table class="table table-borderless">
						<tr>
							<th><span class="red condition">*&nbsp;</span>이름</th>
							<td>
								<input type="text" id="name" name="user_name" placeholder="이름을 입력해주세요" maxlength="10" oninput="numberMaxLength(this)">
							</td>
						</tr>
						<tr>
							<th><span class="red condition">*&nbsp;</span>아이디</th>
							<td>
								<div class="condition" id="id_check"></div>
								<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요" maxlength="30" oninput="numberMaxLength(this)">
								<input type="button" id="duplicate_check" onclick="checkId()" disabled value="아이디 중복 체크">
								<span class="condition" id="checkIdResult"></span>
							</td>
						</tr>
						<tr>
							<th><span class="red condition">*&nbsp;</span>닉네임</th>
							<td>
								<input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요" maxlength="10" oninput="numberMaxLength(this)">
							</td>
						</tr>
						<tr>
							<th><span class="red condition">*&nbsp;</span>이메일</th>
							<td>
								<div class="input-group-append">
									<input type="text" id="email_f" name="email_f" class="email" placeholder="이메일을 입력해주세요">
									<div class="input-group-text">@</div>
									<input type="text" id="email_b" name="email_b" class="email" size="17">
									<select id="email_select" class="email">
										<option value=0 selected>직접입력</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
									</select>
									<input type="button" id="checkEmail" onclick="check_email()" value="인증코드 전송">
								</div>
								<div id="email_certification"></div>
								<span class="condition" id="emailResult"></span><br>
								<label><input type="checkbox" name="email_receive" value="1">이메일 수신 여부</label>
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
								<input type="number" id="phone1" name="phone1" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)">-
								<input type="number" id="phone2" name="phone2" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)">-
								<input type="number" id="phone3" name="phone3" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)">
								<br>
								<label><input type="checkbox" name="sms_receive" value="1">문자 수신 여부</label>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<select name="phone4">
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
								-<input type="number" name="phone5" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)">
								-<input type="number" name="phone6" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)">
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
								<input type="date" id="birthday" name="birthday" value="1990-01-01">
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="number" id="zip_code" name="zip_code" readonly placeholder="우편번호"  max="5">
								<input type="button" value="우편번호 검색" onclick="search_address()" class="btn btn-secondary btn-sm">
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="text" id="addr" name="street_addr" readonly placeholder="도로명 주소" size="60">
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="text" id="lot_addr" name="remaining_addr" onfocus="this.select()" placeholder="상세주소" size="60">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table id="terms">	
						<tr>
							<td colspan="2">
								<label><input type="checkbox" id="checkAll" value="all">모든 약관에 동의합니다.</label>
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>
								<label><input type="checkbox" id="terms1" value="terms1" class="terms">이용약관</label>
								<a href="#" class="link" onclick="window.open('/biz/Jungha/detail/Terms_of_Use.jsp', 'blank', 'width=700, height=400, top=200, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes')">약관 전체보기</a>		
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>
								<label><input type="checkbox" id="terms2" value="terms2" class="terms">커뮤니티 이용약관</label>
								<a href="#" class="link" onclick="window.open('/biz/Jungha/detail/Terms_of_CommunityUse.jsp', 'blank', 'width=700, height=400, top=200, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes')">약관 전체보기</a>				
							</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>
								<label><input type="checkbox" id="terms3" value="terms3" class="terms">개인 정보 수집 및 이용</label>		
								<a href="#" class="link" onclick="window.open('/biz/Jungha/detail/Use_of_personal_information.jsp', 'blank', 'width=700, height=400, top=200, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes')">내용보기</a>		
							</td>
						</tr>
					</table>
				</td>
			</tr>	
			<tr>
				<td colspan="2">
					<input type="button" id="signup" value="회원가입" class="btn btn-outline-danger" onclick="sign_up(this.form)">
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