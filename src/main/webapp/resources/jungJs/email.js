/**
 * 회원 회원가입 / 지점 회원가입에 들어갈 js
 * 회원 정보 수정 / 지점 정보 수정에 들어갈 js
 */
 
 var email_check = 0;
 $().ready(function(){
	
	/* email주소 뒷부분 선택 시 자동 입력 */
	$("#email_select").click(function(){
		if($("#email_select option:selected").val() == "0"){
			$("#email_b").prop("readonly", false);
			$("#email_b").val("");
		} else {
			$("#email_b").prop("readonly", true);
			$("#email_b").val($("#email_select option:selected").val());
		}
	});
	
});

/* 이메일 인증번호 확인  */
function check_email() {
	var email_f = $("#email_f").val().trim();
	var email_b = $("#email_b").val().trim();
	
	if(email_f != "" && email_b != ""){
		var email =  email_f + '@' + email_b;
		console.log("email : " + email);
		
		var key; //인증키
		var bool = true;
		
		if(bool) {
			$.ajax({
				url: "../emailAuth.do",
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
