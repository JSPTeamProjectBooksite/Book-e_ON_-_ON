const checkBoxTrueImg = "source/ico/check_box_true.svg";
const checkBoxFalseImg = "source/ico/check_box_false.svg";

$(function (){    
    // // 체크박스 눌리면  눌리게 변함
    // $('.selected > img').click( function(){
    //     let nowImg = $(this).attr("src");
    //     $(this).attr('src', (nowImg == checkBoxFalseImg)?checkBoxTrueImg:checkBoxFalseImg);
    // });

    // 장바구니에 있는 책을 누르면 버튼처럼 작동됨
    // number input을 건드릴 땐 반응을 못하게 함
    $('.bookItem').mousedown( function(event){
        let targetType = $(event.target).attr('type');
        
        if(targetType == "number") 
            return;

        // 체크박스 이미지 변경
        let nowImg = $(this).attr("src");
        $(this).attr('src', (nowImg == checkBoxFalseImg)?checkBoxTrueImg:checkBoxFalseImg);
        
        // 버튼 클릭 효과
        $(this).addClass('bookItemClick');
    });

    // 마우스가 밖으로 벗어났거나, 버튼을 땠을 때 클릭 효과를 제거함 
    $('.bookItem').mouseup(function() {$(this).removeClass('bookItemClick') }); 
    $('.bookItem').mouseout(function() { $(this).removeClass('bookItemClick') });
});