<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 배송 관리</title>
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
#container {
	width: 1200px;
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
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

.colorBtn {
	background-color: white;
	border-color: #ECECEC;
	border-radius: 10%;
}

.qnaTitle {
	text-decoration: none;
	color: black;
}

.bowl {
	text-align: center;
	margin: auto;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	 <%-- ${getOrderList }  --%>
	<div class="menuname h1 text-center centers"
			style="background-color: rgb(240, 240, 240);">
			<strong style="font-size: 3vw">&lt; 고객 배송 요청 조회 &gt;</strong>
		</div>
		<br>

	<div class="container">
		<c:if test="${empty getOrderList}">
			<br />
			<h2>배송 요청건이 존재하지 않습니다.</h2>
		</c:if>


		<c:if test="${not empty getOrderList}">
			<!--배송 요청건 목록 -->
			<table class="table table-hover table1">
				<thead>
					<tr>
						<th class="center" width="10%">주문 아이디</th>
						<th class="center" width="10%"> 고객 아이디</th>
						<th class="center" width="10%">주문일자</th>
						<th class="center" width="10%">수령인</th>
						<th class="center" width="13%">연락처</th>
						<th class="center" width="25%">배송주소</th>
						<th class="center" width="20%">[배송시작] </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${getOrderList }">
						<tr>
							<td class="center">${list.order_id}</td>
							<td class="center">${list.user_id }</td>
							<td class="center"><fmt:formatDate
									value="${list.order_date}" pattern="yyyy-MM-dd HH:MM" /></td>
							<td class="center">${list.order_receiver }</td>
							<td class="center">
							<c:set var="user_phone" value="${list.order_phone }" />
									${fn:substring(user_phone,0,3) } - 
									${fn:substring(user_phone,3,7) } - 
									${fn:substring(user_phone,7,11) }
							</td>
							<td class="center">${list.order_addr }<br> ${list.order_addr_d }&nbsp;[${list.order_zipcode }]</td>
							<td class="center">
							<c:if test="${1 eq list.user_status }">
							<button>
							<a href="adminShipping/adminShippingUpdate.do?order_id=${list.order_id }"
								class="text-decoration-none text-dark">
							[배송시작하기]</a></button>
							</c:if>
							<c:if test="${2 eq list.user_status }">
							[배송중]
							</c:if>
							
							</td>
						</tr>
						 </c:forEach> 
				</tbody>
			</table>
		</c:if>
	</div>
	</div>
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>