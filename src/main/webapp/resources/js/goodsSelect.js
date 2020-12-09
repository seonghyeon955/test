$(function(){
	
	//추가로 결제 될 금액 나올 태그 저장
	var $extra = $("#extra");
	
	//적립(보유) 포인트 저장
	var point = parseInt($("#point").text());
	
	//굿즈 사고 남은 포인트
	var extrapoint = point;
	
	
	//추가로 결제 될 금액 저장
	var extra = parseInt($extra.text());
	var checkedGoodsPrice = 0;
	var usedpoint = 0;
	
	//굿즈 체크박스 클릭했을 때
	$(".goodsCheckbox").click(function(){
		
			
			//체크박스부모(lable)의 다음(br)다음(span)태그의 text 저장
			var goodsPrice = parseInt($(this).parent().next().next().text());
			if($(this).prop("checked")){//체크박스 체크 되어있으면 총합에 더하기
				
				checkedGoodsPrice += goodsPrice;
				
			}else{//체크박스 체크 되어있지 않으면 총합에서 빼기
				checkedGoodsPrice -= goodsPrice;
			}
			
			
			if(checkedGoodsPrice > point){//총합이 보유 포인트보다 크면 추가 결제금액 더해주기
				extra = checkedGoodsPrice - point;//추가 결제 금액
				extrapoint = 0;//나머지 보유 포인트
			}else if(checkedGoodsPrice <= point){//총합이 보유 포인트보다 적으면 추가 결제금액 없음
				extra = 0;//추가 결제 금액
				extrapoint = point - checkedGoodsPrice;//나머지 보유 포인트
			}
			
			
			if(checkedGoodsPrice >= point){
				usedpoint = point;
			}else{
				usedpoint = checkedGoodsPrice;
			}
			
			$extra.text(extra);
			$("#usedpoint").text(usedpoint);
			$("input[name=usedpoint]").val(usedpoint);
			$("input[name=extrapoint]").val(extrapoint);
			$("input[name=extra]").val(extra);
			
		
	});
	
	
	
	
	
});


//결제페이지로 가기
//사은품 선택 완료 버튼 클릭시
function btn_go_buy(goodsForm){
	var result = confirm("선택한 사은품으로 결제를 진행하시겠습니까?");
	if(result == false){
		return;
	}else if(result == true){
		goodsForm.action = "orderStep1.do";
		goodsForm.submit();
	}
}