<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 헤더 관련 링크는 아래 4개 -->
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="common/styles.css" rel="stylesheet">
<!-- 여기까지 헤더링크 -->

</head>
<style>
.css-zjik7 eth8ztg3 {
	width: 300px;
	margin-left: auto;
	margin-right: auto;
}

.material-icons.md-18 {
	font-size: 18px;
}

.material-icons.md-36 {
	font-size: 36px;
}
</style>
<body>
	<div class="blog-header py-3">
		<div class="container">
			<div
				class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-1 text-center"></div>
				<div class="col-10 d-flex justify-content-end align-items-center">

					<!-- 검색을 위한 폼 -->
					<form action="${pageContext.request.contextPath }/searchProduct/searchProductList.do" method="get">
						<table class="border-none">
							<tr>
								<td>
									<input type="text" name="searchKeyword"  id="searchKeyword" > 
									<!-- <input type="submit" value="검색">  --><%-- ${productListS}  --%>
									<button type="button" class="btn btn-block btn-success"
									onclick="goSearch();"> 검색</button>
								<script type="text/javascript">
                     			function goSearch() {
                     				var gett = document.getElementById("searchKeyword").value;
                     					alert(gett);
                     					location.href="${pageContext.request.contextPath }/searchProduct/searchProductList.do?searchKeyword="+gett; */
                     				}
                    			</script>
								</td>
							</tr>
						</table>
					</form>
					<a class="link-secondary" href="#" aria-label="Search"> <svg
							xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="none" stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
							viewBox="0 0 24 24">
							<title>Search</title><circle cx="10.5" cy="10.5" r="7.5" />
							
							<path d="M21 21l-5.2-5.2" /></svg>
					</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:choose>
						<c:when test="${empty user }">
							<a class="btn btn-sm btn-outline-secondary"
								href="${pageContext.request.contextPath }/login.do">로그인</a>&nbsp;&nbsp;
							<a class="btn btn-sm btn-outline-secondary"
								href="${pageContext.request.contextPath }/join.do">회원가입</a>&nbsp;&nbsp;
							<a class="btn btn-sm btn-outline-secondary"
								href="${pageContext.request.contextPath }/user/getCenterListPaging.do">고객센터</a>
						</c:when>
						<c:when test="${user.user_state eq 2}">
							<a class="btn btn-sm btn-outline-secondary"
								href="${pageContext.request.contextPath }/admin/adminMain.do">관리자뷰</a>&nbsp;&nbsp;
							<a class="btn btn-sm btn-outline-secondary"
								href="${pageContext.request.contextPath }/main.do">고객뷰</a>&nbsp;&nbsp;
							<a class="btn btn-sm btn-outline-secondary"
								href="${pageContext.request.contextPath }/logout.do">로그아웃</a>
						</c:when>
						<c:otherwise>
							<a class="right" href="#">${user.user_nickname }님</a>
							<br> &nbsp;&nbsp;&nbsp;&nbsp;
							<a class="btn btn-sm btn-outline-secondary"
								href="${pageContext.request.contextPath }/logout.do">로그아웃</a>&nbsp;&nbsp;
							<a class="btn btn-sm btn-outline-secondary"
								href="${pageContext.request.contextPath }/cart/list.do">장바구니
								<span class="material-icons md-36"> shopping_bag </span>(${count })
							</a>&nbsp;&nbsp;
							
							<a class="btn btn-sm btn-outline-secondary"
								href="${pageContext.request.contextPath }/myinfo.do">마이페이지</a>&nbsp;&nbsp;
							<a class="btn btn-sm btn-outline-secondary"
								href="${pageContext.request.contextPath }/user/getCenterList.do">고객센터</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class="container">
			<div
				class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
				<c:choose>
					<c:when test="${user.user_state eq 2}">
						<a class="blog-header-logo text-dark"
							href="${pageContext.request.contextPath }/admin/adminMain.do">
							<img alt="로고"
							src="${pageContext.request.contextPath }/img/logo1.png"
							width="500" height="200" />
						</a>
					</c:when>
					<c:otherwise>
						<a class="blog-header-logo text-dark"
							href="${pageContext.request.contextPath }/main.do"> <img
							alt="로고" src="${pageContext.request.contextPath }/img/logo1.png"
							width="500" height="200" /></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- <ul class="nav nav-pills justify-content-center">
				<li class="nav-item"><a href="#" class="nav-link active"
					aria-current="page">홈</a></li>
				<li class="nav-item"><a href="#" class="nav-link">Features</a></li>
				<li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
				<li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
				<li class="nav-item"><a href="#" class="nav-link">About</a></li>
				<li class="nav-item"><a href="#" class="nav-link">About</a></li>
			</ul> -->

		<style data-emotion="css swv69e">
.css-swv69e {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	margin: 12px 0 0;
	padding: 0 50px;
}
</style>
		<div class="css-swv69e emr7dkj2">
			<style data-emotion="css zjik7">
.css-zjik7 {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
}
</style>
			<div class="col-sm-8 navCenter">
				<style>
.navCenter {
	margin: auto;
}
</style>
				<ul class="css-zjik7 eth8ztg3">
					<style data-emotion="css 1a76w4f">
.css-1a76w4f {
	padding-right: 22px;
}

.css-1a76w4f:hover .eth8ztg2 {
	border-bottom-color: #000000;
}

.css-1a76w4f:hover .eth8ztg1 {
	display: block;
}

ul {
	list-style: none;
}
</style>
					<li class="css-1a76w4f eth8ztg0">
						<style data-emotion="css 3bho95">
.css-3bho95 {
	border-bottom: 4px solid transparent;
	padding: 6px 0;
	font-size: 26px;
	font-weight: 600;
	color: #000000;
	cursor: pointer;
}

@media screen and (max-width: 1280px) {
	.css-3bho95 {
		font-size: 14px;
	}
}

.hi {
	text-decoration: none;
	color: black;
	margin-left: 10px;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
						<div class="css-3bho95 eth8ztg2">
							<a class="hi" href="#">홈</a>
						</div>
					</li>
					<li class="css-1a76w4f eth8ztg0">
						<div class="css-3bho95 eth8ztg2">
							<a class="hi" href="#">신상품</a>
						</div>
					</li>
					<li class="css-1a76w4f eth8ztg0">
						<div class="css-3bho95 eth8ztg2">
							<a class="hi" href="paging.do?prd_c=1">식품</a>
						</div>
					</li>
					<li class="css-1a76w4f eth8ztg0">
						<div class="css-3bho95 eth8ztg2">
							<a class="hi" href="paging.do?prd_c=2">운동</a>
						</div>
					</li>
					<li class="css-1a76w4f eth8ztg0">
						<div class="css-3bho95 eth8ztg2">
							<a class="hi" href="#">특가</a>
						</div>
					</li>
					<li class="css-1a76w4f eth8ztg0">
						<div class="css-3bho95 eth8ztg2">
							<a class="hi" href="#">새벽배송</a>
						</div>
					</li>
				</ul>

			</div>

		</div>
	</div>
	</header>
	</div>
</html>