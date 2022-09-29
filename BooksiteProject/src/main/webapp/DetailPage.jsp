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
        margin: auto;
        max-width: 1200px;
        min-width: 800px;
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
	
	#introduceTable tr,td{
		font-family:'Franklin Gothic Medium';
	}
	#introduceTable td{
		padding: 10px;
	}

	#introduceTable .headLine{
        vertical-align: top;
        font-size: 32px;
		width: 25%;
	}
	#introduceTable .introduceContents{
        font-size: 24px;
	}

    /* 임시 애니메이션 효과  */
    .box2{
        margin-top: 10px;
        margin-bottom: 10px;
        border-radius: 10px;
        border: 1px lightgray solid;
    }
    .animation_2{
        transition: all 0.2s linear;
    }
    .animation_2:hover{
        transform: scale( 1.1 ) skewY( -5deg );
        box-shadow: 0px 0px 5px 3px #91b5ea;
    }
    .animation_3{
        transition: all 0.1s linear;
    }
    .animation_3:hover{
        box-shadow: 0px 0px 10px 5px lightgrey inset;
        transform: scale( 1.03 );
    }
</style>
<script type="text/javascript">
	//타이틀 변경
	document.title = "${ receivedValue.title }";

    function clickBtn(btn){

        if(btn=="locker"){
            document.getElementById("sendForm").action = "./Locker.jsp";
        }else if(btn=="pay"){
            document.getElementById("sendForm").action = "/payment";
        }else if(btn=="shopCart"){
            document.getElementById("sendForm").action = "/cart?bookId=${receivedValue.bid}";
        }
        document.getElementById("sendForm").submit();
    }

</script>
<title>페이지 이동 중...</title>
</head>
<body>
<div id="wrap">
    <%@include file="./Header.jsp" %>
	<div id="contents">
        <div style="padding:10px">
            <div style="
                width: 700px;
                font-size: 38px;
                font-weight: 700;
                font-family: 고딕;
            " >${ receivedValue.title }
            </div>
            <div style="
                font-size: 15px;
                font-weight: 700;
                font-family: 고딕;
                color: grey;
            " id="ad">${ receivedValue.ad }
            </div>
            <div style="height:5px"></div>
            <div style="
                width: 200px;
            " id="author">${ receivedValue.author }</div>
	        <hr>
        </div>
    
        <div style="padding:10px">
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
                        <img class="animation_2 box2" src="${ receivedValue.image }" style="
                            max-height: 500px;
                        " id="image">
                    </td>
                    <td>판매가</td>
                    <td id="prise">${ bookPrice } 원</td>
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
                        	<!-- 선택한 책과 갯수를 다음 폼에 전송 -->
                            <input type="hidden" name="BID" value="${ receivedValue.bid }">
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
                        <span class="btnStyle animation_3" style="
                            background:skyblue;
                        " onclick="clickBtn('shopCart')" >장바구니 담기</span>
                        <span class="btnStyle animation_3" style="
                            background:darksalmon;
                        " onclick="clickBtn('pay')" >바로 구매</span>
                        <span class="btnStyle animation_3" style="
                            background:darkgray;
                        " onclick="clickBtn('locker')">보관함 저장</span>
                    </td>
                </tr>
            </table>
            <hr style="margin-top: 10px;">
        </div>
        
        <!-- 거리조절 -->
        <div style="height: 30px;"></div>
        
        <div style="padding:10px">
        	<table id="introduceTable" style="width: 100%;">
                <tr>
                    <td class="headLine">
                        책 소개
                    </td>
                    <td>
                        ${ receivedValue.introduce }
                    </td>
                </tr>
                <!-- 기본 정보 -->
                <tr>
                    <td rowspan="2" class="headLine">
                        기본정보
                    </td>
                    <td class="introduceContents">
                        (예시)준비중<br>
                        양장본 96쪽 226*266mm 685g ISBN:9791190779593
                    </td>
                </tr>
                <tr>
                    <td class="introduceContents">
                        주제 분류<br>
                        국내도서 > 어린이 > 과학/수학/컴퓨터>초등 수학<br>
                        국내도서 > 어린이 > 초등5~6학년 > 과학/수학/사회
                    </td>
                </tr>
            </table>
            <hr style="margin-top: 10px;">
        </div>
    </div> <!-- contents end -->
    <%@include file="./Footer.jsp" %>
</div>
</body>
</html>