<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>장바구니페이지</title>
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

<!-- css 스크립트 삽입 -->
<link href="common/styles.css" rel="stylesheet">
<style>
	#container { width: 700px; margin: auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
		border-bottom: 1px solid #444444;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>
</head>

<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>

	</header>

<h1>${getCartList } </h1>


	</header>
	<table border=1>
		<thead>
			<tr>
				<th>상품명</th>
				<th>상품 수량</th>
				<th>상품 가격</th>
				<th>할인적용단</th>
				<th>소계(수량*할인적용단가)</th>
				<th>배송비</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${getCartList }">
				<tr>
					<td>${list.product_name }</td>
					<td>${list.cart_detail_cnt }</td>
					<td>${list.product_price}</td>
					<td>${list.product_discount}</td>
					<td>${list.product_price * list.cart_detail_cnt * list.product_discount }</td>
					<td>무료배송</td>
					<td>삭제버튼</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>

	<hr />
	<div class="last_block"></div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
