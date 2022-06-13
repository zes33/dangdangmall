<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
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
.categoryName {
	text-decoration: none;
	color: black;
	font-weight: 550;
	font-size: 50px;
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
		<h1 class="visually-hidden">Headers examples</h1>
		<div class="album py-5 bg-light">
			<div class="container" >
				<c:choose>
				<c:when test="${1 eq prd_c }">
				<div class="cat">
					<p class="categoryName">식품</p>
				</div>
				</c:when>
				<c:otherwise>
					<p class="categoryName">운동</p>
				</c:otherwise>
				</c:choose>
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
				<!-- forEach 시작~ -->
				<c:forEach var="product" items="${viewProduct }">
					<div class="col" style=" cursor: pointer;"
					 onclick="location.href='viewPrdDetail.do?product_id=${product.product_id}'">
					 <%-- onclick="productDetailView(${product.product_id})"> --%>
					 
						<div class="card shadow-sm">
							<img src="${pageContext.request.contextPath }/img/${product.product_pic}" class="bd-placeholder-img card-img-top" width="100%"
								height="225" >
							<div class="card-body">
								<p class="card-text">${product.product_name }</p>
								<div class="d-flex justify-content-between align-items-center">
									<div>
										<c:choose>
										<c:when test="${0 eq product.product_discount }">
											<%-- <br>
											<span>${product.product_price }원</span> --%>
											<span class="testcost"><!-- 원가 -->
											<fmt:formatNumber value="${product.product_price }" pattern="#,###" />
											</span>
											<span class="won">원</span>
										</c:when>
										<c:otherwise>
											 <span class="testdcPrice"><!-- 할인가 -->
												<fmt:formatNumber value="${product.product_price * (1- product.product_discount) }" pattern="#,###" />
											</span>
											<span class="won">원</span>
											<span>
												<strike class="testPct" >
													<fmt:formatNumber value="${product.product_price }" pattern="#,###" />원
												</strike>
											</span>
											<span class="testdiscountPct">
												<fmt:formatNumber value="${product.product_discount * 100}" pattern="#,###" />%
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
				
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  
				  
				  <c:if test="${paging.startPage != 1 }">
				    <li class="page-item">
				      <a class="page-link" href="paging.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&prd_c=${prd_c}"
				       aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				   </c:if> 
				   
				   <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li class="page-item"><b class="page-link" >${p }</b></li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
				    			<li class="page-item"><a class="page-link" href="paging.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&prd_c=${prd_c}">${p }</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				   
				    <c:if test="${paging.endPage != paging.lastPage }">
				    <li class="page-item">
				      <a class="page-link" href="paging.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}&prd_c=${prd_c}" aria-label="Previous">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				   </c:if> 
				    
				  </ul>
				</nav>
				
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