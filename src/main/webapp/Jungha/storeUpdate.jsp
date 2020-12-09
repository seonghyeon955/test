<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점정보 수정</title>
<%@include file="../seongmi/officeAdminInclude.jspf"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jungha.css">
<script src="${pageContext.request.contextPath}/resources/jungJs/email.js"></script>
<script src="${pageContext.request.contextPath}/resources/jungJs/password_address.js"></script>
<script>
	email_check = 1;

	$().ready(function(){
		
		
		//이메일 뒷부분 value가 vo에 있는 것과 같으면 selected해주기
		$("#email_select option").each(function(){
			if($(this).val() == "${store.getEmail_b() }"){
				console.log($(this).val());
				$(this).prop("selected", true);	
				$("#email_b").prop("readonly", true);
				$("#email_b").val($(this).val());
			}
		});
		
		if($("#email_b").val() != "${store.getEmail_b() }"){
			$("#email_select").val(0).prop("selected", true);	
			$("#email_b").prop("readonly", false);
			$("#email_b").val("${store.getEmail_b() }");
		}
		
		var phone1 = "${store.getPhone1() }";
		$('#phone4 option').each(function(){
			if($(this).val() == "${store.getPhone1() }"){
				$(this).prop("selected", true);
			}
		});
		
		var zip_code = "${store.getZip_code() }";
		if(zip_code != 0){
			$("#zip_code").val("${store.getZip_code() }");
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
			alert("전화번호란을 입력해주세요!");
			$phone2.val("");
			$phone3.val("");
			$phone2.focus();
			
			return false;
		} 
		
		frm.submit();
		
	}
	
</script>
</head>
<body>
	<div id="wrapper">
    <%@include file="../seongmi/adminSideBar.jspf"%>
    
<div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

		  
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">지점 정보를 수정하세요.</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
	<form action="${pageContext.request.contextPath}/doStoreUpdate.do" name="signup_frm" method="post">
		<table>
			<tr>
				<td>
					<table class="table table-borderless">
						<tr>
							<th>지점명</th>
							<td>
								${store.getStore_name() }
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<div class="condition" id="pwd_check"></div>
								<input type="password" name="store_pwd" id="pwd" maxlength="20" oninput="numberMaxLength(this)">
							</td>
						</tr>
						<tr>
							<th>비밀번호 재입력</th>
							<td>
								<div class="condition" id="pwd_check2"></div>
								<input type="password" id="pwd2" maxlength="20" oninput="numberMaxLength(this)">
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<div class="input-group-append">
									<input type="text" id="email_f" name="email_f" class="email" value="${store.getEmail_f() }">
										<div class="input-group-text">@</div>
										<input type="text" id="email_b" name="email_b" class="email" size="17">
										<select id="email_select" class="email">
											<option value=0>직접입력</option>
											<option value="gmail.com">gmail.com</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="daum.net">daum.net</option>
											<option value="hanmail.net">hanmail.net</option>
										</select>&nbsp;
										<input type="button" class="btn btn-outline-danger" id="checkEmail" onclick="check_email1()" value="인증코드 전송">
								</div>
								<div id="email_certification"></div>
								<span class="condition" id="emailResult"></span><br>
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<select name="phone1" id="phone1">
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
								-<input type="number" name="phone2" id="phone2" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)" value="${store.getPhone2() }">
								-<input type="number" name="phone3" id="phone3" min="0" max="9999" maxlength="4" oninput="numberMaxLength(this)" value="${store.getPhone3() }">
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="number" id="zip_code" name="zip_code" readonly max="5" value="${store.getZip_code() }">
								<input type="button" value="우편번호 검색" onclick="search_address()" class="btn btn-secondary btn-sm">
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="text" id="addr" name="street_addr" readonly placeholder="도로명 주소" size="60" value="${store.getStreet_addr() }">
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="text" id="lot_addr" name="remaining_addr" onfocus="this.select()" size="60" maxlength="25" oninput="numberMaxLength(this)" value="${store.getRemaining_addr() }">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right">
					<input type="button" value="저장" class="btn btn-outline-danger" onclick="update(this.form)">
				</td>
			</tr>
		</table>
	</form>
	
	 </div>
            </div>
            <div>
            	
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

    </div>

</div>





<!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/seongmiCss/js/demo/datatables-demo.js"></script>

<script>
$(document).ready(function () {
	document.getElementById("menu_name").innerHTML = "지점 정보 수정";
});
</script>
</body>
</html>