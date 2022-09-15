$(function (){
    $('.bookItem').on('click', function(){
        let box = $(this).find('input:checkbox[name="book"]');
        
        box.prop("checked", !box.is(':checked'))
    });
});