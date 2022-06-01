<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의 답변하기</title>
</head>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>

	<div>
	<form action="SubmitAdminProductQna.do" method="post">
		<table>
			<tr>
				<th>작성자</th>
				<td>${productQna.user_id }</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${productQna.product_qna_date }</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>${productQna.product_name }</td>
			</tr>
			<tr>
				<th>상품id</th>
				<td>${productQna.product_id }</td>
			</tr>
			<tr>
				<th>문의내용</th>
				<td>${productQna.qna_content }</td>
			</tr>
			<tr>
				<th>답변상태</th>
				<td>${productQna.product_qna_state}</td>
			</tr>
			<tr>
				<th>답변</th>
				<td>
					<textarea rows="7" cols="30" name="qna_content"></textarea>
				</td>
			</tr>
		</table>
		<input type="button" value="등록" >
		<input type="hidden" name="qna_id" value="${productQna.qna_id  }">
		</form>
	</div>




</body>
</html>