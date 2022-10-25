<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1고객문의(관리자)</title>
<link rel="stylesheet" href="/css/public.css">
<link rel="stylesheet" href="/css/ManageInquire.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>

<body>
	<div id="wrap">
		<%@ include file="Header.jsp"%>
		<h2 style="padding-bottom: 20px">[답변대기]1:1고객문의</h2>

		<form method="get">
			<table class="search" border="1">
				<tr>
					<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
						</select> <input type="text" name="searchWord" />
						<input type="submit" name="검색" value="검색" />
					</td>
				</tr>
			</table>
		</form>

		<table border="1" style="width: 1200px;" id="manageInquire">
			<tr>
				<th>번호</th>
				<th>ID(이메일)</th>
				<th>제목</th>
				<th>문의유형</th>
				<th>답변상태</th>
				<th>등록일</th>
				
				<th class="hidden">문의</th>
				<th class="hidden">답변</th>
			</tr>
			<c:forEach items="${ inquiryList }" var="inq" varStatus="status">
				<tr align="center" class="inquiryItem">
					<td class="inpuiry_id">${ inq.id }</td>
					<td>${ nameList[status.index] }</td>
					<td class="title"><span class="answer" onclick="windowPopup(this);">${ inq.title }</span></td>
					<td class="category">${ inq.categroy }</td>
					<td class="state">${ inq.state }</td>
					<td class="rigisterDate">${ inq.rigisterDate}</td>
					<td class="content hidden">${ inq.content }</td>
					<td class="reply hidden">${ inq.reply }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script>
	var windowPopup = function(e){
		
		var pIndex = $(e).closest('.inquiryItem').index();
				
		var w = 520;
		var h = 600;
		var xPos = (document.body.offsetWidth/2) - (w/2);
		xPos += window.screenLeft; // 듀얼 모니터일 때
		var yPos = (document.body.offsetHeight/2) - (h/2);
		
		var popup = window.open('/InquiryAnswer.html?inquiryIndex=' + pIndex, '답변', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width='+ w +',height='+ h +',left='+xPos+',top=' + yPos);
		
  		popup.addEventListener('unload', function() {
  			window.location.reload(true);
  			console.log("팝업창 닫음");
  			
  		});
	}
	
	function reloadDivArea() {
	    $('#manageInquire').load(location.href+' #manageInquire');
	}
	
	setInterval(function(){
		reloadDivArea() // this will run after every 5 seconds
	}, 5000);
	
	</script>
	
</body>

</html>