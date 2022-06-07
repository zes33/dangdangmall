<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작페이지</title>
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
<script>
function productDetailView(product_id){
    let f = document.createElement('form');
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'product_id');
    obj.setAttribute('value', product_id);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'viewPrdDetail.do');
    document.body.appendChild(f);
    f.submit();
}
</script> 
<style>
.categoryName {
	text-decoration: none;
	color: black;
	font-weight: 550;
	font-size: 50px;
}
.cost {
	font-size: 25px;
	font-weight: 700;
	
	background-color: orange;
}
.discountInfo {
	color: #F74E2C;
	font-weight: 700;
}
strike {
	color: #B7B7B7;
	
	font-weight: 700;
}
.discountPct {
	font-size: 25px;
	font-weight: 700;
	color: #F74E2C;
}
.discountCost {
	font-size: 25px;
	font-weight: 700;
}




.testcost {
	font-weight: 700;
	font-size: 20px;
}
.testdcPrice {
	font-weight: 700;
	font-size: 20px;
}
.testPct {
	font-size: 18px;
}

.testdiscountPct {
	font-size: 19px;
	color: #F74E2C;
	font-weight: 700;
}

.cat {
	margin-bottom: 15px;
}

</style>
</head>
<body>
	<!-- header -->
<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
</header>
	<main>
		<!-- <div>
			<a href="admin/admin.do">관리자 메인페이지(임시)</a><br>
			<a href="viewMypage.do"><b>마이페이지(임시)</b></a>
		<a href="adminRefund/adminRefundView.do">관리자 메인페이지(임시)</a><br>
		</div> -->
		
		<h1 class="visually-hidden">Headers examples</h1>
		<div class="album py-5 bg-light">
			<div class="container" >
			
				<div class="cat">
				<a class="categoryName" href="paging.do?prd_c=1">식품  &gt;</a><br>
				</div>
				
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
				<!-- forEach 시작~ -->
				<c:forEach var="food" items="${foodList }" begin="0" end="3">
					<div class="col" style="cursor: pointer;" onclick="productDetailView(${food.product_id})">
						<div class="card shadow-sm">
							<img src="${pageContext.request.contextPath }/img/셀러드.jpg" class="bd-placeholder-img card-img-top" width="100%"
								height="225" >
							<div class="card-body">
									<p class="card-text">${food.product_name }</p>
								<div class="d-flex justify-content-between align-items-center">
									<div>
										<c:choose>
										<c:when test="${0 eq food.product_discount }">
											<span class="testcost"><!-- 원가 -->
											<fmt:formatNumber value="${food.product_price }" pattern="#,###" />
											</span>
											<span class="won">원</span>
										</c:when>
										<c:otherwise>
											<span class="testdcPrice"><!-- 할인가 -->
												<fmt:formatNumber value="${food.product_price * (1- food.product_discount) }" pattern="#,###" />
											</span>
											<span class="won">원</span>
											<span>
												<strike class="testPct" >
													<fmt:formatNumber value="${food.product_price }" pattern="#,###" />원
												</strike>
											</span>
											<span class="testdiscountPct">
												<fmt:formatNumber value="${food.product_discount * 100}" pattern="#,###" />%
											</span>
										</c:otherwise>
										</c:choose>
									</div>
									<!-- <small class="text-muted">9 mins</small> -->
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				<br><br><br>
				<div class="cat">
					<a class="categoryName" href="paging.do?prd_c=2">운동   &gt;</a><br>
				</div>
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
				<!-- forEach 시작~ -->
				<c:forEach var="exercise" items="${exerciseList }" begin="0" end="3">
					<div class="col" style="cursor: pointer;" onclick="productDetailView(${exercise.product_id})">
						<div class="card shadow-sm">
							<img src="${pageContext.request.contextPath }/img/아령세트.jpg" class="bd-placeholder-img card-img-top" width="100%"
								height="225" >
							<div class="card-body">
									<p class="card-text">${exercise.product_name }</p>
								<div class="d-flex justify-content-between align-items-center">
									<div>
										<c:choose>
										<c:when test="${0 eq exercise.product_discount }">
											<span class="testcost"><!-- 원가 -->
											<fmt:formatNumber value="${exercise.product_price }" pattern="#,###" />
											</span>
											<span class="won">원</span>
										</c:when>
										<c:otherwise>
											<span class="testdcPrice"><!-- 할인가 -->
												<fmt:formatNumber value="${exercise.product_price * (1- exercise.product_discount) }" pattern="#,###" />
											</span>
											<span class="won">원</span>
											<span>
												<strike class="testPct" >
													<fmt:formatNumber value="${exercise.product_price }" pattern="#,###" />원
												</strike>
											</span>
											<span class="testdiscountPct">
												<fmt:formatNumber value="${exercise.product_discount * 100}" pattern="#,###" />%
											</span>
											
										</c:otherwise>
										</c:choose>
									</div>
									<!-- <small class="text-muted">9 mins</small> -->
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
	</main>
		
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