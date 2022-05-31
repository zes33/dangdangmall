<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>

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
	<div class="container">
		<!--제목-->
		<div class="container-fluid text-center" style="margin-top: 15pt">
			<h1>주문 페이지</h1>
			<img src="../img/fast.png" class="img-title" alt="no title"
				width="100" />
		</div>

		${user } ${map }
		<!--Content-->
		<div id="body-wrapper">
			<div id="body-content" class="container">
				<br /></br>
				<form action="order.do" method="post">
					<h3>주문 정보 입력</h3>
					수령인 <input type="text" name="order_receiver" maxlength="20"><br />
					수령인 연락처 <input type="text" name="order_phone" maxlength="20"><br />
					<!--  우편번호 <input type="text" name="order_zipcode" maxlength="20"><br/>
      주소 <input type="text" name="order_addr" maxlength="20"><br/> -->
					우편번호 <input id="member_post" maxlength="20" name="order_zipcode"
						type="text" placeholder="우편번호 찾기" readonly onclick="findAddr()">
					도로명 주소 <input id="member_addr" maxlength="20" name="order_addr"
						type="text" placeholder="도로명주소" readonly> <br> 상세 주소
					<input type="text" name="order_addr_d" maxlength="20"><br />

					<br /> <br /> <br /> <input type="submit"
						class="btn btn-sm btn-outline-secondary" value="결제하기">
				</form>
				<form class="needs-validation" novalidate>
					<div class="row g-3">
						<div class="col-sm-6">
							<label for="firstName" class="form-label">First name</label> <input
								type="text" class="form-control" id="firstName" placeholder=""
								value="" required>
							<div class="invalid-feedback">Valid first name is required.
							</div>
						</div>

						<div class="col-sm-6">
							<label for="lastName" class="form-label">Last name</label> <input
								type="text" class="form-control" id="lastName" placeholder=""
								value="" required>
							<div class="invalid-feedback">Valid last name is required.
							</div>
						</div>

						<div class="col-12">
							<label for="username" class="form-label">Username</label>
							<div class="input-group has-validation">
								<span class="input-group-text">@</span> <input type="text"
									class="form-control" id="username" placeholder="Username"
									required>
								<div class="invalid-feedback">Your username is required.</div>
							</div>
						</div>

						<div class="col-12">
							<label for="email" class="form-label">Email <span
								class="text-muted">(Optional)</span></label> <input type="email"
								class="form-control" id="email" placeholder="you@example.com">
							<div class="invalid-feedback">Please enter a valid email
								address for shipping updates.</div>
						</div>
						<br>
						<br>
						<hr class="my-4">
						<h4 class="mb-3">배송 정보 등록</h4>
						<div class="col-12">
							<label for="address" class="form-label">Address</label> <input
								type="text" class="form-control" id="address"
								placeholder="1234 Main St" required>
							<div class="invalid-feedback">Please enter your shipping
								address.</div>
						</div>

						<div class="col-12">
							<label for="address2" class="form-label">Address 2 <span
								class="text-muted">(Optional)</span></label> <input type="text"
								class="form-control" id="address2"
								placeholder="Apartment or suite">
						</div>

						<div class="col-md-5">
							<label for="country" class="form-label">Country</label> <select
								class="form-select" id="country" required>
								<option value="">Choose...</option>
								<option>United States</option>
							</select>
							<div class="invalid-feedback">Please select a valid
								country.</div>
						</div>

						<div class="col-md-4">
							<label for="state" class="form-label">State</label> <select
								class="form-select" id="state" required>
								<option value="">Choose...</option>
								<option>California</option>
							</select>
							<div class="invalid-feedback">Please provide a valid state.
							</div>
						</div>

						<div class="col-md-3">
							<label for="zip" class="form-label">Zip</label> <input
								type="text" class="form-control" id="zip" placeholder=""
								required>
							<div class="invalid-feedback">Zip code required.</div>
						</div>
					</div>
				</form>
				<br /> <br />
				<hr class="my-4">

				<h4 class="mb-3">결제 수단</h4>

				<div class="my-3">
					<div class="form-check">
						<input id="credit" name="paymentMethod" type="radio"
							class="form-check-input" checked required> <label
							class="form-check-label" for="credit">Credit card</label>
					</div>
					<div class="form-check">
						<input id="debit" name="paymentMethod" type="radio"
							class="form-check-input" required> <label
							class="form-check-label" for="debit">Debit card</label>
					</div>
					<div class="form-check">
						<input id="paypal" name="paymentMethod" type="radio"
							class="form-check-input" required> <label
							class="form-check-label" for="paypal">PayPal</label>
					</div>
				</div>

				<div class="row gy-3">
					<div class="col-md-6">
						<label for="cc-name" class="form-label">Name on card</label> <input
							type="text" class="form-control" id="cc-name" placeholder=""
							required> <small class="text-muted">Full name as
							displayed on card</small>
						<div class="invalid-feedback">Name on card is required</div>
					</div>

					<div class="col-md-6">
						<label for="cc-number" class="form-label">Credit card
							number</label> <input type="text" class="form-control" id="cc-number"
							placeholder="" required>
						<div class="invalid-feedback">Credit card number is required
						</div>
					</div>

					<div class="col-md-3">
						<label for="cc-expiration" class="form-label">Expiration</label> <input
							type="text" class="form-control" id="cc-expiration"
							placeholder="" required>
						<div class="invalid-feedback">Expiration date required</div>
					</div>

					<div class="col-md-3">
						<label for="cc-cvv" class="form-label">CVV</label> <input
							type="text" class="form-control" id="cc-cvv" placeholder=""
							required>
						<div class="invalid-feedback">Security code required</div>
					</div>
				</div>
			</div>
		</div>
		<h1>카카오 결제 테스트</h1>
		<button id="check_module" type="button">카카오 테스트 결제</button>
		<script>
			$("#check_module").click(function() {
				var IMP = window.IMP; // 생략가능
				IMP.init('imp65953649');
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
				// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
				IMP.request_pay({
					pg : 'kakao',
					pay_method : 'card',
					merchant_uid : 'TC0ONETIME' + new Date().getTime(),
					/* 
					 *  merchant_uid에 경우 
					 *  https://docs.iamport.kr/implementation/payment
					 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
					 */
					name : '주문명 : 아메리카노',
					// 결제창에서 보여질 이름
					// name: '주문명 : ${auction.a_title}',
					// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
					amount : 100,
					// amount: ${bid.b_bid},
					// 가격 
					buyer_name : '김채린',
					// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
					// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
					buyer_postcode : '123-456',
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '결제 금액 : ' + rsp.paid_amount;
						// success.submit();
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

		<!-- <form class="card p-2">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Promo code">
				<button type="submit" class="btn btn-secondary">Redeem</button>
			</div>
		</form> -->
	</div>
	<div class="col-md-7 col-lg-8"></div>
	<hr class="my-4">


	<div class="last_block"></div>

</body>
<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {

				console.log(data);

				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('member_post').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("member_addr").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("member_addr").value = jibunAddr;
				}
			}
		}).open();
	}
</script>
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>