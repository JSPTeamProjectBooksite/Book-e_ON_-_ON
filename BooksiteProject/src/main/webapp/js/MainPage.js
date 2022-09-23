var index = 0;

var slideList = [//2,1,4,5,6,3
    0,0,0,0,0,0,0
];
// 이전 버튼을 눌렀을 때
function clickBefore(){
    index--;
    if(index < 0) index = "${bookList.length-1"};
    setList();
    vewListPage();
}
// 다음 버튼을 눌렀을 때
function clickNext(){
    index++;
    if(index == "${bookList.length}") index = 0;
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