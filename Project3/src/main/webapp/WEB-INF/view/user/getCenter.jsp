<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
	#container { width: 700px; margin: auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
<div id="container">
	<table class="table table-hover">
		<!-- 고객문의 상세페이지인뎅 정보가 많아서 예쁘게 정리하고싶은데 잘 안돼서ㅠㅠ 세트로 묶인것만 둘게요 -->
		<tr>
			<th class="center">NO.</th>
			<td>${getCenter.CENTER_QNA_ID }</td>
		</tr>
		<tr>
			<th class="center">문의제목</th>
			<td>${getCenter.CENTER_QNA_TITLE }</td>
		</tr>
		<tr>
			<th class="center">ID</th>
			<td>${getCenter.USER_ID }</td>
		</tr>
		<tr>
			<th class="center">닉네임</th>
			<td>${getCenter.USER_NICKNAME }</td>
		</tr>
		<tr>
			<th class="center">문의날짜</th>
			<td><fmt:formatDate value="${getCenter.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<th class="center">문의내용</th>
			<td>
				<textarea name="content" rows="10" cols="40" disabled="disabled">${getCenter.CENTER_QNA_CONTENT }</textarea>
			</td>
		</tr>
		<c:choose>
			<c:when test="${empty getCenter.REPLY_CONTENT }">
				<tr>등록된 답변이 없습니다.</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th class="center">답변내용</th>
					<td>
						<textarea name="content" rows="10" cols="40" disabled="disabled">${getCenter.REPLY_CONTENT }</textarea>
					</td>
				</tr>
				<tr>
					<th class="center">답변날짜</th>
					<td><fmt:formatDate value="${getCenter.CENTER_REPLY_DATE }" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</table>
	<!-- 답변이 달리면 수정 불가, 분기처리는 function에서 하겠음 -->
	<div style="float:right;">
		<button type="button" class="btn btn-outline-secondary btn-sm" href="#">문의 수정</button>
		<button type="button" class="btn btn-outline-secondary btn-sm" href="#">문의 삭제</button>
	</div>
	
	<br>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</div>	
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>






