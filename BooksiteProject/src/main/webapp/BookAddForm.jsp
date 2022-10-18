<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보</title>
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
			<h1 style="text-align: center;">도서 정보</h1>
			<form action="/webCrawling" method="post" >
				교보문고 링크 : 
				<input type="text" name="URL" value="">
				<input type="submit" value="책 정보 가져오기">
			</form>
			<form action="/BookUpload.do" method="post" id="bookAddForm" onsubmit="return checkForm(this);">
		        <table border="1" id="bookAddFormTable">
		            <tr>
		                <th>*도서명</th>
		                <td>
		                    <input type="text" name="title" value="${ book.title }">
		                </td>
		            </tr>
		            <tr>
		                <th>*이미지 경로</th>
		                <td><input type="text" name="coverImgUrl" value="${ book.coverImg }"></td>
		            </tr>
		            <tr>
		                <th>
							*작가
							<button type="button" onclick="window.open('/authorSearch?do=authorSearchFrom', '', 'width=500, height=650'); return false;">작가 조회</button>
						</th>
		                <td>
		                	<input type="text" name="author" value="${ authorID }" disabled>
		                </td>
		            </tr>
		            <tr>
		                <th>번역가</th>
		                <td><input type="text" name="translator" value="${ book.translator }"></td>
		            </tr>
		            <tr>
		                <th>*가격</th>
		                <td><input type="text" name="price" value="${ book.price }"></td>
		            </tr>
		            <tr>
		                <th>배송비</th>
		                <td><input type="text" name="deliveryFee" value="${ book.deliveryFee }"></td>
		            </tr>
		            <tr>
		                <th>페이지 장수</th>
		                <td><input type="text" name="totalPages" value="${ book.totalPages }"></td>
		            </tr>
		            <tr>
		                <th>무게</th>
		                <td><input type="text" name="weight" value="${ book.weight }"></td>
		            </tr>
		            <tr>
		                <th>ISBN</th>
		                <td style="
							display: grid;
							grid-template-columns: 1fr 1fr;
							gap: 5px;
						">
							<div><input type="text" name="isbn13" placeholder="ISBN13" value="${ book.isbn13 }"></div>
		                	<div><input type="text" name="isbn10" placeholder="ISBN10" value="${ book.isbn10 }"></div>
		                </td>
		            </tr>
		            <tr>
		                <th>
							카테고리
							<button type="button">카테고리 조회</button>
						</th>
		                <td>
		                	<input type="text" name="categoryId">
		                </td>
		            </tr>
		            <tr>
		                <th>*소개글</th>
		                <td><textarea name="introduce">${ book.introduce }</textarea></td>
		            </tr>
		            <tr>
		                <th>소개이미지링크</th>
		                <td><input type="text" name="introduceImageUrl" value="${ book.introduceImg }"></td>
		            </tr>
		            <tr>
		                <th>*출판사</th>
		                <td><input type="text" name="publisher" value="${ book.publisher }"></td>
		            </tr>
		            <tr>
		                <th>출판사 리뷰</th>
		                <td><textarea name="publisherReview">${ book.publisherReview }</textarea></td>
		            </tr>
		            <tr>
		                <th>목차</th>
		                <td><textarea name="contents">${ book.contents }</textarea></td>
		            </tr>
		            <tr>
		                <th>*출시일</th>
		                <td><input type="date" name="publicationDate" value="${ book.publicationDate }"></td>
		            </tr>
		            <tr>
		                <th>*캐치프라이즈</th>
		                <td><input type="text" name="catchphrase" value="${ book.catchphrase }"></td>
		            </tr>
					<tfoot>
						<tr>
							<td colspan="2">
								<input type="submit" value="전송">
							</td>
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
		var title = form.title;
		var coverImgUrl = form.coverImgUrl;
		var author = form.author;
		var price = form.price;
		var introduce = form.introduce;
		var catchphrase = form.catchphrase;
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
        
        if(catchphrase.value.trim() == ""){
            alert("광고문구를 작성해주세요.");
            form.catchphrase.focus();
            return false;
        }
		catchphrase.value = catchphrase.value.trim();
        

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
    }
	
</script>
</html>