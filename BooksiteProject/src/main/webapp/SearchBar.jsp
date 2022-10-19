<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">
	#searchBar{
        display: grid;
        grid-template-columns: 1.5fr 7.5fr 1fr;
        align-items: center;
        gap: 20px;
        width: 750px;
        background:#b1caf0;
        margin: auto;
        padding: 0px 35px 0px 35px;
        text-align: center;
        border-radius: 50vh;
        border: 3px #5785ca solid;

        /* 그림자 애니메이션 속도*/
        transition: all 0.1s linear;
    }
    /* 그림자 애니메이션*/
    #searchBar:focus-within,
    #searchBar:hover{
        box-shadow: 0px 3px 5px 3px #6a8dc2;
    }

    #searchOption{
        height: 100%;
        width: 100%;

        text-align: center;
        font-size: 25px;
        font-weight: 600;
        color:#576cca;

        background-color:transparent;
        border: none;
    }
    .searchText{
        padding: 10px;
        width: 100%;
        height: 100%;
        font-size: 24px;
        border: none;
        background-color:transparent;
        color: white;
    }
    #searchBar input:focus,
    #searchBar select:focus{
        outline: none;
        background-color:#89b0e9;
    }
    #searchBtn{
        width: 100%;
        height: 100%;
        border: none;
        background-color: transparent;
    }
    #searchBtn path{
        width: 80%;
        fill: #576cca;
        transition: all 0.01s linear;
    }
    #searchBtn:hover path{
        fill: #2c43a8;
    }
</style>
<!-- 검색창 -->
<form action="/list" id="searchBar">
    <select name="searchFeild" id="searchOption">
        <option value="total">전체</option>
        <option value="title">제목</option>
        <option value="author">작가</option>
    </select>
    <input class="searchText" type="text" name="searchWord" value="${ searchWord }">
    <button id="searchBtn" type="submit" alt="search" value="" onclick="return checkSearchWord()">
        <svg enable-background="new 0 0 32 32" id="Glyph" version="1.1" viewBox="0 0 32 32" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
            <path d="M27.414,24.586l-5.077-5.077C23.386,17.928,24,16.035,24,14c0-5.514-4.486-10-10-10S4,8.486,4,14  s4.486,10,10,10c2.035,0,3.928-0.614,5.509-1.663l5.077,5.077c0.78,0.781,2.048,0.781,2.828,0  C28.195,26.633,28.195,25.367,27.414,24.586z M7,14c0-3.86,3.14-7,7-7s7,3.14,7,7s-3.14,7-7,7S7,17.86,7,14z" id="XMLID_223_"/>
        </svg>
    </button>
</form>
<script>
    var form = document.getElementById("searchBar");
    // alert("${ searchFeild }");
    if("${ searchFeild }"=="total"){
        document.getElementById("searchOption").options[0].selected = true;
    }
    else if("${ searchFeild }"=="title"){
        document.getElementById("searchOption").options[1].selected = true;
    }
    else if("${ searchFeild }"=="author"){
        document.getElementById("searchOption").options[2].selected = true;
    }



    function checkSearchWord(){
        if(form.searchWord.value.trim().length < 1){
            alert("검색 키워드 1글자 이상 입력해주세요.");
            return false;
        }
    }
</script>
</html>