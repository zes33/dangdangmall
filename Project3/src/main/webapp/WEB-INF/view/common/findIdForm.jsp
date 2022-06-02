<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
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
	<!-- 
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
	-->
	<div class="container">
			<a href="#"><img src="./img/아이디찾기.png" alt="아이디찾기로고" width="450"></a>
			<div class="h5"><strong>아이디를 모르시나요?</strong></div>
			<p><small>이메일을 입력해주세요!</small></p>
		<div class="card border-success mb-3" style="max-width: 30rem; max-width: 600px;">
		  <div class="card-header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
		  <div class="text-center">
		  <form class="user" action="findIdAction.do" method="POST">
	  		<fieldset>
				    <div class="form-group">
				      <label for="exampleInputEmail1" class="form-label mt-4"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이메일 주소</font></font></label>
				      <input type="email" class="form-control form-control-user" id="user_email" aria-describedby="emailHelp" placeholder="이메일 주소 전체를 입력해주세요." style="width: 500px">
				      <small id="emailHelp" class="form-text text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">귀하의 이메일을 다른 사람과 공유하지 않습니다.</font></font></small>
				    </div>
			</fieldset>
		  </form>
		  <hr>
		  	<input type="submit" class="btn btn-outline-success"
				value="아이디 찾기">
		  </div>
		  </font></font></div>
		</div>
		<p>비밀번호가 기억나지 않는다면? <a href="#">비밀번호 찾기 바로가기</a></p>
		</div>
	
	
	
	<!-- footer -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>