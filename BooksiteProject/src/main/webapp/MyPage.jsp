<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/mypage.css">
<link rel="stylesheet" href="./css/public.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<h1>회원정보</h1>
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
				</div>
			</div>

			<!-- Tab Container 2 -->
			<input class="tab-radio" id="main-tab-2" name="main-group"
				type="radio" />
			<div class="tab-content">
				<div class="sub-tabs-container"></div>
				<input class="tab-radio" id="sub-tab2-1" name="sub-group2"
					type="radio" checked="checked">
				<div class="sub-tab-content">
					<h1>Sub-Tab 2</h1>
					<p>Sub-Tab content</p>
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
					<h1>Sub-Tab 3</h1>
					<p>Sub-Tab content</p>
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
					<h1>Sub-Tab 4</h1>
					<p>Sub-Tab content</p>
				</div>
			</div>
		</section>
		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>