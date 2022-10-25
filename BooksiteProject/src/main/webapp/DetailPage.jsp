<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/public.css">
<link rel="stylesheet" href="./css/Detail.css">
<title>페이지 이동 중...</title>
</head>
<body>
<div id="wrap">
    <%@include file="./Header.jsp" %>
	<div id="contents">
        <div style="padding:10px">
            <div style="color:red; width: 700px; font-size: 38px; font-weight: 700;" id="titleState"></div>
            <div style="
                font-size: 38px;
                font-weight: 700;
                font-family: 고딕;
            " >${ bookInfo.title }
            </div>
            <div style="
                font-size: 15px;
                font-weight: 700;
                font-family: 고딕;
                color: grey;
            " id="ad">
            ${ bookInfo.catchphrase }
            </div>
            <div style="height:5px"></div>
            <div id="author">${ author.name }</div>
	        <hr>
        </div>
    
        <div style="padding:10px">
            <table id="book_contents" style="
                width: 100%;
                   font-weight: 600;
                   font-size: 22px;
            ">
                <tr style="
                    font-weight: 800;
                    font-size: 24px;
                ">
                    <td rowspan="5" style="width: 10%;">
                        <img class="animation_2 box2" src="${ bookInfo.coverImg }" style="
                            max-height: 500px;
                        " id="image">
                    </td>
                    <td>
                        <div class="tableMenu">
                            <div>판매가</div>
                            <div><span id="price">0</span> 원</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="tableMenu">
                            <div>배송료</div>
                            <div>On&On에선 단 1권도 무료</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="tableMenu">
                            <div>예상 배송일</div>
                            <div>주문일에서 평균 2일 소요</div>
                        </div>
                    </td>
                </tr>
                <!-- <tr style="height: 150px;">
                    <td>
                        <form action="" method="get" id="sendForm">
                            <input type="hidden" name="selectedBooks" value="${ bookInfo.id }">
                            선택 수량: <input type="number" style="
                            width: 60px; 
                            height: 38px; 
                            font-size: 24px;
                            " name="bookCount" value="1" min="1"> 권<br>
                        </form>
                    </td>
                </tr> -->
                <tr style="height: 250px;">
                    <td>
                        <div style="
                            display: grid;
                            grid-template-columns: 1fr 1fr 1fr;
                            align-items: center;
                            gap: 5px;
                        ">
                            <!-- <div class="btnStyle animation_3" style="
                                background:darkgray;
                            " onclick="clickBtn('locker')">보관함</div> -->
                            <div>
                                <form action="" method="get" id="sendForm" target="_self">
                                    <!-- 선택한 책과 갯수를 다음 폼에 전송 -->
                                    <input type="hidden" name="selectedBooks" value="${ bookInfo.id }">
                                    선택 수량:
                                    <input type="number" style="
                                        width: 60px;
                                        height: 38px; 
                                        font-size: 24px;
                                        text-align: right;
                                        " name="bookCount" value="1" min="1" max="999">
                                    권
                                </form>
                            </div>
                            <div class="btnStyle animation_3" style=" background:skyblue;" onclick="clickBtn('shopCart')" >장바구니</div>
                            <div class="btnStyle animation_3" style=" background:steelblue;" onclick="clickBtn('pay')" >바로구매</div>
                        </div>
                    </td>
                </tr>
            </table>
            <hr style="margin-top: 10px;">
        </div>
        
        <!-- 거리조절 -->
        <div style="height: 30px;"></div>
        
        <!-- 상품 정보 -->
        <div>
            <!-- 소개 이미지 -->
            <div id="introduceImgBox">
                <img src="${ bookInfo.introduceImg }" alt="">
            </div>

            <!-- 책 소개 -->
            <div id="introduceBox" style="max-width:800px">
                <div class="headFont">
                    책 소개
                </div>
                <div class="contentsFont">
                    ${ bookInfo.introduce }
                </div>
            </div>

            <!-- 작가 정보 -->
            <div class="headFont">
                작가 소개
            </div>
            <div id="authorInfo">
                <table id="authorInfoTable">
                	<tr style="height: 30px;">
                		<td rowspan="2" class="imgBox" style="width: 200px;">
                			<img alt="" src="${ author.profileImg }" style="width: 100%;">
                		</td>
                		<td>
                			<span class="headBox">${ author.name }</span>
                			<span class="subBox">${ author.nationality }</span>
                		</td>
                	</tr>
                	<tr>
                		<td class="contentsBox contentsFont">
                			${ author.profileContents }
                		</td>
                	</tr>
                </table>
            </div>
            <!-- 목차 -->
            <div>
                <div class="headFont">
                    목차
                </div>
                <div class="contentsFont" style="max-width:800px">
                    ${ bookInfo.contents }
                </div>
            </div>
            <!-- 출판사 리뷰 -->
            <div>
                <div class="headFont">
                    출판사 리뷰
                </div>
                <div class="contentsFont" style="max-width:800px">
                    ${ bookInfo.publisherReview }
                </div>
            </div>
            <!-- 기본 정보 -->
            <div id="basicInfo">
                <div class="headFont">
                    기본정보
                </div>

                <hr>
                <table id="basicInfoTable">
                    <tr>
                        <th>ISBN</th>
                        <td>${ bookInfo.isbn13 } ( ${ bookInfo.isbn10 } )</td>
                    </tr>
                    <tr>
                        <th>쪽수</th>
                        <td>${ bookInfo.totalPages } p</td>
                    </tr>
                    <tr>
                        <th>제원</th>
                        <td>무개 : ${ bookInfo.weight } g</td>
                    </tr>
                </table>
                <hr style="background-color: lightgray;">
            </div>

        </div>
        
        <!-- 리뷰 -->
        <div id="reveiw">
            <div id="reveiwRead">
                <div class="headFont">
                    리뷰
                </div>
                <hr style="background-color: gray;">
				<c:forEach var="review" items="${ reviewList }" varStatus="status">
					<div class="reveiwDiv">
					    <!-- 작성자 정보 + 별점 -->
						<div>
						    <span class="name">
						        ${ review.member.name } 
							</span>
							<span class="email">
						        ${ review.member.email } 
							</span>
							<span class="date">
							    ${fn:replace(review.review.registerDate, 'T', ' ')}
							</span>
							<span class="score">
                                <img src="./source/Detail/starscore/${ review.review.score }score.png" alt="" style="width:100px">
						    </span>
						</div>
						<!-- 리뷰 -->
						<div class="comment">
						    ${ review.review.content }
						</div>
						<!-- 버튼류 -->
						<div class="btnSpace">
                            <!-- 좋아요 버튼 -->
                            <form action="/like.do?whatReviewLike=" method="post" id="likeForm" target="param"></form>
							<span class="likeBtn">
								${ review.review.likeCount }
								<button type="button" onclick="likey(${ review.review.id })">
                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="32px" height="32px" viewBox="0 0 32 32" style="enable-background:new 0 0 32 32;" xml:space="preserve">
                                        <g>
                                            <g>
                                                <path d="M14.708,15.847C14.252,14.864,14,13.742,14,12.5s0.252-2.489,0.708-3.659c0.455-1.171,1.114-2.266,1.929-3.205
                                                    c0.814-0.938,1.784-1.723,2.86-2.271C20.574,2.814,21.758,2.5,23,2.5s2.426,0.252,3.503,0.707c1.077,0.456,2.046,1.115,2.86,1.929
                                                    c0.813,0.814,1.474,1.784,1.929,2.861C31.749,9.073,32,10.258,32,11.5s-0.252,2.427-0.708,3.503
                                                    c-0.455,1.077-1.114,2.047-1.929,2.861C28.55,18.678,17.077,29.044,16,29.5l0,0l0,0C14.923,29.044,3.45,18.678,2.636,17.864
                                                    c-0.814-0.814-1.473-1.784-1.929-2.861C0.252,13.927,0,12.742,0,11.5s0.252-2.427,0.707-3.503C1.163,6.92,1.821,5.95,2.636,5.136
                                                    C3.45,4.322,4.42,3.663,5.497,3.207C6.573,2.752,7.757,2.5,9,2.5s2.427,0.314,3.503,0.863c1.077,0.55,2.046,1.334,2.861,2.272
                                                    c0.814,0.939,1.473,2.034,1.929,3.205C17.748,10.011,18,11.258,18,12.5s-0.252,2.364-0.707,3.347
                                                    c-0.456,0.983-1.113,1.828-1.929,2.518"/>
                                            </g>
                                        </g>
                                    </svg>
                                </button>
							</span>
						</div>
					</div>
					<hr style="background-color: lightgray;">
				</c:forEach>
            </div>
			<!-- 리뷰 작성 폼 -->
            <form action="/reveiw.do?bookID=${ bookInfo.id }" method="post" id="reveiwWriteForm" onsubmit="return reveiwBtnAction(this);" target="param">
                <div id="starScoreDiv">
                    <span>
                        <img src="./source/Detail/starscore/10score.png" alt="" style="width:150px" id="starScoreImg"><br>
                        <input type="range" name="score" class="rangeInput" min="1" max="10" value="10" oninput="starscore(this.value)"><br>
                    </span>
                </div>
                <div id="reveiwWrite">
                    <div>
                        <textarea name="reveiwBox" id="reveiwBox" placeholder="리뷰를 입력해 주세요."></textarea>
                    </div>
                    <div>
                        <button type="submit" id="reveiwBtn">리뷰<br>작성</button>
                    </div>
                </div>
            </form>
        </div>
        <iframe src="" name="param" style="display: none;"></iframe>

        <!-- 환불 -->
        <div>
            <div id="exchange">
                <div class="headFont">
                    교환/반품/품절 안내 <span style="font-size: 15px; color:lightgray">안돼</span>
                </div>
                <hr>

                <div class="exchangeInfo">
                    <div class="indexFont">
                        반품/교환방법
                    </div>
                    <div class="textFont">
                        마이룸 > 주문관리 > 주문/배송내역 > 주문조회 > 반품/교환 신청, [1:1 상담 > 반품/교환/환불] 또는 고객센터 (1234-0000)<br>
                        * 오픈마켓, 해외배송 주문, 기프트 주문시 [1:1 상담>반품/교환/환불] 또는 고객센터 (1234-0000)
                    </div>
                </div>
                <hr style="background-color: lightgray;">

                <div class="exchangeInfo">
                    <div class="indexFont">
                        반품/교환가능 기간
                    </div>
                    <div class="textFont">
                        변심반품의 경우 수령 후 7일 이내,<br>
                        상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내
                    </div>
                </div>
                <hr style="background-color: lightgray;">

                <div class="exchangeInfo">
                    <div class="indexFont">
                        반품/교환비용
                    </div>
                    <div class="textFont">
                        변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담
                    </div>
                </div>
                <hr style="background-color: lightgray;">

                <div class="exchangeInfo">
                    <div class="indexFont">
                        반품/교환 불가 사유
                    </div>
                    <div class="textFont">
                        1) 소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br>
                        (단지 확인을 위한 포장 훼손은 제외)<br>
                        2) 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br>
                        예) 화장품, 식품, 가전제품(악세서리 포함) 등<br>
                        3) 복제가 가능한 상품 등의 포장을 훼손한 경우<br>
                        예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집<br>
                        4) 소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)<br>
                        5) 디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우<br>
                        6) 시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우<br>
                        7) 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우
                    </div>
                </div>
                <hr style="background-color: lightgray;">

                <div class="exchangeInfo">
                    <div class="indexFont">
                        상품 품절
                    </div>
                    <div class="textFont">
                        공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는 이메일과 문자로 안내드리겠습니다.
                    </div>
                </div>
                <hr style="background-color: lightgray;">

                <div class="exchangeInfo">
                    <div class="indexFont">
                        소비자 피해보상 환불 지연에 따른 배상
                    </div>
                    <div class="textFont">
                        1) 상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁 해결 기준 (공정거래위원회 고시)에 준하여 처리됨<br>
                        2) 대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 처리함
                    </div>
                </div>
                
                <div class="exchangeLast">
                    상품 설명에 반품/교환 관련한 안내가 있는 경우 그 내용을 우선으로 합니다. (업체 사정에 따라 달라질 수 있습니다.)
                </div>
            </div>

        </div>

        <!-- 띄우기 -->
        <div style="height:100px"></div>
    </div> <!-- contents end -->
    <%@include file="./Footer.jsp" %>
</div>
<!-- 팝업창 -->
<div id="popup">
    <div id="popupBox">
        <div style="height: 50px;"></div>
        <h2 style="text-align: center;">장바구니에 담겼습니다.</h2>
        <div style="height: 70px;"></div>
        <div style="text-align: center;">
            <button type="button" onclick="location.href='/cart/list'">장바구니가기</button>
            <button type="button" onclick="hidePopup()">닫기</button>
        </div>
    </div>
</div>
<!-- 로그인 페이지 이동 기능을 구현하기 위한 히든폼 -->
<form action="/login" method="post" name="login">
    <input type="hidden" name="bntclick" value="1">
</form>
<!-- 페이지 이동을 막기 위한 iframe -->
<iframe src="" name="param" style="display: none;"></iframe>
</body>
<script>
    var userId = '<%= (Long)session.getAttribute("LoginID") %>';
    var userName = '<%= (String)session.getAttribute("LoginName") %>';
    
    var quantity = ${ bookInfo.quantity }*1;

    var price = ${ bookInfo.price }*1;

    if(quantity < 0){
        alert("본 도서는 삭제 되었습니다.")
        history.back();
    }

    document.getElementById("sendForm").bookCount.onblur = function(){
        if(document.getElementById("sendForm").bookCount.value > quantity){
            alert("현제 ("+quantity+")권의 재고가 있습니다.");
            document.getElementById("sendForm").bookCount.value = quantity;
        }
        else if(document.getElementById("sendForm").bookCount.value < 1){
            alert("최소 1권 단위로 구매할 수 있습니다.");
            document.getElementById("sendForm").bookCount.value = 1;
        }
    }
    
    function reveiwBtnAction(form){
        if(userId == "null"){
            alert("리뷰작성은 로그인 후에 가능합니다.");
            return false;
        }

        if(form.reveiwBox.value.trim() == ""){
            alert("내용을 입력해주세요.");
            form.reveiwBox.focus();
            return false;
        }
        alert("리뷰를 작성했습니다.");

        form.submit();
    }

    function likey(reviewID) {
        if(userId == "null"){
            alert("좋아요버튼은 로그인 후에 누를 수 있습니다.");
            return false;
        }
        alert("이 리뷰를 좋아합니다.");

        const form = document.getElementById("likeForm");

        form.action += reviewID;
        form.submit();
	}

    function starscore(val){
        document.getElementById("starScoreImg").src = "./source/Detail/starscore/"+ val +"score.png"
    }

    //타이틀 변경
	document.title = "${ bookInfo.title }";
    
    function showPopup(){
        document.getElementById("popup").style.display = 'block';
    }
    function hidePopup(){
        document.getElementById("popup").style.display = 'none';
    }

    function clickBtn(btn){

        if(quantity < 1){
            alert("재고가 없습니다.\n이 책은 구매할 수 없습니다.");
            return;
        }

        // if(btn=="locker"){ // 보관함 기능 삭제
        //     document.getElementById("sendForm").action = "./Locker.jsp";
        // }else 
        if(btn=="pay"){
            //로그인 기록이 없을경우(로그인이 되어있지 않을때)
            if(userName == "null"){
                alert("로그인 후 이용할 수 있는 서비스입니다.\n로그인 페이지로 이동합니다.");
                document.login.submit();
                return;
            }
            document.getElementById("sendForm").action = "/payment";
            document.getElementById("sendForm").target = "_self";
	        document.getElementById("sendForm").submit();
        }else if(btn=="shopCart"){
            document.getElementById("sendForm").action = "/cart";
            document.getElementById("sendForm").target = "param";
	        document.getElementById("sendForm").submit();
            showPopup();
        }
    }

    document.querySelector('.rangeInput').addEventListener('input',function(event){
        var gradient_value = 100 / event.target.attributes.max.value;
        event.target.style.background = 'linear-gradient(to right, #83f7ff 0%, #83f7ff '+gradient_value * event.target.value +'%, rgb(236, 236, 236) ' +gradient_value *  event.target.value + '%, rgb(236, 236, 236) 100%)';
    });

    //자바스크립트로 셋팅하는 부분
    function setPage(){
        document.getElementById("price").innerHTML = price.toLocaleString('ko-KR');
        
        if(quantity > 0){
        	document.getElementById("sendForm").bookCount.max = quantity;
        }else{
        	document.getElementById("sendForm").bookCount.value = 0;
        	document.getElementById("sendForm").bookCount.disabled = true;
        	document.getElementById("titleState").innerHTML = '[ 구매불가 ]';
        }
    }

    setPage();

    //로그인 확인
    // alert(userId);
    // alert(userName);
</script>
</html>