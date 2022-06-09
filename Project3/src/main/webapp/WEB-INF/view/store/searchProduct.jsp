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
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
				<!-- forEach 시작~ -->
				<c:forEach var="product" items="${productListS }">
					<div class="col" style="cursor: pointer;"
						onclick="productDetailView(${product.product_id})">
						<div class="card shadow-sm">
							<img src="${pageContext.request.contextPath }/img/셀러드.jpg"
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
	<div class="last_block"></div>
</body>
</html>