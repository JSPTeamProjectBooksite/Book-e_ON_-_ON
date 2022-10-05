<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 추가하기</title>
<style type="text/css">
	input{
		height:20px;
	}
</style>
</head>
<body>
    <div style="height: 100px;"></div>
	<form action="#">
        <table border="1">
            <tr>
                <th>도서명</th>
                <td>
                    <input type="text" name="booktitle" value="도서 이름" id="title">
                    <button type="button" onclick="makeFileName()">이미지 이름 생성</button>
                </td>
            </tr>
            <tr>
                <th>도서 이미지</th>
                <td><button type="button" onclick="">이미지 추가</button></td>
            </tr>
            <tr>
                <th>이미지 경로(이름)</th>
                <td>./source/book/<input type="text" name="bookCoverImg" id="image">.png</td>
            </tr>
            <tr>
                <th>작가</th>
                <td><input type="text" name="bookAuthor"></td>
            </tr>
            <tr>
                <th>번역가</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>가격</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>배송비</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>페이지 장수</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>무게</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>ISBN</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>카테고리</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>소개글</th>
                <td><input type="text" name="introduce"></td>
            </tr>
            <tr>
                <th>소개이미지추가</th>
                <td>이미지 이름 : <input type="text" name="introduceImage" id="introImage"></td>
            </tr>
            <tr>
                <th>소개이미지링크</th>
                <td>./source/book/<input type="text" name="introduceImageUrl" id="introImageUrl">.png</td>
            </tr>
            <tr>
                <th>출판사</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>출판사 리뷰</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>목차</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>출시일</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>수정일자</th>
                <td><input type="text" name="book"></td>
            </tr>
            <tr>
                <th>캐치프라이즈</th>
                <td><input type="text" name="book"></td>
            </tr>
        </table>
        <input type="submit" value="전송">
    </form>
</body>
<script type="text/javascript">
    function makeFileName(){
        var name = "" + document.getElementById("title").value;
        name = name.trim();

        alert(name);

        if(name.length > 0){
            document.getElementById("title").value = name;
            name = name.replace(/ /g, '_');
            document.getElementById("image").value = name;
            name = name + "_소개이미지";
            document.getElementById("introImageUrl").value = name;
            document.getElementById("introImage").value = name;
        }
    }

</script>
</html>