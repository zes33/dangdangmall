<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
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
</head>
</head>
<style>
.totPage {
	margin:auto;
	background-color: #80E6D5;
	width: 1100px;
	padding: 30px;
}
.card-photo {
	background-color: aqua;
}
.mainPic {
	width: 1040px;
	height: 600px;
}
.prdNamePrice {
	background-color: yellow;
}
.productInfo {
	background-color: pink;
}
textarea {
	width: 1040px;
	height: 100px;
}
.prdInfoPic { width: 1040px; }
</style>
<body>
<!-- header -->
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>

</header>
<!-- -------------------------------- -->

	<div class="totPage">
		<div >
			<div class="card-photo">
				<img src="../img/고무밴드.jpg" alt="..." class="mainPic">
			</div>
			<div class="prdNamePrice">
				<h3><span>마늘맛 닭가슴살</span></h3>
				<h4><span>10,000원</span></h4>
				<p><span>식품</span></p>
			</div>
		</div>
		<div class="productInfo">
			<img src="../img/고무밴드.jpg" alt="..." class="prdInfoPic">
		</div>
		<br><br><br>
		<div class="reviewZone">
			<hr>
			<h3><span>상품후기</span></h3>
			<p><a>베스트순 </a><a> 최신순</a></p>
			<!-- forEach 쓰걸아 -->
				<div class="reviewComment">
					<div><p>아이디:id</p></div>
					<p><span>맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절</span></p>
					<hr>
				</div>
		</div>
		<br><br>
		<div class="prdQnaZone">
			<h3><span>상품문의</span></h3>
			<br>
			<!-- forEach 스세요 -->
			<c:set var="qna" value="${productQnaList }" />
			<c:choose>
			<c:when test="${empty productQnaList }">
				<p>등록된 게시물이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="productQnaNick" items="${productQnaList }">
				<div class="prdQnaContent">
					<p>${productQnaNick.qna_content }</p>
					<p>${productQnaNick.user_nickname }</p>
					<hr><br>
				</div>
				</c:forEach>
			</c:otherwise>
			</c:choose>
			
			<div class="prdInput">
			<br>
			<form action="#">
				<textarea></textarea>
				<input type="button" value="등록">
			</form>
			</div>
		</div>
	</div>
 






	<!-- -------------------------------- -->
<!-- footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</body>
</html>