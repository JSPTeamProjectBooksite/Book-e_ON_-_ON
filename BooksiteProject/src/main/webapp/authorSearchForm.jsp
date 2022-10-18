<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 검색</title>
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
		width: 100%;
	}
	#authorSearchForm textarea{
		height: 100px;
		width: 100%
	}
	
	#authorFormTable{
		width: 90%;
		min-width:450px;
		margin: auto;
	}
	#authorFormTable td{
		padding: 5px 10px 5px 5px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div id="contents">
		    <div style="height: 100px;"></div>
			<form action="/authorSearch?do=searchAuthorName" method="post" id="authorSearchForm" onsubmit="return checkForm(this);">
				<h1 style="text-align: center;">작가 검색</h1>
		        <table border="1" id="authorFormTable">
		            <tr>
		                <td>
							작가명 : 
		                	<input type="text" name="authorName" value="" style="width: auto;">
							<button type="submit">검색</button>
							<button type="button" onclick="window.open('/authorSearch?do=authorForm', '', 'width=700, height=800'); return false;">추가</button>
							<button type="button" onclick="window.open('./authorForm.jsp', '', 'width=700, height=800'); return false;">수정</button>
							<button type="button" onclick="return selectAuthor();">선택</button>
		                </td>
		            </tr>
		            <tr>
		                <td>
							<table>
								<c:forEach var="author" items="${authorList}">
									<tr>
										<td>
											<input type="radio" value="${ author.id }" name="selectID">
										</td>
										<td>${ author.name }</td>
										<td>${ author.nationality }</td>
										<td>${ author.birth } ~ ${ author.death }</td>
									</tr>
									<tr>
										<td colspan="4">${ author.profileImg }</td>
									</tr>
									<tr>
										<td colspan="4">${ author.profileContents }</td>
									</tr>
								</c:forEach>
							</table>
						</td>
		            </tr>
		        </table>
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
		var name = form.authorName;
        
        if(name.value.trim() == ""){
            alert("작가님 이름을 입력해주세요.");
            name.focus();
            return false;
        }
        name.value = name.value.trim();
        
		alert("'" + name.value + "'님을 검색합니다.");
    }

	function findAuthor(){
		var form = document.getElementById("authorSearchForm");
		
		if(!checkForm(form)) return false;
		
		form.action = '/authorSearch?do=searchAuthorName';
		
		alert("'" + form.action + "'로전송.");
		alert("'" + form.authorName.value + "'님을 검색합니다.");
		
		form.submit();
	}
	
	function selectAuthor(){
		var radio = document.getElementById("authorSearchForm").selectID;
		
		if(radio.value.length == 0 ){
			alert("선택된 아이디 없음");
			return false;
		}
		
		alert("' " + radio.value + " 'id 선택됨");

		opener.document.getElementById("bookAddForm").author.value = radio.value;

		window.open("about:blank", "_self").close();
	}

</script>
</html>