<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록</title>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body{
        width: 1200px;
        margin: 0 auto;
    }

    #wrap{
        margin: 0 auto;
        width: 1200px;
        /* background-color: #FBCEB1; */
    }

    #header{
        height: 75px;
        background-color:tomato;
    }

    #container{
        position: relative;
        /* background-color: aquamarine; */
    }

    #list_contents{
        height: 550px;
        /* background-color: blueviolet; */
    }
    #footer{
        height: 200px;
        background-color: darkslategrey;
    }

    .slideBookStyle{
        float: left;
        width: 12%;
        height: 100%;
        display: flex;
        line-height : 300px;
    }

    .bookImageStyle{
        margin: auto;
        width: 90%;
    }

</style>
<!-- 
<script src="./js/bookList.js"></script>
 -->
<!-- 이미지 슬라이드 구현용 스크립트 -->
<script>

    var index = 0;
    
    var slideList = [//2,1,4,5,6,3
        0,0,0,0,0,0,0
    ];
    // 이전 버튼을 눌렀을 때
    function clickBefore(){
        index--;
        if(index < 0) index = ${bookList.length-1};
        setList();
        vewListPage();
    }
    // 다음 버튼을 눌렀을 때
    function clickNext(){
        index++;
        if(index == ${bookList.length}) index = 0;
        setList();
        vewListPage();
    }
    //해당 슬라이드가 클릭 되었을때
    function clickSlide(num){
        if(num == 3) return goToDetailPage(slideList[3]);

        if(num < 3){
            for(var i = 3; i > num; i--){
                clickBefore();
            }
        }else if(num > 3){
            for(var i = 3; i < num; i++){
                clickNext();
            }
        }
    }

    // 책 페이지 연결
    function goToDetailPage(BID){
        document.listPageForm.BID.value = BID;
        document.getElementById("BIDform").submit();
    }

    
    // 슬라이드에 이미지를 셋팅하는 메서드
    function setList(){
        for(var i = 0; i < slideList.length; i++){
            slideList[i] = ${bookList}[(i+index)%${bookList}.length].BID;
        }
    }
    
    // 슬라이드에 이미지를 불러오는 메서드
    function vewListPage(){
        for(var i = 0; i < slideList.length; i++){
            document.getElementById("index"+i).src = bookList[slideList[i]].image;
        }
        document.getElementById("ad").innerHTML = bookList[slideList[3]].ad;
    }
    
    
    // 인기순위
    // 인기순위에 책을 셋팅하는 메소드
    var popList = new Array(6);
    
    // 제목 파싱
    function getTitle(num){
        return popList[num];
    }
    function setPopularity(){
        var copyList = new Array(bookList.length);
        var num = 0;

        for(var i = 0; i < 6; i++){
            while(true){
                num = randomNum(bookList.length);   //0~8
                if(copyList[num] == "used") continue;

                popList[i] = num;

                document.getElementById("popularityBookImage_" + i).src = bookList[num].image;
                document.getElementById("popularityBookTitle_" + i).innerHTML = bookList[num].title;
                document.getElementById("popularityBookAuthor_" + i).innerHTML = bookList[num].author;
                copyList[num] = "used";
                break;
            }
        }
    }
    // 난수(랜덤)을 생성하는 메소드 (예: 6 = 0 ~ 5)
    function randomNum(num){
        return Math.floor(Math.random() * num);
    }

</script>
</head>
<body>
<script type="text/javascript">
	alert(${bookList}.length);
</script>

<!-- 메인 -->
<div id="wrap">
    <div id="header">여기는 해더</div>
    <!-- 공간 띄우기 -->
    <div style="height: 100px;"></div>

    <!-- 전송폼 -->
    <form action="./DetailPage.jsp" name="listPageForm" id="BIDform" method="get">
        <input type="hidden" name="BID" value="">
    </form>

    <!-- 슬라이드 광고 -->
    <div>
        <div style="
            height: 350px;
            border-radius: 25px;
            background-color:darkgrey;
        ">
            <div style="
                float: left;
                width: 5%;
                height: 100%;
                text-align: center;
                line-height : 350px;
            ">
                <input type="button" value="앞으로" onclick="clickBefore()">
            </div>
    
            <div class="slideBookStyle">
                <img class="bookImageStyle" id="index0" alt="" onclick="clickSlide(0)">
            </div>
            
            <div class="slideBookStyle">
                <img class="bookImageStyle" id="index1" alt="" onclick="clickSlide(1)">
            </div>
            
            <div class="slideBookStyle">
                <img class="bookImageStyle" id="index2" alt="" onclick="clickSlide(2)">
            </div>
    
            <div class="slideBookStyle" style="width: 18%;">
                <img class="bookImageStyle" id="index3" alt="" onclick="clickSlide(3)">
            </div>
            
            <div class="slideBookStyle">
                <img class="bookImageStyle" id="index4" alt="" onclick="clickSlide(4)">
            </div>
            
            <div class="slideBookStyle">
                <img class="bookImageStyle" id="index5" alt="" onclick="clickSlide(5)">
            </div>
            
            <div class="slideBookStyle">
                <img class="bookImageStyle" id="index6" alt="" onclick="clickSlide(6)">
            </div>
    
            <div style="
                float: left;
                width: 5%;
                height: 100%;
                text-align: center;
                line-height : 350px;
                /* background-color: aqua; */
            ">
                <input type="button" value="뒤로" onclick="clickNext()">
            </div>
        </div>
        <div style="
            height: 85px;
            /* background-color: aquamarine; */
            text-align: center;
        ">
            <div style="
                font-size: 24px;
                margin-top: 10px;
            " id="ad">
                (광고글)
            </div>
        </div>
        <!-- 슬라이드 이미지 셋팅 스크립트 -->
        <script>
            setList();
            vewListPage();
        </script>
    </div>


    <!-- 주제별 선정 -->
    <!-- 타입 1 -->
    <div style="
        height: 380px;
        /* background-color:khaki; */
    ">
        <div style="
            height: 75px;
            font-size: 32px;
            font-weight: 600;
            color: gray;
        ">
            인기 도서
        </div>
        <div style="
            text-align: center;
        ">
            <!-- 1번째(0) 인기도서 -->
            <div style="
                float: left;
                width: 200px;
            ">
                <img style="
                    height: 180px;
                " id="popularityBookImage_0" alt="" onclick="goToDetailPage(getTitle(0))">
                <div style="
                    margin: auto;
                    height: 50px;
                    width: 180px;
                    font-size: 14px;
                    font-weight: 600;
                " id="popularityBookTitle_0">
                    (책 제목)
                </div>
                <div style="
                    font-size: 12px;
                " id="popularityBookAuthor_0">
                    (지은이)
                </div>
            </div>

            <!-- 2번째(1) 인기도서 -->
            <div style="
                float: left;
                width: 200px;
            ">
                <img style="
                    height: 180px;
                " id="popularityBookImage_1" alt="" onclick="goToDetailPage(getTitle(1))">
                <div style="
                    margin: auto;
                    height: 50px;
                    width: 180px;
                    font-size: 14px;
                    font-weight: 600;
                " id="popularityBookTitle_1">
                    (책 제목)
                </div>
                <div style="
                    font-size: 12px;
                " id="popularityBookAuthor_1">
                    (지은이)
                </div>
            </div>

            <!-- 3번째(2) 인기도서 -->
            <div style="
                float: left;
                width: 200px;
            ">
                <img style="
                    height: 180px;
                " id="popularityBookImage_2" alt="" onclick="goToDetailPage(getTitle(2))">
                <div style="
                    margin: auto;
                    height: 50px;
                    width: 180px;
                    font-size: 14px;
                    font-weight: 600;
                " id="popularityBookTitle_2">
                    (책 제목)
                </div>
                <div style="
                    font-size: 12px;
                " id="popularityBookAuthor_2">
                    (지은이)
                </div>
            </div>

            <!-- 4번째(3) 인기도서 -->
            <div style="
                float: left;
                width: 200px;
            ">
                <img style="
                    height: 180px;
                " id="popularityBookImage_3" alt="" onclick="goToDetailPage(getTitle(3))">
                <div style="
                    margin: auto;
                    height: 50px;
                    width: 180px;
                    font-size: 14px;
                    font-weight: 600;
                " id="popularityBookTitle_3">
                    (책 제목)
                </div>
                <div style="
                    font-size: 12px;
                " id="popularityBookAuthor_3">
                    (지은이)
                </div>
            </div>

            <!-- 5번째(4) 인기도서 -->
            <div style="
                float: left;
                width: 200px;
            ">
                <img style="
                    height: 180px;
                " id="popularityBookImage_4" alt="" onclick="goToDetailPage(getTitle(4))">
                <div style="
                    margin: auto;
                    height: 50px;
                    width: 180px;
                    font-size: 14px;
                    font-weight: 600;
                " id="popularityBookTitle_4">
                    (책 제목)
                </div>
                <div style="
                    font-size: 12px;
                " id="popularityBookAuthor_4">
                    (지은이)
                </div>
            </div>

            <!-- 6번째(5) 인기도서 -->
            <div style="
                float: left;
                width: 200px;
            ">
                <img style="
                    height: 180px;
                " id="popularityBookImage_5" alt="" onclick="goToDetailPage(getTitle(5))">
                <div style="
                    margin: auto;
                    height: 50px;
                    width: 180px;
                    font-size: 14px;
                    font-weight: 600;
                " id="popularityBookTitle_5">
                    (책 제목)
                </div>
                <div style="
                    font-size: 12px;
                " id="popularityBookAuthor_5">
                    (지은이)
                </div>
            </div>

            <script>setPopularity();</script>
        </div>

    </div>

    <div id="footer">여기는 푸터</div>
</div>

</body>
</html>