<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 내역</title>
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

/* adminTemplate 아래 */
.container {
	position: relative;
}

.menuname {
	position: relative;
	top: 35px;
	/*left: -205px;*/
	left: -25px;
	border: 1px solid LightGray;
	border-radius: 7px;
	width: 1170px;
	height: 140px;
	font-family: "Audiowide", sans-serif;
}
/*
.center {
  display: flex;
  justify-content: center;
  align-items: center;
}
 .contents {
	position:relative;
	left: 0px;
	top: 48px;
	width: 1145px;
	height: 600px;
} */
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div class="container">
		<jsp:include page="sidebarTemplate.jsp"></jsp:include>
		<div class="menuname h1 text-center center"
			style="background-color: rgb(240, 240, 240); padding-top: 45px !important;">
			<strong style="font-size: 3vw">&lt; 판매 상세 내역 &gt;</strong>
		</div>

		<div style="margin-top: 60px;">
			<c:if test="${empty one}">
				<br />
				<h2>판매내역이 존재하지 않습니다.</h2>
			</c:if>
			<div class="contents">
				<%-- ${userA } --%>
				<div class="card border-success mb-3" style="max-width: 50rem;">
					<div class="card-header">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"> <span class="h3"><strong>[ ${one[0].order_id  } ]</strong></span><span><strong></strong></span>
								<span class="text-success position-absolute top-0 end-0"></span></font></font>
					</div>
					<div class="card-body">
						<h4 class="card-title">
							<font style="vertical-align: inherit;"><strong>고객 ID : </strong>
									${one[0].user_id }
							</font>
						</h4>
						<p class="card-text">
							<font style="vertical-align: inherit;">
									<div>
										<strong>수령인 : </strong>${one[0].order_receiver}</div> <br>
									<div>
										<strong>총구매 가격 : </strong><fmt:formatNumber value="${one[0].order_total - 2500}"
					pattern="###,###,###" />
				&nbsp;원</div> <br>
									<div>
										<strong>주문일자 : </strong>${one[0].order_date }</div> <br>
									<div>
										<strong>주문자 연락처 : </strong>
									<c:set var="user_phone" value="${one[0].order_phone }" />
									
									<c:if test="${ '-' eq fn:substring(user_phone,3,4)}"> 
									${one[0].order_phone }
									</c:if> 
									<c:if test="${ '-' ne fn:substring(user_phone,3,4)}"> 
									${fn:substring(user_phone,0,3) } - 
									${fn:substring(user_phone,3,7) } - 
									${fn:substring(user_phone,7,11) }
									</c:if> 
										
										
										
										</div> <br>
										<strong> 배송 주소 : </strong>${one[0].order_addr }&nbsp; ${one[0].order_addr_d }&nbsp;(${one[0].order_zipcode })</div> <br>
							</font>
						</p>
					</div>
				</div>
			</div>
			<br>

			<c:if test="${not empty one}">
				<!--판매 내역 목록 -->
				<table class="table table-hover table1" style="margin-top: 20px;">
					<thead>
						<tr>
							<th class="center" width="10%">주문 상세 번호</th>
							<th class="center" width="10%">상품명</th>
							<th class="center" width="10%">카테고리</th>
							<th class="center" width="10%">상품가격</th>
							<th class="center" width="10%">할인율 적용</th>
							<th class="center" width="10%">수량</th>
							<th class="center" width="10%">총 적용 가격</th>
							<th class="center" width="15%">환불신청여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${one }">
							<tr>
								<td class="center">${list.order_detail_id}</td>
								<td class="center">${list.product_name}</td>
								<td class="center">${list.category_code }</td>
								<td class="center">${list.product_price }</td>
								<td class="center"><c:choose>
										<c:when test="${0.0 eq list.product_discount}">[적용 없음]</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${list.product_discount *100 }"
												type="number" /> %
										</c:otherwise>
									</c:choose></td>
								<td class="center">${list.user_order_cnt }</td>
								<td class="center"><fmt:formatNumber
										value="${(list.product_price * list.user_order_cnt) - (list.product_price * list.user_order_cnt)* list.product_discount }"
										pattern="###,###,###" />원</td>
								<td class="center"><c:choose>
										<c:when test="${0 eq list.refund_id}">[정상 주문건]</c:when>
										<c:otherwise>[환불 진행중]</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<button type="button" class="btn btn-light"
				onclick="location.href='${pageContext.request.contextPath }/salesHistory/salesHistoryView.do'">전체
				목록으로 돌아가기</button>
		</div>
	</div>
</body>
</html>