<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="common/styles.css" rel="stylesheet">
<!-- 여기까지 헤더링크 -->

<style>
.form-control{
	margin: auto;
}
</style>
</head>
<body>
	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<script type="text/javascript">
</script>
	<div class="text-center">
		<h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1>
		<p class="mb-4">이메일을 입력해주세요!</p>
	<form class="user" action="findIdAction.do" method="POST">
		<div class="form-group">
			<input type="text" class="form-control form-control-user"
				id="user_email" aria-describedby="emailHelp" name="user_email"
				placeholder="Enter Email Address" style="width: 600px">
		</div>
		<input type="submit" class="btn btn-sm btn-outline-secondary"
			value="아이디 찾기">
	</div>
	</form>
	<div class="text-center">
	<a href="login.do" class="btn btn-sm btn-outline-secondary">
		Login </a>
	<hr>
		<a class="btn btn-sm btn-outline-secondary" href="main.do">메인페이지</a>
	</div>
	<!-- footer -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>