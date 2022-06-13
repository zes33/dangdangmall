<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>관리자 환불 목록</title>
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
	
	text-align: center;
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

/* .colorBtn {
	background-color: white;
	border-color: #ECECEC;
	border-radius: 10%;
} */
/* 
.qnaTitle {
	text-decoration: none;
	color: black;
} */

/* .bowl {
	text-align: center;
	margin: auto;
}
 */


/* adminTemplate 아래 */
.container {
 position: relative;
}

.menuname {
	position:relative;
	top: 35px;
	/*left: -205px;*/
	left: -25px;
	border: 1px solid LightGray;
	border-radius: 7px;
	width: 1170px;
	height: 140px;
	font-family: "Audiowide", sans-serif;	
}
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
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
<%-- <div class="container">
		<jsp:include page="sidebarTemplate.jsp"></jsp:include>
 --%>
	<div class="container">
   <jsp:include page="sidebarTemplate.jsp"></jsp:include>
	   	<div class="menuname h1 text-center center" style="background-color:rgb(240, 240, 240);">
	   		<strong style="font-size:3vw">&lt; 환불 요청 관리 &gt;</strong>
	   	</div>
   
   <div class="contents">
   
   	<!-- <h3>환불 요청 관리 페이지</h3> -->
	<%-- <div class="container">
		 ${refundList } 
	</div> --%>


	<div class="col-sm-12">
<!-- 	<div class="container"> -->
		<c:if test="${empty refundList}">
			<br />
			<h2>환불 요청건이 존재하지 않습니다.</h2>

		</c:if>


		<c:if test="${not empty refundList}">
			<!--환불 요청건 목록 -->
			<table class="table table-hover table1 clTable">
				<thead>
					<tr>
						<th style="text-align: center;" width="5%">NO.</th>
						<th style="text-align: center;" width="9%">고객 아이디</th>
						<th style="text-align: center;" width="10%">주문 번호</th>
						<th style="text-align: center;" width="12%">주문 상세 번호</th>
						<th style="text-align: center;" width="8%">상품 번호</th>
						<th style="text-align: center;" width="10%">상품명</th>
						<th style="text-align: center;" width="7%">구매 수량</th>
						<th style="text-align: center;" width="15%">환불 사유</th>
						<th style="text-align: center;" width="10%">구매 날짜</th>
						<th style="text-align: center;" width="10%" colspan="2">답변상태</th>
						<th style="text-align: center;" width="10%" colspan="2">상태</th>
						<!-- <th class="center" width="30%">상태 변경하기 </th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${refundList }">
						<tr>
							<td>${list.refund_id }</td>
							<td>${list.user_id}</td>
							<td>${list.order_id }</td>
							<td>${list.order_detail_id }</td>
							<td>${list.product_id }</td>
							<td>${list.product_name }</td>
							<td>${list.user_order_cnt }</td>
							<td>${list.refund_reason}</td>
							<td><fmt:formatDate
									value="${list.order_date}" pattern="yyyy-MM-dd HH:MM" /></td>

							<!-- 1: 신청접수 2: 환불 승인 3: 불가  -->
							<c:if test="${1 eq list.refund_status }">
								<td colspan="2" class="center">[신청 접수]</td>
							</c:if>
							<c:if test="${2 eq list.refund_status }">
								<td class="center" colspan="2">[환불 승인]</td>
							</c:if>
							<c:if test="${3 eq list.refund_status }">
								<td class="center" style="color: #C9C7C7;" colspan="2">[환불
									불가]</td>
							</c:if>
							<td>
							<c:if test="${1 eq list.refund_status }">
								<td colspan="2" class="center">
							<form action="update.do" method="post">
									<select name="refund_status">
										<option value="2">[환불승인]</option>
										<option value="3">[환불불가]</option>
									</select> <input type="hidden" name="refund_id"
										value="${list.refund_id }"><input type="hidden"
										name="order_id" value="${list.order_id }"> <input
										type="hidden" name="user_id" value="${list.user_id }">
										
									<input type="hidden" name="order_detail_id"
										value="${list.order_detail_id }"> <input type="submit"
										value="상태변경하기"  id="mySubmit" 
										style="width: 80px; height: 30px; font-size: 10px;">
								</form>
							</td>
							</c:if>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
   
   <!-- tmp end -->
   </div>
   </div>







	

	<!-- footer -->
	<%-- <jsp:include page="../common/footer.jsp"></jsp:include> --%>
</body>
</html>