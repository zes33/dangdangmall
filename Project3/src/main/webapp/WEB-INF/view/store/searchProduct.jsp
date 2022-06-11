<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색</title>
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- css 스크립트 삽입 -->
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
    f.setAttribute('action', '${pageContext.request.contextPath }/viewPrdDetail.do'); 
    document.body.appendChild(f);
    f.submit();
}
</script>
<style type="text/css">
.in {display: inline;
	
}
</style>
</head>
<body>

	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div class="container">
		<h1  class="in"> '</h1><h1 class="in" style="color:red;"> ${searchKeyword }</h1><h1 class="in"> ' 에 대한 검색 결과 </h1> 
	</div>
	<br>
		<div class="album py-5 bg-light">
	<div class="text-center">
			<c:if test="${empty productListS}">
			<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
width="192" height="192"
viewBox="0 0 24 24"
style=" fill:#undefined;"><path d="M22 20L20 22 14 16 14 14 16 14z"></path><path d="M9,16c-3.9,0-7-3.1-7-7c0-3.9,3.1-7,7-7c3.9,0,7,3.1,7,7C16,12.9,12.9,16,9,16z M9,4C6.2,4,4,6.2,4,9c0,2.8,2.2,5,5,5 c2.8,0,5-2.2,5-5C14,6.2,11.8,4,9,4z"></path><path d="M13.7 12.5H14.7V16H13.7z" transform="rotate(-44.992 14.25 14.25)"></path></svg>
				<br /><br>
				<h2> 상품을 찾을 수 없습니다.</h2>
				<br />
				<p> 이용에 불편을 드려 대단히 죄송합니다.</p>
			</c:if>
		</div>

	
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
				<!-- forEach 시작~ -->
				<c:forEach var="product" items="${productListS }">
				<c:if test="${empty productListS}">
				<br />
				<h2>찾으시는 상품이 없습니다</h2>
				<br />
				<br />
			</c:if>
			<c:if test="${not empty productListS}">
				
					<div class="col" style="cursor: pointer;"
						<%-- onclick="productDetailView(${product.product_id})"> --%>
						onclick="location.href='${pageContext.request.contextPath }/viewPrdDetail.do?product_id=${product.product_id}'">
							
						<div class="card shadow-sm">
							<img src="${pageContext.request.contextPath }/img/${product.product_pic}"
								class="bd-placeholder-img card-img-top" width="100%"
								height="225">
							<div class="card-body">
								<p class="card-text">${product.product_name }</p>
								<div class="d-flex justify-content-between align-items-center">
									<div>
										<c:choose>
											<c:when test="${0 eq product.product_discount }">
												<%-- <br>
											<span>${product.product_price }원</span> --%>
												<span class="testcost">
													<!-- 원가 --> <fmt:formatNumber
														value="${product.product_price }" pattern="#,###" />
												</span>
												<span class="won">원</span>
											</c:when>
											<c:otherwise>
												<span class="testdcPrice">
													<!-- 할인가 --> <fmt:formatNumber
														value="${product.product_price * (1- product.product_discount) }"
														pattern="#,###" />
												</span>
												<span class="won">원</span>
												<span> <strike class="testPct"> <fmt:formatNumber
															value="${product.product_price }" pattern="#,###" />원
												</strike>
												</span>
												<span class="testdiscountPct"> <fmt:formatNumber
														value="${product.product_discount * 100}" pattern="#,###" />%
												</span>
											</c:otherwise>
										</c:choose>
									</div>
									<!-- <small class="text-muted">9 mins</small> -->
								</div>
							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>
			</div>
			<br>
			<br>
			<br>

		</div>
	</div>



	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script>
		
	</script>
	<!-- <div class="last_block"></div> -->
</body>
</html>