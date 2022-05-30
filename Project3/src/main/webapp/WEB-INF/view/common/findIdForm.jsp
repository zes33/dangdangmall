<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<input type="submit" class="btn btn-primary btn-user btn-block"
			value="아이디 찾기">
	</div>
	</form>
	<div class="text-center">
	<a href="login.do" class="btn btn-facebook btn-user btn-block h4 text-gray-900 mb-2">
		Login </a>
	<hr>
		<a class="small" href="main.do">메인페이지</a>
	</div>
	<!-- footer -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>