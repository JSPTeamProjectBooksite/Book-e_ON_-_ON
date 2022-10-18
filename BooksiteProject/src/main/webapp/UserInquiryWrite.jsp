<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>1:1 고객문의</title>
<link rel="stylesheet" href="/css/customerinquiry.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="Header.jsp"%>

		<h2>▶1:1 고객문의</h2>
		<form name="inquireFrm" method="post" action="/inquiryWrite.do"
			onsubmit="return notice(this);">

			<table class="CustomerInquiry" border="1">

				<tr>
					<td class="title">작성자</td>
					<td>${ cusinfo.name }</td>
					<td class="title">ID(이메일)</td>
					<td>${ cusinfo.email }</td>
				</tr>
				<tr>
					<td class="title">작성일자</td>
					<td><%=sf.format(nowTime)%></td>
					<td class="title">연락처</td>
					<td>${ cusinfo.phoneNum }</td>
				</tr>
				<tr>
					<td class="title">질문유형</td>
					<td colspan="3"><select style="height: 63px; width: 100%;"
						name="category">
							<option>회원정보/서비스</option>
							<option>도서/상품정보</option>
							<option>주문결제</option>
							<option>배송수령</option>
							<option>반품교환</option>
							<option>웹사이트 이용관련</option>
							<option>검색기능 관련</option>
							<option>eBook상품 오류신고</option>
							<option>시스템 불편사항</option>
							<option>개인정보침해신고</option>
							<option>고객제안/불편신고</option>
							<option>개인출판/작가</option>
							<option>기타문의/제안</option>
					</select></td>
				</tr>

				<tr>
					<td class="title">제목</td>
					<td colspan="3">
						<input style="border: none; width: 100%; height: 63px; font-size: 16px;"
							type="text" maxlength="500" name="title">
					</td>
				</tr>

					<tr>
						<td class="title" rowspan="2">내용</td>
						<td colspan="3">
						<textarea style="border: none; font-size: 14px;" name="content"
								placeholder="&#13;&#10;문의유형을 선택 후 자세하게 작성해주세요.
							&#13;&#10;자세한 내용과 함께 보내주시면 더욱 신속하게 답변 드리겠습니다!"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3" ;class="notice"><small> *문의내용 답변 안내*
							<p>- 1:1 문의 건의 답변 내용은 홈페이지 상단 마이페이지 내 1:1문의에서 확인 가능합니다.</p>
							<p>- 1:1 문의 건 중 17시 이후 문의 건과 공휴일 1:1 상담문의는 다음 운영시간(평일 09시~ 17시)에 순차적으로 답변드립니다.</p>
							<p>- 상기 운영시간은 정상근무일 기준이며, 통지 예정일이 주만, 휴일인 경우 다음 정상 근무 일에 진행 됩니다.</p>
							<p>- 설/추석/공휴일 등 연휴 기간 동안 고객센터 휴무로 인해 1:1 상담 답변이 불가합니다.</p>
							<p>- 설/추석/공휴일 연휴 끝난 이후부터 순차적으로 답변드릴 예정이오니 양해 부탁드립니다.</p>
					</small></td>
				</tr>
			</table>
			<div class="bnt">
				<input type="submit" value="문의접수" id="submit">
			</div>
		</form>

<%@ include file="Footer.jsp"%> 

	</div>
</body>
<script type="text/javascript">
	function notice(form) {
		if (form.title.value == "") {
			alert("제목을 입력해주세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력해주세요.");
			form.content.focus();
			return false;
		}
		alert("문의를 전송합니다.");
	}
</script>
</html>
