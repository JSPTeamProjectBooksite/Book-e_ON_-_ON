<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="./css/mypage.css">
<link rel="stylesheet" href="./css/public.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" 교차 출처>
<link
	href="https: //fonts.googleapis.com/css2? family= Noto+Sans+KR & display=swap"
	rel="stylesheet">
<script>
	if('<%=(String) session.getAttribute("LoginName")%>
	' == 'null') {
		alert('로그인 정보가 없습니다. 메인페이지로 갑니다.');
		location.href = '/main';
	}
</script>
</head>
<body>
	<div id="wrap">
		<%@ include file="Header.jsp"%>
		<section>
			<div class="top-tabs-container">
				<label for="main-tab-1"> 내 정보 </label> <label for="main-tab-2">
					주문내역 </label> <label for="main-tab-3"> 1:1문의상담 </label> <label
					for="main-tab-4"> 1:1문의내역 </label> <label for="main-tab-5">
					고객센터 </label>
			</div>

			<!-- Tabs Container 1 -->
			<input class="tab-radio" id="main-tab-1" name="main-group"
				type="radio" checked="checked" />
			<div class="tab-content">
				<div class="sub-tabs-container"></div>
				<input class="tab-radio" id="sub-tab1-1" name="sub-group1"
					type="radio" checked="checked">
				<div class="sub-tab-content">
					<iframe src="/userInfo" onload="onResize(this)"
						style="height: 1200px;" scrolling=”no” width="100%" frameborder=0
						framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0></iframe>
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
					<iframe src="/payment/list" onload="onResize(this)"
						style="height: 1200px;" scrolling=”no” width="100%" frameborder=0
						framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0></iframe>
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
					<iframe src="/customerinquiry" width="100%" height="1180px"
						frameborder=0 framespacing=0 marginheight=0 marginwidth=0
						scrolling=yes vspace=0></iframe>
				</div>
			</div>

			<!-- Tabs Container 4 -->
			<input class="tab-radio" id="main-tab-4" name="main-group"
				type="radio" />
			<div class="tab-content">
				<div class="sub-tabs-container"></div>
				<input class="tab-radio" id="sub-tab4-1" name="sub-group4"
					type="radio" checked="checked">
				<div class="sub-tab-content">
					<iframe src="/customerinquiry/list" width="100%" height="1230px"
						frameborder=0 framespacing=0 marginheight=0 marginwidth=0
						scrolling=yes vspace=0></iframe>
				</div>
			</div>

			<!-- Tabs Container 5 -->
			<input class="tab-radio" id="main-tab-5" name="main-group"
				type="radio" />
			<div class="tab-content">
				<div class="sub-tabs-container"></div>
				<input class="tab-radio" id="sub-tab5-1" name="sub-group5"
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
	function onResize(obj) {
		var height = (obj).contentWindow.document.body.scrollHeight;
		(obj).height = height + 20;
	}
</script>
</html>
