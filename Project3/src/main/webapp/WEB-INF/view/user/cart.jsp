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

.trim {
	padding: 0;
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

.phone_one_two {
	width: 30%;
	float: left;
}

.phone_three {
	width: 30%;
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

.nav_five {
	width: 20%;
}

.nav_two {
	width: 50%;
}

.nav_three {
	width: 33%;
}

.cart {
	width: 20pt;
}

.cart:hover {
	cursor: pointer;
}

.home {
	width: 25pt;
}

.home:hover {
	cursor: pointer;
}

.img-title {
	width: 18%;
	margin-bottom: 3pt;
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

.basketdiv {
	width: 100%;
	border-top: 1px solid #e0e0e0;
	float: left;
	font-size: 0.9375em;
	margin-bottom: 20px;
}

.basketdiv .row.head {
	border-bottom: 2px solid #888;
	box-sizing: border-box;
	background-color: #f4f4f4;
	font-weight: 500;
}

.basketdiv .data {
	border-bottom: 1px dashed #888;
	box-sizing: border-box;
	cursor: pointer;
	float: left;
	width: 100%;
}

.basketdiv .data .empty {
	text-align: center;
	padding: 12px 0;
}

.basketdiv .row.head .subdiv {
	background-color: #f4f4f4;
}

.basketdiv .row>.subdiv {
	display: block;
	float: left;
}

.basketdiv .row>.subdiv:nth-child(1) {
	width: 50%;
}

.basketdiv .row>.subdiv:nth-child(2) {
	width: 40%;
}

.basketdiv .row>.subdiv:nth-child(3) {
	width: 10%;
}

.basketdiv2 .row>.subdiv:nth-child(1) {
	width: 60%;
}

.basketdiv2 .row>.subdiv:nth-child(2) {
	width: 40%;
}

.basketdiv .row>div>div {
	display: block;
	float: left;
	text-align: center;
	margin: 0;
	padding: 12px 0;
}

.basketdiv .row.data>div>div {
	height: 60px;
	line-height: 60px;
}

.basketdiv .data .num .updown {
	color: #0075ff;
	font-size: 2em;
	letter-spacing: -5px;
}

.basketdiv .check {
	width: 10%;
}

.basketdiv .check input[type=checkbox] {
	transform: scale(1.5);
}

.basketdiv .img {
	width: 20%;
}

.basketdiv .pname {
	width: 70%;
}

.basketdiv2 .pname {
	width: 80%;
}

.basketdiv .basketprice {
	width: 33%;
}

.basketdiv .num {
	width: 33%;
	min-width: 105px;
}

.basketdiv .sum {
	width: 34%;
	max-width: 80px;
	color: #0000aa;
}

.basketdiv .point {
	width: 50%;
}

.basketdiv2 .basketprice {
	width: 25%;
}

.basketdiv2 .num {
	width: 25%;
}

.basketdiv2 .sum {
	width: 25%;
	color: #0000aa;
}

.basketdiv2 .point {
	width: 25%;
}

.basketdiv .basketcmd {
	width: 100%;
}

.basketdiv .data .pname {
	text-align: left !important;
	line-height: 1.2 !important;
}

.basketdiv .data .price, .basketdiv .data .sum, .basketdiv .data .point
	{
	text-align: right;
}

.baseform>tbody>tr>td:first-child {
	width: 100px;
}

.buttongroup {
	padding: 11px 0;
	margin: 50px 0;
}

.narrowbuttongroup {
	margin: 15px 0;
}

.buttongroup.center {
	text-align: center;
}

.buttongroup input[type=text], .buttongroup input[type=password] {
	height: 30px;
}

.buttongroup button, .buttongroup a {
	margin-right: 5px;
}

.buttongroup button:last-child, .buttongroup a:last-child {
	margin-right: 0;
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

.abutton-alt {
	background-color: #d3e2c6;
}

.red {
	color: #b00;
}

.blue {
	color: #0075ff;
}

.basketrowcmd, .sumcount, .summoney {
	text-align: right;
	margin-bottom: 10px;
}

.sumcount, .summoney {
	font-size: 1.25em;
	font-weight: bold;
}

.buttongroup {
	text-align: center;
}

.buttongroup a {
	text-decoration: none;
}

.cmd a, .cmd span {
	padding: 12px 30px;
	box-sizing: border-box;
	margin-top: 10px;
	font-size: 1.2em;
	color: #000;
	background-color: #f4f4f4;
	border: 1px solid #e0e0e0;
	text-align: center;
}

.cmd.small a, .cmd.small span {
	padding: 6px 20px;
	font-size: 0.8125em;
}

.orderform .p_num {
	text-align: right;
	width: 40px;
	font-size: 1em;
}
</style>
</head>

<body>
	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	
 ${list} 
 ${user_id} 
	<!--Content-->
	<div class="container-fluid text-center"
		style="margin-top: 25pt; margin-bottom: 25px;">
		<img src="../img/shopbag.svg" class="img-title" alt="no title"
			width="100" />

		<div>
		<br><br>
			<h1>장바구니 목록</h1>
			<br><br>
			<%-- ${map }
			<h1>${map.list[1] }</h1> --%>
			<br>
		</div>
		<%-- <p>${list}</p>
		<h1>userVO : ${user }</h1> --%>
		<div class="text-center">
			<c:if test="${empty map}">
				<br />
		장바구니가 비어있습니다.
		<br />
				<br />
			</c:if>
		</div>

		<c:if test="${not empty map}">
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
										<input type="number" style="width: 80px" name="cart_product_qty"
										value="${list.cart_product_qty}" min="1"> 
										<input type="hidden" name="product_id" value="${list.product_id}">
										<input type="submit" value="수량수정">
									</form>
							<td><span id="amount"
								data-amount=<c:out value="${list.product_price * list.cart_product_qty}"/>><fmt:formatNumber
										value="${list.product_price * list.cart_product_qty}"
										pattern="###,###,###" /></span></td>
							<td><span id="discount" style="color: red;"
								data-amount=<c:out value="${map.discount }"/>> <fmt:formatNumber
										value="${map.discount *100 }" type="number" /> %
							</span></td>
							<td><span id="total"
								data-amount=<c:out value="${list.product_price * list.cart_product_qty}"/>>
									<fmt:formatNumber
										value="${(list.product_price * list.cart_product_qty) - (list.product_price * list.cart_product_qty)* map.discount }"
										pattern="###,###,###" />
							</span></td>
							<td>
									<a href="delete.do?cart_id=${list.cart_id}">상품 빼기</a>
								
							</td>
						</tr>
						</div>
					</c:forEach>

				</table>
				</form>
			</div>
			<div class="text-right" style="margin: 10pt">
				<br>
				<tr>
					<h3 style="font-weight: bold; font-size: 20px;">
						<td>장바구니 금액 합계 : 
						<fmt:formatNumber pattern="###,###,###" value="${map.sumMoney *(1- map.discount)}" />원 <br> 
						배송비 <fmt:formatNumber value="${map.fee }" pattern="###,###,###" />원<br>
					</h3>
					<h5 style="font-weight: bold; font-size: 30px;">
						총금액
						<fmt:formatNumber value="${map.allSum }" pattern="###,###,###" />
						원
						</td>
					</h5>
				</tr>

			</div>
			<div class="container-fluid margin_first">
				<a style="font-size: 20px; font-weight: bold; " type="submit" 
					id="product" class="btn btn-success two_button" href="productList.do"> <font color = "black">상품목록 </font></a>
				
				<a style="font-size: 20px; font-weight: bold;" type="submit"
					id="order" class="btn btn-success two_button" href="../order/order.do"><font color = "red"> 선택 메뉴 주문 </font></a>
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