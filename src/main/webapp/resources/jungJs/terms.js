/**
 * 약정 동의 체크박스 액션
 */
 
var terms_check = 0;

$().ready(function(){

	/* 약정 체크박스 */
	$("#checkAll").click(function(){
		if($("#checkAll").prop("checked")){
			$(".terms").each(function(){
				$(this).prop("checked", true);
			});
			terms_check = 1;
		} else {
			$(".terms").each(function(){
				$(this).prop("checked", false);
			});
			terms_check = 0;
		}
	});
	
	$(".terms").click(function(){
		if($(".terms:checked").length == 3){
			$("#checkAll").prop("checked", true);
			terms_check = 1;
		} else {
			$("#checkAll").prop("checked", false);
			terms_check = 0;
		}
	});
});