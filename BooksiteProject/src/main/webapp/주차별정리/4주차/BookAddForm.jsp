<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
		box-sizing: border-box;
	}
	#wrap{
	}
	
	#contents{
		max-width: 1000px;
		margin: auto;
	}
	
	input{
		height:28px;
	}
	#bookAddFormTable{
		width: 90%;
		min-width:600px;
		margin: auto;
	}
	#bookAddFormTable td{
		padding: 5px 10px 5px 5px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="contents">
		    <div style="height: 100px;"></div>
			<form action="/BookUploadProcess" method="post" id="bookAddForm" enctype="multipart/form-data" onsubmit="return checkForm(this);">
				<h1 style="text-align: center;">도서 정보</h1>
		        <table border="1" id="bookAddFormTable">
		            <tr>
		                <th>*도서명</th>
		                <td>
		                    <input type="text" name="title" value="도서 이름">
		                    <button type="button" onclick="makeFileName()">이미지 이름 생성</button>
		                </td>
		            </tr>
		            <tr>
		                <th>*도서 이미지</th>
		                <td>
		                	<input type="file" name="coverImg" accept=".png">
		                </td>
		            </tr>
		            <tr>
		                <th>*이미지 경로(이름)</th>
		                <td>./source/book/ <input type="text" name="imageFileName"> .png</td>
		            </tr>
		            <tr>
		                <th>*작가</th>
		                <td>
		                	<input type="text" name="author" value="1">
		                	<button type="button">작가 조회</button>
		                </td>
		            </tr>
		            <tr>
		                <th>번역가</th>
		                <td><input type="text" name="translator"></td>
		            </tr>
		            <tr>
		                <th>*가격</th>
		                <td><input type="text" name="price"></td>
		            </tr>
		            <tr>
		                <th>배송비</th>
		                <td><input type="text" name="deliveryFee" value="2500"></td>
		            </tr>
		            <tr>
		                <th>페이지 장수</th>
		                <td><input type="text" name="totalPages"></td>
		            </tr>
		            <tr>
		                <th>무게</th>
		                <td><input type="text" name="weight"></td>
		            </tr>
		            <tr>
		                <th>ISBN</th>
		                <td>
		                	<input type="text" name="isbn13">
		                	<input type="text" name="isbn10">
		                </td>
		            </tr>
		            <tr>
		                <th>카테고리</th>
		                <td>
		                	<input type="text" name="categoryId">
		                	<button type="button">카테고리 조회</button>
		                </td>
		            </tr>
		            <tr>
		                <th>*소개글</th>
		                <td><textarea name="introduce" cols="50" rows="10">&lt;p&gt;&lt;h3&gt;&lt;/h3&gt;&lt;/p&gt;&lt;br&gt;</textarea></td>
		            </tr>
		            <tr>
		                <th>소개이미지추가</th>
		                <td>이미지 이름 : <input type="text" name="introduceImage"></td>
		            </tr>
		            <tr>
		                <th>소개이미지링크</th>
		                <td>./source/book/<input type="text" name="introduceImageUrl">.png</td>
		            </tr>
		            <tr>
		                <th>*출판사</th>
		                <td><input type="text" name="publisher"></td>
		            </tr>
		            <tr>
		                <th>출판사 리뷰</th>
		                <td><textarea name="publisherReview" cols="50" rows="10"></textarea></td>
		            </tr>
		            <tr>
		                <th>목차</th>
		                <td><textarea name="contents" cols="50" rows="10"></textarea></td>
		            </tr>
		            <tr>
		                <th>*출시일</th>
		                <td><input type="date" name="publicationDate"></td>
		            </tr>
		            <tr>
		                <th>*캐치프라이즈</th>
		                <td><input type="text" name="catchphrase" style="width: 100%;" value="&lt;br&gt;&lt;b&gt;  &lt;b&gt;"></td>
		            </tr>
		        </table>
		        <input type="submit" value="전송">
		    </form>
		    <div style="height: 100px;"></div>
		</div>
	</div>
</body>
<script type="text/javascript">

	//파일명 자동 완성기능
    function makeFileName(){
		var form = document.getElementById("bookAddForm");
        var name = "" + form.title.value;
        name = name.trim();

        alert("'" + name + "' 으로 파일명을 생성합니다.");

        if(name.length > 0){
        	form.title.value = name;
            name = name.replace(/ /g, '_');
            form.imageFileName.value = name;
            name = name + "_소개이미지";
            form.introduceImage.value = name;
            form.introduceImageUrl.value = name;
        }
    }
	
	//
	function checkForm(form){
        
        if(form.title.value.trim() == ""){
            alert("제목을 입력해주세요.");
            form.title.focus();
            return false;
        }
        
        if(!form.coverImg.value){
            alert("이미지를 선택해주세요.");
            form.coverImg.focus();
            return false;
        }
        
        if(form.author.value.trim() == ""){
            alert("작가를 입력해주세요.");
            form.author.focus();
            return false;
        }
        
        if(form.price.value.trim() == ""){
            alert("가격을 입력해주세요.");
            form.price.focus();
            return false;
        }
        
        if(form.introduce.value.trim() == ""){
            alert("소개글을 작성해주세요.");
            form.title.focus();
            return false;
        }
        
        if(form.catchphrase.value.trim() == ""){
            alert("광고문구를 작성해주세요.");
            form.catchphrase.focus();
            return false;
        }
        
        if(form.publisher.value.trim() == ""){
            alert("출판사를 입력해주세요.");
            form.publisher.focus();
            return false;
        }
        
        if(form.publicationDate.value.trim() == ""){
            alert("출판일을 입력해주세요.");
            form.publicationDate.focus();
            return false;
        }
    }
	
</script>
</html>