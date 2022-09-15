<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	*{
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	}
	
	#wrap{
	    margin: 0 auto;
	    width: 1200px;
	    /* background-color: #FBCEB1; */
	}
	
	#container{
	    /* background-color: aquamarine; */
	}
	
	#book_contents{
	    height: 550px;
	    /* background-color: blueviolet; */
	}
	#footer{
	    height: 200px;
	    background-color: darkslategrey;
	}
</style>
<script src="./js/bookList.js"></script>
<script type="text/javascript">
	//타이틀 변경
	var BID = <%= request.getParameter("BID") %>;
	function setPage() {
		document.title = bookList[<%= request.getParameter("BID") %>].title;
		
		var prise = "";
		
		prise += Math.floor(bookList[BID].prise/1000)+","+(bookList[BID].prise%1000);
		if((bookList[BID].prise%1000) == 0) prise += "00";
		
		//책 내용 입력
		document.getElementById("title").innerHTML = bookList[BID].title;
		document.getElementById("image").src = bookList[BID].image;
		document.getElementById("image").alt = bookList[BID].title + " 이미지";
		document.getElementById("ad").innerHTML = bookList[BID].ad;
		document.getElementById("author").innerHTML = bookList[BID].author + " 지음";
		document.getElementById("prise").innerHTML = prise +" 원";
	}
</script>
<title>페이지 이동 중...</title>
</head>
<body>
<div id="wrap">
       <div style="
        height: 75px; 
        background-color: aqua
    ;">
        해더
    </div>

    <div style="height: 50px"></div>
    <div id="container">
        <div style="
            width: 700px;
            font-size: 38px;
            font-weight: 700;
            font-family: 고딕;
        " id="title">(제목)
        </div>
        <div style="
            font-size: 15px;
            font-weight: 700;
            font-family: 고딕;
            color: grey;
        " id="ad">(짧은 소개)
        </div>
        <div style="height:5px"></div>
        <div style="
            width: 200px;
        " id="author">(지은이)</div>
    </div>
    <hr>
    <div id="book_contents">
        <div style="
        margin-top: 20px;
        text-align:center;
        display:table;
        height:500px; 
        /* background-color:brown; */
        float:left;
        margin-left: 20px;
        ">
            <div style="
                display:table-cell;
                vertical-align:middle;
            ">
                <img style="
                    max-height: 500px;
                " id="image">
            </div>
        </div>
        <div style="
        margin-top: 20px;
        width: 710px; 
        height:500px; 
        /* background-color:chocolate; */
        margin-left: 20px;
        float:left;
        ">
            <div style="
                margin-top: 20px;
                width: 200px; 
                height:250px; 
                /* background-color:cadetblue; */
                margin-left: 20px;
                margin-bottom: 20px;
                float:left;
            ">
                <div style="
                    height: 45px;
                    font-size: 32px;
                    font-weight: 400;
                    font-family: 고딕;
                ">
                    판매가
                </div>
                <div style="
                    height: 45px;
                    font-size: 32px;
                    font-weight: 400;
                    font-family: 고딕;
                    margin-top: 45px;
                ">
                    배송료
                </div>
                <div style="
                    height: 45px;
                    font-size: 32px;
                    font-weight: 400;
                    font-family: 고딕;
                    margin-top: 45px;
                ">
                    예상 배송일
                </div>
            </div>
            <div style="
                margin-top: 20px;
                width: 455px; 
                height:250px; 
                /* background-color:darkgoldenrod; */
                margin-left: 20px;
                float:left;
            ">
                <div style="
                    height: 45px;
                    font-size: 38px;
                    font-weight: 900;
                    font-family: 고딕;
                " id="prise">
                    (가격)
                </div>
                <div style="
                    height: 45px;
                    font-size: 32px;
                    font-weight: 400;
                    font-family: 고딕;
                    margin-top: 45px;
                ">
                    On&On에선 단 1권도 무료
                </div>
                <div style="
                    height: 45px;
                    font-size: 32px;
                    font-weight: 400;
                    font-family: 고딕;
                    margin-top: 45px;
                ">
                    주문일에서 평균 2일 소요
                </div>
            </div>
            <div style="
                clear: both;
                width: 675px; 
                height:190px; 
                /* background-color:aquamarine; */
                margin-left: 20px;
            ">
                <hr>
                <div>
                    주문수량
                </div>

                <div style="
                    margin-top: 80px;
                ">
                    <div style="
                        float: right;
                        height: 50px;
                        width: 30%;
                        border-radius: 10px;
                        background-color:darkgrey;
                        text-align: center;
                        line-height : 50px;
                        font-size: 20px;
                        font-weight: 800;
                    ">
                        보관함 저장
                    </div>
                    <div style="
                        margin-right: 20px;
                        float: right;
                        height: 50px;
                        width: 30%;
                        border-radius: 10px;
                        background-color:lightpink;
                        text-align: center;
                        line-height : 50px;
                        font-size: 20px;
                        font-weight: 800;
                    ">
                        바로 구매
                    </div>
                    <div style="
                        margin-right: 20px;
                        float: right;
                        height: 50px;
                        width: 30%;
                        border-radius: 10px;
                        background-color: skyblue;
                        text-align: center;
                        line-height : 50px;
                        font-size: 20px;
                        font-weight: 800;
                    ">
                        장바구니 담기
                    </div>
                </div>


            </div>
        </div>
    </div>
    <div style="
        /* background-color: cadetblue; */
    ">
        <hr>
        <div style="height: 30px;"></div>
        <div style="
            width: 1160px; 
            /* background-color:aquamarine; */
            margin-left: 20px;
        ">
            <div style="
            width: 160px; 
            /* background-color:blue; */
            ">
                <div style="
                    font-size: 32px;
                    font-weight: 800;
                ">
                    기본정보
                </div>
            </div>
            
            <div style="
            margin-left: 250px;
            width: 890px; 
            /* background-color:blueviolet; */
            ">
                <div style="
                font-size: 28px;
                font-weight: 800;
                ">
                	(예시)준비중<br>
                    양장본 96쪽 226*266mm 685g ISBN:9791190779593<br>
                    <br>
                    주제 분류<br>
                    국내도서 > 어린이 > 과학/수학/컴퓨터>초등 수학<br>
                    국내도서 > 어린이 > 초등5~6학년 > 과학/수학/사회<br>
                </div>
            </div>
        </div>
    </div>

    <div style="height: 50px;"></div>

    <div id="footer">
        푸터
    </div>
</div>
<script type="text/javascript">
	setPage();
</script>
</body>
</html>