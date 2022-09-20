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
	
	#book_contents{
        max-width: 100%;
	}
    #book_contents td{
        padding: 10px;

    }
    .btnStyle{
        text-align: center;
        padding: 13px 0;
        display: inline-block;
        width: 250px; 
        height: 60px;
        border-radius: 10px;
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

    function clickBtn(btn){

        if(btn=="locker"){
            document.getElementById("sendForm").action = "./Locker.jsp";
        }else if(btn=="pay"){
            document.getElementById("sendForm").action = "./paymentPage.jsp";
        }else if(btn=="shopCart"){
            document.getElementById("sendForm").action = "./ShopCart.jsp";
        }
        document.getElementById("sendForm").submit();
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

    <div>
        <div style="
            width: 700px;
            font-size: 38px;
            font-weight: 700;
            font-family: 고딕;
        " >${ book.title }
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
    <div>
        <table id="book_contents" style="
            width: 100%;
           	font-weight: 600;
           	font-size: 24px;
        ">
            <tr style="
            	font-weight: 800;
            	font-size: 28px;
            ">
                <td rowspan="5">
                    <img style="
                        max-height: 500px;
                    " id="image">
                </td>
                <td>판매가</td>
                <td id="prise">(가격)</td>
            </tr>
            <tr>
                <td>배송료</td>
                <td>On&On에선 단 1권도 무료</td>
            </tr>
            <tr>
                <td>예상 배송일</td>
                <td>주문일에서 평균 2일 소요</td>
            </tr>
            <tr style="height: 150px;">
                <td colspan="2">
                    <form action="" method="get" id="sendForm">
                        선택 수량: <input type="number" style="
                        width: 60px; 
                        height: 38px; 
                        font-size: 24px;
                        " name="select" value="1" min="1"> 권<br>
                    </form>
                </td>
            </tr>
            <tr style="height: 120px;">
                <td colspan="2">
                    <span class="btnStyle" style="
                        background:skyblue;
                    " onclick="clickBtn('shopCart')" >장바구니 담기</span>
                    <span class="btnStyle" style="
                        background:darksalmon;
                    " onclick="clickBtn('pay')" >바로 구매</span>
                    <span class="btnStyle" style="
                        background:darkgray;
                    " onclick="clickBtn('locker')">보관함 저장</span>
                </td>
            </tr>
        </table>
    </div>
    
    <div >
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