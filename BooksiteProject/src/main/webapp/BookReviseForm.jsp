<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 수정</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
		box-sizing: border-box;
	}
	#wrap{
	}

	#webCrawlingDiv{
		width: 90%;
		background: darkgrey;
		padding: 10px;
		margin: 25px auto 25px auto;
	}

	#webCrawlingDiv input{
		width: 100%;
		min-height: 30px;
		padding: 3px;
	}
	
	#contents{
		max-width: 1000px;
		margin: auto;
	}
	
	#bookAddForm input{
		height:30px;
		width: 100%;
	}
	#bookAddForm textarea{
		height: 100px;
		width: 100%
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
			<%@include file="./bookForm.jsp" %>
		    <button type="button" onclick="return bookRevise()">책 수정</button>
		    <div style="height: 100px;"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var form = document.getElementById("bookAddForm");


	function bookRevise(){
		var title = form.title;
		var coverImgUrl = form.coverImgUrl;
		var author = form.author;
		var price = form.price;
		var introduce = form.introduce;
		var publisher = form.publisher;
		var publicationDate = form.publicationDate;
        
        if(title.value.trim() == ""){
            alert("제목을 입력해주세요.");
            title.focus();
            return false;
        }
		title.value = title.value.trim();
        
        if(coverImgUrl.value.trim() == ""){
            alert("이미지 경로를 입력해주세요.");
            form.coverImgUrl.focus();
            return false;
        }
        coverImgUrl.value = coverImgUrl.value.trim();

        if(author.value.trim() == ""){
            alert("작가를 입력해주세요.");
            form.author.focus();
            return false;
        }
		author.value = author.value.trim();

        
        if(price.value.trim() == ""){
            alert("가격을 입력해주세요.");
            form.price.focus();
            return false;
        }
		price.value = price.value.trim();


        if(introduce.value.trim() == ""){
            alert("소개글을 작성해주세요.");
            form.introduce.focus();
            return false;
        }
		introduce.value = introduce.value.trim();

        if(publisher.value.trim() == ""){
            alert("출판사를 입력해주세요.");
            form.publisher.focus();
            return false;
        }
        publisher.value = publisher.value.trim();

        if(publicationDate.value.trim() == ""){
            alert("출판일을 입력해주세요.");
            form.publicationDate.focus();
            return false;
        }
		publicationDate.value = publicationDate.value.trim();

        alert("전부 정상적으로 작성되었습니다.");

		form.action="/BookUpdate.do";
		form.submit();
    }
	
</script>
</html>