<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<title>장바구니 목록</title>

<!-- 아래 4개 link는 헤더 관련 link -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.1/examples/album/">
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- css 스크립트 삽입 -->
<link href="common/styles.css" rel="stylesheet">

<style type="text/css">
#container {
	width: 700px;
	margin: auto;
}

h1, h3, p {
	text-align: center;
}

table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
	margin: 0 auto;
	border-bottom: 1px solid #444444;
}

th {
	background-color: lightgray;
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

.outer {
	display: flex;
	justify-content: center;
}

div.contents {
	position: absolute;
	left: 0;
	top: 0;
	width: 800px;
	height: 1280px;
}
/*img:hover{*/
/*    cursor: pointer;*/
/*}*/
div.contents {
	position: absolute;
	left: 0;
	top: 0;
	width: 800px;
	height: 1280px;
}

.pos:hover {
	cursor: pointer;
}

.btn_light_green:hover, .btn_light_green:active, .btn_light_green:visited
	{
	background-color: #CFE3A1 !important;
	color: #6F923E !important;
	border-color: #CFE3A1 !important;
}

.btn-outline-success {
	background-color: white !important;
	color: #6F923E !important;
	border-color: #6F923E !important;
}

.btn-outline-success:hover, .btn-outline-success:active,
	.btn-outline-success:visited {
	background-color: #CFE3A1 !important;
	color: #6F923E !important;
	border-color: #CFE3A1 !important;
}

.btn_disabled {
	background-color: white !important;
	color: #CFE3A1 !important;
	border-color: #CFE3A1 !important;
}

.btn-success {
	background-color: #CFE3A1 !important;
	color: black !important;
	border-color: #CFE3A1 !important;
}

.btn-success:hover, .btn-success:active, .btn-success:visited {
	background-color: #6F923E !important;
	color: white !important;
	border-color: #6F923E !important;
}

.light_green {
	background-color: #CFE3A1 !important;
}

.last_block {
	height: 50pt;
}

.two_button {
	width: 49%;
}

.three_button {
	margin: 0 !important;
	width: 33%;
}

.three_button_center {
	width: 33%;
	margin-left: 0.5%;
	margin-right: 0.5%;
}

.up_down_center {
	margin: auto;
}

.left_input {
	width: 70%;
	float: left;
}

.right_input {
	margin-left: 1%;
	width: 29%;
}

.margin_up {
	margin-top: 3pt;
}

.margin_first {
	margin-top: 30pt;
}

.category {
	margin: 10%;
	width: 80%;
}

.category_label:hover {
	cursor: pointer;
}

.map_button {
	width: inherit;
	padding: 5pt;
}

.map_button:hover {
	cursor: pointer;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}



.abutton, .abutton:link, .abutton:visited, .abutton:active, input[type=button]
	{
	background-color: #383838;
	border: 1px solid #888888;
	color: #ffffff;
	cursor: pointer;
	letter-spacing: -1px;
	padding: 3px 5px;
	margin: 2px 3px;
	width: auto;
	word-break: keep-all;
	border-radius: 5px;
	text-decoration: none;
	font-size: 0.9375em;
}


.material-icons.md-18 {
	font-size: 18px;
}

.material-icons.md-36 {
	font-size: 36px;
}
nav {
  display: inline-block;
  
}
</style>
</head>

<body>
	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<%-- 	
 ${list} 
 ${user_id}  --%>

	<!--Content-->
	<div class="container-fluid text-center"
		style="margin-top: 25pt; margin-bottom: 25px;">
		<img src="../img/shopbag.svg" class="img-title" alt="no title"
			width="100" />

		<div>
			<br> <br>
			<h1>장바구니 목록</h1>
			<br> <br>
			<%-- ${map }
			<h1>${map.list[1] }</h1>  --%>
			<br>
		</div>
		<%-- <p>${list}</p>
		<h1>userVO : ${user }</h1>  --%>
		<div class="text-center">
			<c:if test="${empty map.list}">
				<br />
				<h2>장바구니가 비어있습니다.</h2>
				<br />
				<br />
			</c:if>
		</div>

		<c:if test="${not empty map.list}">
			<!--장바구니 목록-->
			<div style="font-weight: bold; font-size: 20px;">

				<table style="width: 90%; padding-top: 3pt;">
					<tr>
						<th>상품 이름</th>
						<th>가격</th>
						<th>수량</th>
						<th>할인율 반영 전 금액</th>
						<th>할인율</th>
						<th>금액</th>
						<th>삭제</th>
					</tr>

					<c:forEach items="${map.list }" var="list" varStatus="i">
						<div class="menuClass"
							data-menuId=<c:out value="${list.cart_id}"/>>
							<tr>
								<td><span id="amount"> <c:out
											value="${list.product_name }" />
								</span></td>
								<td><span id="amount"> <c:out
											value="${list.product_price }" />
								</span></td>
								<td>
									<form action="update.do" method="post">
										<input type="number" style="width: 80px"
											name="cart_product_qty" value="${list.cart_product_qty}"
											min="1"> <input type="hidden" name="product_id"
											value="${list.product_id}"> <input type="submit"
											value="수량수정">
									</form>
								<td><span id="amount"
									data-amount=<c:out value="${list.product_price * list.cart_product_qty}"/>><fmt:formatNumber
											value="${list.product_price * list.cart_product_qty}"
											pattern="###,###,###" /></span></td>
								<td><span id="discount" style="color: red;"
									data-amount=<c:out value="${list.product_discount }"/>>
										<fmt:formatNumber value="${list.product_discount *100 }"
											type="number" /> %
								</span></td>
								<td><span id="total"
									data-amount=<c:out value="${(list.product_price * list.cart_product_qty) - (list.product_price * list.cart_product_qty)* list.product_discount}"/>>
										<fmt:formatNumber
											value="${(list.product_price * list.cart_product_qty) - (list.product_price * list.cart_product_qty)* list.product_discount }"
											pattern="###,###,###" />
								</span></td>
								<td><a href="delete.do?cart_id=${list.cart_id}">상품 빼기</a></td>
							</tr>
						</div>
					</c:forEach>

				</table>
				</form>
			</div>
			<div class="text-right" style="margin: 10pt;padding-right: 55px;" align='right' >
				<nav style="font-weight: bold; font-size: 20px;">
					<ul>
						<li>장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###"
								value="${map.sumMoney}" /> 원
						</li>
						<li>배송비 <fmt:formatNumber value="${map.fee }"
								pattern="###,###,###" /> 원
						</li>
						<li>총금액 <fmt:formatNumber value="${map.allSum }"
								pattern="###,###,###" /> 원
						</li>
						<br>
						<span> <font color="red"> ** 10만원 이상 구매시 무료배송 **</font> </span>
					</ul>
				</nav>
			</div>
			<div class="container-fluid">
				<a style="font-size: 20px; font-weight: bold;" type="submit"
					id="product" class="btn btn-success two_button"
					href="productList.do"> <font color="black">상품목록 </font></a> <a
					style="font-size: 20px; font-weight: bold;" type="submit"
					id="order" class="btn btn-success two_button"
					href="../order/orderView.do"><font color="black"> 선택 메뉴
						주문 </font></a>
			</div>
		</c:if>
	</div>
	<br>


	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script>
		
	</script>
	<div class="last_block"></div>
</body>
</html>