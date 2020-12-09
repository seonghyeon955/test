/**
 * 
 */

var availID = 0;
var idChecked = 0;

$().ready(function(){
	$("#id").blur(function(){
		var id = $("#id").val();
		var regType1 = /^[A-Za-z0-9!@#$%^*+=-_]*$/;
		
		if(id.length < 5){
			$("#id_check").text("아이디를 5자 이상 입력해주세요.");
			availID = 0;
			idChecked = 0;
		}else if (!regType1.test(id)) { 
			$("#id_check").text("아이디는 알파벳 대소문자와 숫자, !@#$%^*+=-_로 이루어져야 합니다.");
			idChecked = 0;
			availID = 0;
		}else {
			$("#id_check").text("사용 가능한 아이디입니다. 중복 체크를 해주세요.");
			availID = 1;
			idChecked = 0;
		}
		
		if(availID == 0){
			$("#duplicate_check").prop("disabled", true);
		}else {
			$("#duplicate_check").prop("disabled", false);
		}
		
	});
});

function checkId(){
	//var id = $("#id").val();
	$.ajax({
		url: "../ID_Check.do",
		type : "POST",
		dataType: "text",
		contentType : "text/plain; charset=utf-8;",
		data : $("#id").val(),

		success: function(data){
			if(data == 1){
				$("#checkIdResult").text("이미 사용 중인 아이디입니다.");
				idChecked = 0;
			}else{
				$("#checkIdResult").text("사용가능한 아이디입니다.");
				$("#id_check").text("");
				idChecked = 1;
			}
			
		},
		error : function(){
			alert("[예외발생]");
		}
	});
}