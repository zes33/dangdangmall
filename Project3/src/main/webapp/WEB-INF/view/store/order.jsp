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
<title>결제정보 입력 </title>
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

.orderInfo {
	border: 5px solid #eee;
	padding: 20px;
}

.orderInfo .inputArea {
	margin: 10px 0;
}

.orderInfo .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

.orderInfo .inputArea input {
	font-size: 14px;
	padding: 5px;
}

#userAddr2, #userAddr3 {
	width: 250px;
}

.orderInfo .inputArea:last-child {
	margin-top: 30px;
}

.orderInfo .inputArea button {
	font-size: 20px;
	border: 2px solid #ccc;
	padding: 5px 10px;
	background: #fff;
	margin-right: 20px;
}
</style>
</head>

<body>
	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	${user } ${map }
	<!--Content-->
	<div id="body-wrapper">
	  <div id="body-content" class="container">
	  <br/></br/>
   <h2>주문 페이지</h2>
   <form action="order.do" method="post">
      수령인 <input type="text" name="order_receiver" maxlength="20"><br/>
      수령인 연락처 <input type="text" name="order_phone" maxlength="20"><br/>
      우편번호 <input type="text" name="order_zipcode" maxlength="20"><br/>
      주소 <input type="text" name="order_addr" maxlength="20"><br/>
 		상세 주소  <input type="text" name="order_addr_d" maxlength="20"><br/>
    
      <br/><br/><br/>
      <input type="submit" class="btn btn-sm btn-outline-secondary" value="결제하기">
   </form>
	<br/><br/>
   </div>
	
		<!--제목-->
		<div class="container-fluid text-center" style="margin-top: 15pt">
			<h1>주문 페이지</h1>
			<img src="../img/fast.png" class="img-title" alt="no title"
				width="100" />
		</div>

		</div>

		<hr />
		<div class="last_block"></div>


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