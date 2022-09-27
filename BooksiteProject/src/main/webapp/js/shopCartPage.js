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
    
    
    // submit 버튼들 
    $('.selectBookPaymentBtn').click(function(){ $('#cartForm').attr('action', './payment'); });
    $('.selectBookSaveBtn').click(function(){ $('#cartForm').attr('action', '#'); });
});

