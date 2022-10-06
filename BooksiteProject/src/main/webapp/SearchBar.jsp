<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#searchBar{
        display: grid;
        grid-template-columns: 1.5fr 7.5fr 1fr;
        align-items: end;
        gap: 20px;
        height:70px;
        width: 750px;
        background:rgb(203, 255, 250);
        margin: auto;
        padding-left: 35px;
        padding-right: 35px;
        text-align: center;
        border-radius: 50vh;
        border: 3px darkcyan solid;

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
        color:darkcyan;

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
    }
    input:focus,
    select:focus{
        outline: none;
        background-color:rgb(183, 235, 255);
    }
    #searchBtn{
        width: 100%;
        height: 100%;
        border: none;
        border-radius: 50vw;
        background-image:url('./source/MainPage/돋보기.png');
        background-repeat: no-repeat;
        background-position:center;
        background-color: transparent;
        background-size: 100% 100%;
        cursor:pointer;
        transition: all 0.01s linear;
    }
    #searchBtn:hover{
        transform: scale( 1.15 );
    }
</style>
</head>
<body>
<!-- 검색창 -->
<form action="/list">
    <div id="searchBar">
        <select name="searchFeild" id="searchOption">
            <option value="title">제목</option>
            <option value="author">작가</option>
        </select>
        <input class="searchText" type="text" name="searchWord">
        <input id="searchBtn" type="submit" alt="search" value=" ">
    </div>
</form>
</body>
</html>