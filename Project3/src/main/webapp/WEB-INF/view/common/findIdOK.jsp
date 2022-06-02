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
			<div class="container">
			<a href="#"><img src="./img/아이디찾기.png" alt="아이디찾기로고" width="450"></a>
			<div><strong>아이디 찾기</strong>가 완료되었습니다</div><br>
		<div class="card border-success mb-3" style="max-width: 30rem; max-width: 600px;">
		  <div class="card-header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><div class="text-center h4"><strong>${getUser.user_id}</strong></div>
		  <hr>
		  <div class="text-center">
		  	<button type="button" class="btn btn-outline-success">로그인 하러가기</button>
			<button type="button" class="btn btn-outline-secondary">비밀번호 찾기</button>
		  </div>
		  </font></font></div>
		</div>
		</div>
			<!-- footer -->
			<footer>
				<jsp:include page="../common/footer.jsp"></jsp:include>
			</footer>
		</div>
</body>
</html>