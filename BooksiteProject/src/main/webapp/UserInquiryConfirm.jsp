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
<!-- <link rel="stylesheet" href="css/public.css"> -->
<link rel="stylesheet" href="/css/customerinquiry.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css"
	rel="stylesheet">
</head>
<body>
	<div class="wrap">
		<%-- 		<%@ include file="Header.jsp"%> --%>

		<!-- 		<h2>▶1:1 고객문의</h2> -->
		<form name="inquireFrm" method="post" action="/UserInquiryWrite.do"
			onsubmit="return notice(this);">

			<table class="CustomerInquiry" border="1">

				<tr>
					<h2 align-items: "left" style="padding-left: 175px; padding-bottom: 16px;">나의
						1:1문의내역</h2>
					<td class="title">작성자</td>
					<td>${ userInfo.name }</td>
					<td class="title">ID(이메일)</td>
					<td>${ userInfo.email }</td>
				</tr>
				<tr>
					<td class="title">작성일자</td>
					<td>${ Inqinfo.rigisterDate}</td>
					<td class="title">연락처</td>
					<td>${ userInfo.phoneNum }</td>
				</tr>
				<tr>
					<td class="title">질문유형</td>
					<td colspan="3">${ Inqinfo.categroy }</td>
				</tr>

				<tr>
					<td class="title">제목</td>
					<td colspan="3">${ Inqinfo.title }
					<!-- <input style="border: none; width: 100%; height: 50px; font-size: 16px;"
						type="text" maxlength="500" name="title"> -->
				   	</td>
				</tr>

				<tr>
					<td class="title">문의내용</td>
					<td colspan="3"><textarea
							style="border: none; font-size: 14px;" name="content"
							placeholder="&#13;&#10;문의유형을 선택 후 자세하게 작성해주세요.
							&#13;&#10;자세한 내용과 함께 보내주시면 더욱 신속하게 답변 드리겠습니다!">${ Inqinfo.content }</span></textarea>
					</td>

				</tr>

				<tr>
					<!-- 	<td class="title" rowspan="2">내용</td> -->
					<td class="title" rowspan="2">답변내용</td>
					<td colspan="3"><textarea
							style="border: none; font-size: 14px;" name="content"
							placeholder="&#13;&#10;담당자 확인 후 3일 이내 답변 드립니다.
							&#13;&#10;답변내용은 마이페이지>1:1문의에서 확인 가능합니다.">${ Inqinfo.reply }</textarea>
					</td>

				</tr>

				<tr>
					<td colspan="4" ;class="notice"><small><br> *문의내용
							답변 안내*
							</p> <br>- 1:1 문의 건의 답변 내용은 홈페이지 상단 마이페이지 내 1:1문의에서 확인 가능합니다.
							</p> <br>- 1:1 문의 건 중 17시 이후 문의 건은 다음 운영시간(평일 09시~ 17시)에 순차적으로
							답변드립니다.
							</p> <br>- 상기 운영시간은 정상근무일 기준이며, 휴일인 경우 다음 정상 근무 일에 진행 됩니다.
							</p> <br>- 설/추석/공휴일 등 연휴 기간 동안 고객센터 휴무로 인해 1:1 상담 답변이 불가합니다.
							</p> <br>- 설/추석/공휴일 연휴 끝난 이후부터 순차적으로 답변드릴 예정이오니 양해 부탁드립니다.
							</p> </small></td>
				</tr>
			</table>
			<!-- <div class="bnt" style="padding-bottom: 120px;">
				<input type="submit" value="문의접수" id="submit">
			</div> -->
		</form>

		<%-- <%@ include file="Footer.jsp"%>  --%>

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
