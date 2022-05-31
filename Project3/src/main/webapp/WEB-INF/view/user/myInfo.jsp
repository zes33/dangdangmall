<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<!-- header -->
<header>
	<jsp:include page="../common/headerLoginOK.jsp"></jsp:include>
</header>
	<div id="body-wrapper">
		 <div id="body-content" class="container">
	<h3>내 주문 내역</h3>
	<p>\${orderList} : ${orderList}</p>
		</div>
	<!-- footer -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	</div>
</body>
</html>