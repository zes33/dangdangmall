<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료창</title>
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

</head>
<body>
	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>

	<!--Content-->
	<div class="container">
		<!-- <h1>성공적인 결제!</h1> -->
		
		<div id="body-wrapper">
			<div id="body-content" class="container">
								<div class="container-fluid text-center" style="margin-top: 10pt">
		<div class="container-fluid text-center"
			style="margin-top: 25pt; margin-bottom: 25px;">
			<img src="../img/bill.png" class="img-title" alt="no title"
				width="200" /></div>

			<div>
				<%-- <h1>user</h1>
				${user }
				<h1>orderInfo</h1>
				${orderInfo }
				<br> --%>
				<br><br>
				<Strong> ${user.user_nickname }님의 주문과 결제가  <span style="color : #B90000;">정상적으로 완료되었습니다.</span> <br><br></Strong>
				<Strong> 당당몰을 이용해 주셔서 감사합니다.<br> <br></Strong>
				<strong> 주문 번호 :  <span style="color : #B90000;"> ${orderInfo.order_id } <br></span></strong>
				
				<div class="container-fluid margin_first">
					<br> <br> <a style="font-size: 20px; font-weight: bold;"
						type="submit" id="product" class="btn btn-success two_button"
						href="${pageContext.request.contextPath }/myinfo.do"> <font
						color="black">내 주문 내역 확인하기</font></a> <a
						style="font-size: 20px; font-weight: bold;" type="submit"
						id="order" class="btn btn-success two_button"
						href="${pageContext.request.contextPath }/main.do"><font
						color="red"> 메인으로 돌아가기 </font></a> <br> <br>
				</div>
</div></div></div>
				
				<br> <br>
			</div>
			<!-- footer -->
			<jsp:include page="../common/footer.jsp"></jsp:include>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>
			<script>
				
			</script>
			<div class="last_block"></div>
			</div>
</body>
</html>