<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가 정보</title>
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
	#authorForm textarea{
		height: 100px;
		width: 100%
	}
	
	#authorFormTable{
		width: 90%;
		min-width:600px;
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
			<form action="/authorSearch?do=addAuthor" method="post" id="authorForm" onsubmit="return checkForm(this);">
				<h1 style="text-align: center;">작가 정보</h1>
		        <table border="1" id="authorFormTable">
		            <tr>
		                <th>*작가명</th>
		                <td><input type="text" name="authorName" value="${ author.name }"></td>
		            </tr>
		            <tr>
		                <th>프로필 이미지</th>
		                <td><input type="text" name="profileImg" value="${ author.profileImg }"></td>
		            </tr>
		            <tr>
		                <th>국적</th>
		                <td><input type="text" name="nationality" value="${ author.nationality }"></td>
		            </tr>
		            <tr>
		                <th>작가 소개글</th>
		                <td><textarea name="profileContents">${ author.profileContents }</textarea></td>
		            </tr>
		            <tr>
		                <th>생일</th>
		                <td><input type="date" name="birth" value="${ author.birth }" ></td>
		            </tr>
		            <tr>
		                <th>기일</th>
		                <td><input type="date" name="death" value="${ author.death }" ></td>
		            </tr>
					<tfoot>
						<tr>
							<td colspan="2"><input type="submit" value="전송"></td>
						</tr>
					</tfoot>
		        </table>
		    </form>
		    <div style="height: 100px;"></div>
		</div>
	</div>
</body>
<script type="text/javascript">

	function checkForm(form){
		var name = form.name;
        
        if(name.value.trim() == ""){
            alert("작가님 이름을 입력해주세요.");
            name.focus();
            return false;
        }
        name.value = name.value.trim();
        

        alert("전부 정상적으로 작성되었습니다.");
    }
	
</script>
</html>