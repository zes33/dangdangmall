<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불 신청 페이지</title>
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

#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
	background-color : #F3F3F3;
    margin-top: 100px;
    padding-bottom: 170px; /* footer의 높이 */
    padding-left: 300px;
    padding-right: 300px;
}
	.container { width: 700px; margin: auto; }
	h1 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	.right { 
	text-align: center; 
	float: right;
	}
	.search{
	padding-left: 15px;
	}
	
	.table{
	border: 1px solid black;
	}
</style>
</head>
<body>
	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div id="body-wrapper">
		<div id="body-content" class="container">
			<br /></br/>
			<h2>환불 신청</h2>
			<form id="refundFrm" name="refundFrm" action="refundAction.do"
				method="post">
				<table class="table">
					<tbody>
						<tr>
							<td>아이디</td>
							<td><input type="text" id="user_id" name="user_id"
								placeholder="아이디" class="form-control" value="${user.user_id}"
								readonly></td>
						</tr>
						<%-- <tr>
							<td>주문요일</td>
							<td colspan="2"><input id="order_date" name="order_date"
								type="text" placeholder="" maxlength="20" class="form-control"
								value="${oneOrder.order_date}" readonly></td>
						</tr> --%>
						<tr>
							<td>이름</td>
							<td colspan="2"><input id="user_name" name="user_name"
								type="text" placeholder="이름" maxlength="20" class="form-control"
								value="${user.user_name}" readonly></td>
						</tr>
						<tr>
							<td>상품명</td>
							<td colspan="2"><input id="product_name" name="product_name"
								type="text" class="form-control" maxlength="20"
								value="${oneOrder.product_name}" readonly></td>
						</tr>
						<tr>
							<td>환불 가격</td>
							<td colspan="2"><input id="refund_total" name="refund_total"
								type="number" class="form-control" maxlength="20"
								value="${oneOrder.product_price * oneOrder.user_order_cnt *(1 - oneOrder.product_discount)}" readonly></td>
						</tr>
						<tr>
							<td>환불 사유</td>
							<td colspan="2"><textarea style="width :500px;" name="refund_reason" rows="10"
									cols="40"></textarea></td>
						</tr>
						<input type="hidden" name="order_id" value="${oneOrder.order_id}">
						<input type="hidden" name="order_detail_id"
							value="${oneOrder.order_detail_id}">
					</tbody>
				</table>
				<div style="float: right;">
					<input type="submit" value="환불 신청">
				</div>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


	<!-- footer -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>