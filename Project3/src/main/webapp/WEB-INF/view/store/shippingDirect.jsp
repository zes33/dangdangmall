<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

#body-content {
	background-color: #F3F3F3;
	padding-bottom: 170px; /* footer의 높이 */
	padding-left: 300px;
	padding-right: 300px;
}

table {
	width: 100%;
	/* border-top: 1px solid #444444; */
	border-collapse: collapse;
}

tr, td ,br{
	border-bottom: 1px solid #444444;
	border-left: 1px solid #444444;
	padding: 10px;
	font-size: 15px;
	text-align: left;
}
</style>


<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
<title>결제정보 입력</title>
<!-- css 스크립트 삽입 -->
<link href="common/styles.css" rel="stylesheet">
<!-- kakao -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	 <h3>map</h3> ${mapD.list.product_id }
			<h3>user</h3> ${user}
			<h3>배송정보</h3> ${orderInfo } 

	<div id="body-wrapper">
		<div id="body-content" class="container">
			<div class="container-fluid text-center"
				style="margin-top: 10pt; margin-bottom: 25px;">
				<br> <br> <img src="../img/bill.png" class="img-title"
					alt="no title" width="250" /> <br> 
				<div class="container">
					<br>
					<h1>주문자 정보</h1>
					<br>
					<table style="width: 90%; padding-top: 10px;">
						<tr>
							<td>이름</td>
							<td>${orderInfo.order_receiver }</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>${user.user_email }</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>${orderInfo.order_phone }</td>
						</tr>
						<tr>
							<td>배송지</td>
							<td>${orderInfo.order_addr }${orderInfo.order_addr_d }</td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td>${orderInfo.order_zipcode }</td>
						</tr>
					</table>
					<hr>
				</div>
			</div>
		<!-- </div>
		<div class="container"> -->
			<h3>주문상품 정보</h3>
				<table style="width: 90%; padding-top: 3pt;">
					<tr>
						<th>상품 이름</th>
						<th>가격</th>
						<th>수량</th>
						<th>할인율 반영 전 금액</th>
						<th>할인율</th>
						<th>금액</th>
					</tr>
					
						
					

						<%-- <div class="menuClass">
							<tr>
								<td><span id="amount"> <c:out
											value="${mapD.list.product_name }" />
								</span></td>
								<td><span id="amount"> <c:out
											value="${mapD.list.product_price }" />
								</span></td>
								<td><span type="number" style="width: 80px"
									name="cart_product_qty" min="1">
										${mapD.list.cart_product_qty}</span>
								<td><span id="amount"
									data-amount=<c:out value="${mapD.list.product_price * mapD.list.cart_product_qty}"/>><fmt:formatNumber
											value="${mapD.list.product_price * mapD.list.cart_product_qty}"
											pattern="###,###,###" /></span></td>
								<td><span id="discount" style="color: red;"
									data-amount=<c:out value="${mapD.list.product_discount }"/>> <fmt:formatNumber
											value="${mapD.list.product_discount *100 }" type="number" /> %
								</span></td>
								<td><span id="total"
									data-amount=<c:out value="${mapD.list.product_price * mapD.list.cart_product_qty}"/>>
										<fmt:formatNumber
											value="${(mapD.list.product_price * mapD.list.cart_product_qty) - (mapD.list.product_price * list.list.cart_product_qty)* mapD.list.product_discount.list.product_discount }"
											pattern="###,###,###" />
								</span></td>

							</tr>
						</div>
  --%>
				</table>
			<br> <br>
			<hr>
			<table style="width: 90%; padding-top: 3pt;">
				<tr>
					<td>총상품 금액 :</td>
					<td><fmt:formatNumber pattern="###,###,###"
							value="${mapD.sumMoney *(1- mapD.discount)}" />원</td>
				</tr>
				<tr>
					<td>쿠폰 사용 :</td>
					<!-- <form class="card p-2">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Promo code">
							<button type="submit" class="btn btn-secondary">Redeem</button>
						</div>
					</form> -->
					<td> - <fmt:formatNumber pattern="###,###,###" value="${mapD.coupon * 100 }" />
						% </td>
				</tr>
				<tr>
					<td>마일리지 사용 :</td>
					<td><fmt:formatNumber pattern="###,###,###" value="${user.user_point }" />
						point</td>
				</tr>
				<tr>
					<td>배송비 :</td>
					<td><fmt:formatNumber value="${mapD.fee }"
							pattern="###,###,###" />원</td>
				</tr>
				<tr>
					<td>총 결제금액 :</td>
					<td><fmt:formatNumber value="${mapD.allSum }"
							pattern="###,###,###" />원</td>
				</tr>
			</table>
			<hr>
		<div class="container">
			<br >결제 및 계좌 안내 시 상호명은 (주)당당몰로 표기되니 참고 부탁드립니다.<br> <br>
			이용약관 및 개인정보 제3자 제공사항에 대해 확인하였으며 결제에 동의합니다.<br> <br> 결제대행
			서비스 이용약관 <a style="color: gray;" href="https://www.inicis.com/terms">(주)KG이니시스</a><br>
			<br>
			
		</div></div>
		<button class="w-100 btn btn-primary btn-lg" id="check_module" type="button">결제 하기</button>
		<input type="hidden" name="product_id" id="product_id" value="${mapD.list.product_id }">
			<br>
			<script>
			$("#check_module").click(function() {
				var IMP = window.IMP; // 생략가능
				IMP.init('imp65953649');
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
				// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
				IMP.request_pay({
					pg : 'inicis',
					pay_method : 'card',
					merchant_uid : 'TC0ONETIME' + new Date().getTime(),
					/* 
					 *  merchant_uid에 경우 
					 *  https://docs.iamport.kr/implementation/payment
					 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
					 */
					name : '당당몰',
					// 결제창에서 보여질 이름
					// name: '주문명 : ${auction.a_title}',
					amount : ${mapD.allSum},
					// 가격 
					buyer_name : '${user.user_name}',
					//buyer_postcode : '123-456',
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '결제 금액 : ' + rsp.paid_amount;
						//success.submit();
						document.location.href="payD.do?product_id="+$("#product_id").val(); //alert창 확인 후 이동할 url 설정
						// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
						// 자세한 설명은 구글링으로 보시는게 좋습니다.
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});
			});
		</script>
	
		</div>
		


	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<div class="last_block"></div>
</body>
</html>