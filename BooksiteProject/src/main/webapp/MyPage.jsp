<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="./css/public.css">
</head>
<body>
	<div id="wrap">
		<section>
			<div class="top-tabs-container">
				<label for="main-tab-1"> 내 정보 </label> <label for="main-tab-2">
					주문내역 </label> <label for="main-tab-3"> 1:1문의상담 </label> <label
					for="main-tab-4"> 고객센터 </label>
			</div>

			<!-- Tabs Container 1 -->
			<input class="tab-radio" id="main-tab-1" name="main-group"
				type="radio" checked="checked" />
			<div class="tab-content">
				<div class="sub-tabs-container"></div>
				<input class="tab-radio" id="sub-tab1-1" name="sub-group1"
					type="radio" checked="checked">
				<div class="sub-tab-content">
					<table border="1">
						<thead>
							<tr>
								<th>이름</th>
								<td>${ userInfo.name }</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${ userInfo.email }</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>${ userInfo.password }</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>${ userInfo.birth }</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>${ userInfo.gender }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${ userInfo.phoneNum }</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${ userInfo.address }</td>
							</tr>
							<tr>
								<th>포인트</th>
								<td>${ userInfo.point }</td>
							</tr>
						</thead>
					</table>
					<div class="Resign">
						<a class="button" href="./UserInfoUpdate.jsp">비밀번호 변경</a> <a
							class="button" onclick="resignBtn()"> 회원탈퇴 </a>
					</div>
				</div>
			</div>

			<!-- Tab Container 2 -->
			<input class="tab-radio" id="main-tab-2" name="main-group" type="radio" />
			<div class="tab-content">
				<div class="sub-tabs-container"></div>
				<input class="tab-radio" id="sub-tab2-1" name="sub-group2" type="radio" checked="checked">
				<div class="sub-tab-content">
					<iframe src="/payment/list" onload="onResize(this)" style="height: 1000px;" scrolling=”no” width="100%" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0></iframe>
				</div>
			</div>


			<!-- Tab Container 3 -->
			<input class="tab-radio" id="main-tab-3" name="main-group"
				type="radio" />
			<div class="tab-content">
				<div class="sub-tabs-container"></div>
				<input class="tab-radio" id="sub-tab3-1" name="sub-group3"
					type="radio" checked="checked">
				<div class="sub-tab-content">

					<iframe src="./UserInquiryWrite.jsp" width="100%" height="1230px"
						frameborder=0 framespacing=0 marginheight=0 marginwidth=0
						scrolling=yes vspace=0></iframe>

				</div>
			</div>


			<!-- Tabs Container 1 -->
			<input class="tab-radio" id="main-tab-4" name="main-group"
				type="radio" checked="checked" />
			<div class="tab-content">
				<div class="sub-tabs-container"></div>
				<input class="tab-radio" id="sub-tab4-1" name="sub-group4"
					type="radio" checked="checked">
				<div class="sub-tab-content">
					<iframe src="./ServicePage.jsp" width="100%" height="1230px"
						frameborder=0 framespacing=0 marginheight=0 marginwidth=0
						scrolling=yes vspace=0></iframe>

				</div>
			</div>
		</section>
		<%@ include file="Footer.jsp"%>
	</div>
</body>

<script type="text/javascript">
	function resignBtn() {
		if (confirm("고객의 모든 정보가 삭제됩니다.\n탈퇴하시겠습니까?")) {
			window.location.href = './resign';
			alert("회원이 탈퇴 되었습니다. 이용해 주셔서 감사합니다.");
		} else {
			alert("가지마!!!");
		}
	}

	function onResize(obj){
		var height = (obj).contentWindow.document.body.scrollHeight;
		(obj).height = height + 20;
	}

</script>
</html>