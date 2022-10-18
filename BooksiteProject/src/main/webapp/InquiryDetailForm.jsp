<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<div class="details">
	<table border="1">
		<tr>
			<th>문의유형 </th>
			<td>카테고리</td>
<%-- 			<td>${Inqinfo.categroy}</td> --%>
			<th>등록일시</th>
			<td>정보</td>
<%-- 			<td>${Inqinfo.}</td> --%>
			<th>문의상태</th>
			<td>상태</td>
<%-- 			<td>${ Inqinfo.state }</td> --%>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="5">DB정보</td>
		</tr>
		<tr>
			<th>문의내용</th>
			<td style="display: 'block';" id="inquireInput" colspan="5"><textarea style="width: 100%; height: 300px">DB정보로 불러오기</textarea></td>
			<td style="display: 'block';" id="inquireOutput" colspan="5"></td>
		</tr>
		<tr style="display: '';">
			<th style="display: 'block';" id="reply">답변내용</th>
			<td style="display: 'block';" id="replyInput" colspan="5"><textarea style="width: 100%; height: 300px">DB정보로 불러오기</textarea></td>
			<td style="display: 'block';" id="replyOutput" colspan="5"></td>
		</tr>
	</table>
</div>
</html>