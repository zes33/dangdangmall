<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<style>
.totPage {
	margin: auto;
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
	padding: 30px;
}

.productInfo {
	background-color: pink;
}

textarea {
	width: 1040px;
	height: 100px;
}

.prdInfoPic {
	width: 1040px;
}

.d-grid {
	padding-top: 15px;
}
</style>
<body>
	<script>
		$(function() {
			$(document).ready(function() {
				$('select[name=product_cnt]').change(function() {
					$('#product_cnt').val($(this).val());
						$("#product_cnt").attr("readonly", true);
					}
				});
			});
		});
	</script>
	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<!-- -------------------------------- -->
	${user_id }

	<div class="totPage">
		<div>
			<div class="card-photo">
				<img src="../img/고무밴드.jpg" alt="..." class="mainPic">
			</div>
			<div class="prdNamePrice">
				<h1>세션 테스트 : ${product.product_name }</h1>
				<h1>
					<span>${product.product_name }</span>
				</h1>
				<c:choose>
					<c:when test="${0 eq product.product_discount }">
						<h3>
							<span>${product.product_price }</span>
						</h3>
					</c:when>
					<c:otherwise>
						<span><strike>${product.product_price * (1- product.product_discount)}원</strike></span>
					</c:otherwise>
				</c:choose>

				<p>
					<span>식품</span>
				</p>
				<form action="cart/insert.do" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="product_id"
						value="${product.product_id}"> <input type="hidden"
						id="product_cnt" value="product_cnt"> <input type="hidden"
						name="user_id" value="${user_id}">
					<!-- <input type="hidden" name="product_id" value="88"> -->

					<div>
					<h3>수량선택</h3>
					<select name="cart_product_qty"  style="font-size:30px;" >
						<option value="1" selected>1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
					</select>
					</div>
					<div class="d-grid gap-2">
						<input class="btn btn-primary" type="submit" value="장바구니">
						<input class="btn btn-primary" type="submit" value="구매하기">
					</div>
				</form>
			</div>
		</div>
		<div class="productInfo">
			<img src="../img/고무밴드.jpg" alt="..." class="prdInfoPic">
		</div>
		<br> <br> <br>
		<div class="reviewZone">
			<hr>
			<h3>
				<span>상품후기</span>
			</h3>
			<p>
				<a>베스트순 </a><a> 최신순</a>
			</p>
			<!-- forEach 쓰걸아 -->
			<div class="reviewComment">
				<div>
					<p>아이디:id</p>
				</div>
				<p>
					<span>맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절</span>
				</p>
				<hr>
			</div>
		</div>
		<br> <br>
		<div class="prdQnaZone">
			<h3>
				<span>상품문의</span>
			</h3>
			<br>
			<!-- forEach 스세요 -->
			<c:set var="qna" value="${productQnaList }" />
			<c:choose>
				<c:when test="${empty productQnaList }">
					<p>등록된 게시물이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="productQnaNick" items="${productQnaList }">
						<c:choose>
							<c:when test="${0 eq productQnaNick.q_or_a }">
								<div class="prdQnaContent">
									<p>${productQnaNick.qna_content }</p>
									<p>${productQnaNick.user_nickname }</p>
									<hr>
								</div>
							</c:when>
							<c:otherwise>
								<div class="prdQnaContent">
									<p>&nbsp;&nbsp;&nbsp;[답변완료] ${productQnaNick.qna_content }</p>
									<hr>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${empty user }">
					<p>상품문의는 로그인 후 가능합니다.</p>
					<%-- <a href="login.do?product_id=${product.product_id }">로그인 하기</a> --%>
					<form action="login.do">
					<input type="submit" value="로그인">
					</form>
				</c:when>
				<c:otherwise>
					<div id="prdQnaWrite" class="prdInput">
						<form id="prdQnaForm"
							action="insertPrdQna.do?product_id=${product.product_id }"
							method="post">
							<textarea name="qna_content"></textarea>
							<button type="button" id="testBtn" onclick="writeQna()">상품문의
								등록</button>
						</form>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script>
		function writeQna() {
			console.log("writeQna() 실행~~")
			var contentBlank = $("#prdQnaForm").children("textarea").val()
					.trim();
			console.log("contentBlank : " + contentBlank);
			if (contentBlank.length == 0) {
				alert("내용이 없어요.")
			} else {
				document.forms[1].submit();
			}
		}
		
	</script>





	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>