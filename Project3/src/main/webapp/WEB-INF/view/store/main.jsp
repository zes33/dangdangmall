<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
function productDetailView(productid){
    let f = document.createElement('form');
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'productid');
    obj.setAttribute('value', productid);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    //f.setAttribute('action', 'view.do');
    document.body.appendChild(f);
    f.submit();
}
</script>
</head>
<body>
	<!-- header -->
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>

</header>
	<main>
	
		<div>
			<a href="cart/cart.do">장바구니 페이지 </a><br>
			<a href="tempPrd/tempPrd.do">상품상세 페이지(임시)</a>
			<a href="admin/admin.do">관리자 메인페이지(임시)</a>
		</div>
		<h1 class="visually-hidden">Headers examples</h1>
		<div class="album py-5 bg-light">
			<div class="container" >

				<h1>식품</h1><br>
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<!-- forEach 시작~ -->
				<!-- <a href="javascript:productDetailView('${list.productid}')"> -->
					<div class="col" style=" cursor: pointer;" onclick="location.href='#';">
						<div class="card shadow-sm">
							<img src="./img/고무밴드.jpg" class="bd-placeholder-img card-img-top" width="100%"
								height="225" >
							<div class="card-body">
								<p class="card-text">여긴 상품명-----</p>
								<div class="d-flex justify-content-between align-items-center">
									<div>
										<span>할인혜택가</span>
										<span><strike>19,000원</strike></span><br>
										<span>90%</span>
										<span><a href="#">9,000원</a></span>
									</div>
									<!-- <small class="text-muted">9 mins</small> -->
								</div>
							</div>
						</div>
					</div>
				<!-- </a> -->
				</div>
				<br><br><br>
				<h1>운동</h1><br>
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<!-- forEach 시작~ -->
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%"
								height="225" xmlns="http://www.w3.org/2000/svg" role="img"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false">
							<title>Placeholder</title><rect width="100%" height="100%"
									fill="#55595c" />
							<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

							<div class="card-body">
								<p class="card-text">여긴 상품명-----</p>
								<div class="d-flex justify-content-between align-items-center">
									<div>
										<span>할인혜택가</span>
										<span><strike>19,000원</strike></span><br>
										<span>90%</span>
										<span><a href="#">9,000원</a></span>
									</div>
									<!-- <small class="text-muted">9 mins</small> -->
								</div>
							</div>
						</div>
					</div>
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