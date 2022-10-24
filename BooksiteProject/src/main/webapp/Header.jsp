<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Long userID = (Long)session.getAttribute("LoginID"); // 세션에서 아이디르 받아 LoginID에 저장합니다.
String userName = (String)session.getAttribute("LoginName");
boolean login = (userID == null) ? false : true; //로그인 되었는지 안되었는지 여부를 login에 불린으로 저장합니다.

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	header{
		/* background: linear-gradient(to left, #d6fcfc, #91eaea); */
		background: #91b5ea;
		margin: auto;
		min-width: 800px;
		height: 100px;
		border-radius: 0px 0px 15px 15px;
		box-shadow: 10px 5px 15px 3px #c3dafc;
		margin-bottom: 25px;
	}
    #headerTable{
        width: 100%;
        height: 100%;
    }
    #logo{
        display: inline;
        font-size: 32px;
        font-family: sans-serif;
        color: white;
        text-shadow: 3px 2px 2px #c3dafc;
		cursor: pointer;
    }
    .button{
        width: 75px;
    }
    .button svg{
		transition: all 0.05s linear;
    }
    .button:hover svg{
        transform: scale( 1.05 );
		fill:#d4e5ff;
    }
    #noticeIco svg{
		width: 50%;
		fill:white;
	}
    .loginInOut svg{
		width: 50%;
		fill:white;
	}
	#cartIco svg{
		width: 70%;
		fill:white;
	}
	#myPageIco svg{
		width: 70%;
		fill:white;
	}

	.loginInOut, #cartIco, #myPageIco, #noticeIco{
		margin-top: 15px;
	}

</style>
</head>
<body>
	<header>
		<table id="headerTable">
			<tr>
				<th style="width: 20px;"></th>
				<th style="text-align: left;">
					<h3 id="logo" onclick="location.href='/main'">BOOK-e On & On</h3>
				</th>
				<%
				if (login) {
					//out.print("\"" + userName + "\"님이 접속하셨습니다.");
				//최상단부 스크립틀릿에 보시면 세션에서 로그인 됐을 경우 아이디가 저장돼있습니다.
				//로그인값(false)이 아닐경우 출력됩니다.
				%>
				<th class="button">
					<a href="#" title="알림">
						<div id="noticeIco">
							<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 510 510" xml:space="preserve">
								<g id="notifications">
									<path d="M255,510c28.05,0,51-22.95,51-51H204C204,487.05,226.95,510,255,510z M420.75,357V216.75
										c0-79.05-53.55-142.8-127.5-160.65V38.25C293.25,17.85,275.4,0,255,0c-20.4,0-38.25,17.85-38.25,38.25V56.1
										c-73.95,17.85-127.5,81.6-127.5,160.65V357l-51,51v25.5h433.5V408L420.75,357z"/>
								</g>
							</svg>
						</div>
					</a>
				</th>
				<th class="button">
					<a href="/mypage" title="마이페이지">
						<div id="myPageIco">
							<svg id="Icons_User" overflow="hidden" version="1.1" viewBox="0 0 96 96" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
								<g>
									<circle cx="48" cy="30" r="16"/>
									<path d=" M 80 82 L 80 66 C 80 63.6 78.8 61.2 76.8 59.6 C 72.4 56 66.8 53.6 61.2 52 C 57.2 50.8 52.8 50 48 50 C 43.6 50 39.2 50.8 34.8 52 C 29.2 53.6 23.6 56.4 19.2 59.6 C 17.2 61.2 16 63.6 16 66 L 16 82 L 80 82 Z"/>
								</g>
							</svg>
						</div>
					</a>
				</th>
				<%
				}
				%>
				<th class="button">
					<a href="/cart/list" title="장바구니">
						<div id="cartIco">
							<!-- 장바구니 마크 -->
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48">
								<path fill-rule="evenodd" d="M33.5 38.25a.75.75 0 0 1 0 1.5.75.75 0 0 1 0-1.5zm-3 .75c0 1.654 1.346 3 3 3s3-1.346 3-3-1.346-3-3-3-3 1.346-3 3zM9 39.891a.75.75 0 1 1 0-1.5.75.75 0 0 1 0 1.5zm0-3.9c-1.654 0-3 1.346-3 3s1.346 3 3 3 3-1.346 3-3-1.346-3-3-3zm27.953-10.715l-5.166.163.205-5.939h6.575l-.235 4.381c-.052.755-.66 1.354-1.379 1.395zm-21.05-1.439l-.932-4.337h6.53v6.264l-5.49.173c.057-.695.03-1.4-.108-2.1zM19 13h2.5v5h-6.853l-1.224-5.696C14.791 12.696 16.61 13 19 13zm11.49 6.5l-.206 5.986-7.284.23V19.5h7.49zm.225-6.5l-.173 5H23v-5h7.715zm7.933 5h-6.604l.172-5h6.701l-.269 5zm2.941-7.532A1.5 1.5 0 0 0 40.5 10H19c-3.474 0-5.422-.717-6.328-1.187l-.085-.395A3.077 3.077 0 0 0 9.595 6H6v3l3.653.048 3.312 15.392a4.502 4.502 0 0 1-.803 3.551l-1.836 2.361a3.478 3.478 0 0 0-.382 3.686A3.479 3.479 0 0 0 13.09 36h23.36v-3H13.09a.479.479 0 0 1-.45-.28.482.482 0 0 1 .053-.527l1.852-2.381c.202-.269.378-.554.541-.845l21.997-.694a4.512 4.512 0 0 0 4.243-4.21l.672-12.482a1.503 1.503 0 0 0-.409-1.113z"/>
							</svg>
						</div>
					</a>
				</th>

				<%
				if (login) {
				%>
				<th class="button">
					<a href="/logout" title="로그아웃">
						<div class="loginInOut">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M11.992 8.994V6.996H7.995v-2h3.997V2.999l3.998 2.998-3.998 2.998zm-1.998 2.998H5.996V2.998L2 1h7.995v2.998h1V1c0-.55-.45-.999-1-.999H.999A1.001 1.001 0 0 0 0 1v11.372c0 .39.22.73.55.91L5.996 16v-3.008h3.998c.55 0 1-.45 1-1V7.996h-1v3.998z"/>
							</svg>
						</div>
					</a>
				</th>
				<%
				} else {
				%>
				<th class="button">
					<a href="/login?bntclick=1" title="로그인">
						<div class="loginInOut">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 14 16">
								<path fill-rule="evenodd" d="M7 6.75V12h4V8h1v4c0 .55-.45 1-1 1H7v3l-5.45-2.72c-.33-.17-.55-.52-.55-.91V1c0-.55.45-1 1-1h9c.55 0 1 .45 1 1v3h-1V1H3l4 2v2.25L10 3v2h4v2h-4v2L7 6.75z"/>
							</svg>
						</div>
					</a>
				</th>
				<%
				}
				%>
				<th style="width: 20px;"></th>
			</tr>
			<tr style="height: 15px;"></tr>
		</table>
	</header>
</body>
</html>