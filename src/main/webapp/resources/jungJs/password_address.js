/**
 * 회원 회원가입 / 지점 회원가입에 들어갈 js
 * 회원 정보 수정 / 지점 정보 수정에 들어갈 js
 */
 
 var avail_pwd = 0;
 var pwd_check = 0;
 
 
 $().ready(function(){
	
	/* 비빌번호 양식 확인 */
	$("#pwd").blur(function(){
		var pwd = $("#pwd").val();
		var num = pwd.search(/[0-9]/g);
		var eng = pwd.search(/[a-z]/ig);
		var spe = pwd.search(/[!@#$%^*+=-_]/gi);
		
		if(pwd.length < 8 || pwd.length > 20){
			$("#pwd_check").text("8자리 이상 20자리 이내로 입력해주세요.");
			$("#pwd").val("");
			$("#pwd2").val("");
			avail_pwd = 0;
		} else if (pwd.search(/\s/)!= -1){
			$("#pwd_check").text("비밀번호는 공백 없이 입력해주세요.");
			$("#pwd").val("");
			$("#pwd2").val("");
			avail_pwd = 0;
		} else if (num < 0 || eng < 0 || spe < 0){
			$("#pwd_check").text("영문, 숫자, 특수문자(!@#$%^*+=-_)를 혼합하여 입력해주세요.");
			$("#pwd").val("");
			$("#pwd2").val("");
			avail_pwd = 0;
		} else {
			$("#pwd_check").text("사용 가능한 비밀번호 입니다.");
			$("#pwd2").val("");
			avail_pwd = 1;
		}
	});
	
	/* 비밀번호 재입력 확인 */
	$("#pwd2").blur(function(){
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		
		if(pwd == pwd2){
			$("#pwd_check2").text("비밀번호가 일치합니다.");
			pwd_check = 1;
			
		} else {
			$("#pwd_check2").text("비밀번호가 일치하지 않습니다.");
			$("#pwd2").val("");
			pwd_check = 0;
		}
		
	});
	
});


//우편번호검색 API
function search_address() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            console.log("시작");

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = data.roadAddress; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraAddr !== ''){
                extraAddr = ' (' + extraAddr + ')';
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            addr += extraAddr;

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip_code').value = data.zonecode;
            document.getElementById('addr').value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('lot_addr').focus();
        }
    }).open();
}

//글자수 제한(아이디, 비밀번호, 휴대전화, 전화번호)
function numberMaxLength(e) {
	if(e.value.length > e.maxLength) {
		e.value = e.value.slice(0, e.maxLength);
	}
}