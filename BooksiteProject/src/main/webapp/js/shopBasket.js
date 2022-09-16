const checkBoxTrueImg = "source/ico/check_box_true.svg";
const checkBoxFalseImg = "source/ico/check_box_false.svg";

$(function (){    
    // 체크박스 눌리면  눌리게 변함
    $('.selected > img').click( function(){
        let nowImg = $(this).attr("src");
        
        if(nowImg == checkBoxFalseImg)
            $(this).attr('src', checkBoxTrueImg);
        else
            $(this).attr('src', checkBoxFalseImg);
    });

    // 장바구니에 있는 책을 누르면 버튼처럼 작동됨
    // (버튼 안에 버튼요소가 있는건 알맞지 않는 것 같다...)
    let flag = false;
    $('.bookItem').mousedown(function(){
        if(flag) return;

        $(this).css({
            "box-shadow": "inset 2px 2px 10px rgb(0, 0, 0, 0.1)",
            "transform" :"scale( 0.9999 )"
        });
    });
    $('.bookItem').mouseup(function(){
        $(this).css({
            "box-shadow" : "",
            "transform" : ""
        });
    }); 
    
    $('.bookItem > .bookCount > input[type=number]').mousedown(function(){ flag = true; });
    $('.bookItem > .bookCount > input[type=number]').mouseup(function(){ flag = false; });
});