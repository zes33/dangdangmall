<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의 상세보기</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">

<link rel="canonical"
   href="https://getbootstrap.kr/docs/5.1/examples/album/">

<!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<link href="common/styles.css" rel="stylesheet">
<style>
	table td{
		border: 1px solid black;
	}
</style>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div>
	<table>
	<c:forEach var="qna" items="${productQnaSet }">
	<c:choose>
	<c:when test="${0 eq qna.q_or_a }">
		<!-- 문의 -->
		<tr>
			<td>상품명</td>
			<td>${qna.product_name }</td>
			<td>상품번호</td>
			<td>${qna.product_id }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${qna.user_id }</td>
			<td>작성일</td>
			<td>${qna.product_qna_date }</td>
		</tr>
		<tr>
			<td>문의</td>
			<td colspan="3">${qna.qna_content }</td>
		</tr>
		</c:when>
		<c:otherwise>
		<!-- 답변 -->
		<tr>
			<td>답변</td>
			<td colspan="3">${qna.qna_content }</td>
		</tr>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	</table>
</div>


</body>
</html>