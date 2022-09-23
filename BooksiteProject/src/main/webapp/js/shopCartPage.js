const checkBoxTrueImg = "source/ico/check_box_true.svg";
const checkBoxFalseImg = "source/ico/check_box_false.svg";

$(function (){   
    // 장바구니에 있는 책을 누르면 버튼처럼 작동됨
    $('.bookItem').mousedown( function(event){
        let targetType = $(event.target).attr('type');
        
        if(targetType == "number") 
        return;
        
        // 체크박스 이미지 변경
        let checkImg = $(this).find('.bookCheck > img');
        checkImg.attr('src', (checkImg.attr("src") == checkBoxFalseImg) ? checkBoxTrueImg:checkBoxFalseImg);
        
        // 체크박스 실제로 변경
        let checkInput = $(this).find("input:checkbox[id='check']");
        checkInput.prop('checked', !checkInput.is(":checked"));

        // 버튼 클릭 효과
        $(this).addClass('bookItemClick');
    });

    // 마우스가 밖으로 벗어났거나, 버튼을 땠을 때 클릭 효과를 제거함 
    $('.bookItem').mouseup(function() { $(this).removeClass('bookItemClick') }); 
    $('.bookItem').mouseout(function() { $(this).removeClass('bookItemClick') });
});

function selectBookSaveBtnFun(id){
	let addId = id + "";
	let cookie = getCookie("cart");
	
	if(cookie != null){
		cookie = cookie + "/" + addId;
	}else{
		cookie = addId;
	}
	
	setCookie("cart", cookie, 3);
	
    if(confirm("장바구니에 추가됐습니다.\n장바구니로 이동하시겠습니까?")){
		location.href = "./shopcart";
	}
};



// 쿠키 설정 setCookie('pop', 'event0405', 7); /* pop=event0405, 7일 뒤 만료됨 */
function setCookie(name, value, exp) {
    var date = new Date();
    date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
    document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
}

/* 쿠키 얻기 getCookie('pop');  결과: pop0405 */
function getCookie(name) {
  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
  return value? value[2] : null;
}