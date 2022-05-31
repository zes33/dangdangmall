<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 완료</title>
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
<link href="common/styles.css" rel="stylesheet">
<!-- 여기까지 헤더링크 -->
<style>

#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
    margin-top: 100px;
    padding-bottom: 170px; /* footer의 높이 */
    padding-left: 200px;
    padding-right: 200px;
}

.jumbotron{
	text-align: center;
}
</style>
</head>
<body>
	<!-- header -->
<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
</header>
	<div id="body-wrapper">
		<div id="body-content" class="container">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="jumbotron">
					<h2>회원님의 아이디는</h2>
					<br /> <h1>${getUser.user_id}</h1><br />
					<h2>입니다</h2>
					<button type="button" class="btn btn-sm btn-outline-secondary"
						onclick="location.href='/member/loginView'">로그인페이지</button>
					<button type="button" class="btn btn-sm btn-outline-secondary"
						onclick="location.href='/board/list'">메인페이지</button>
				</div>
			</div>
			<!-- footer -->
			<footer>
				<jsp:include page="../common/footer.jsp"></jsp:include>
			</footer>
		</div>
</body>
</html>