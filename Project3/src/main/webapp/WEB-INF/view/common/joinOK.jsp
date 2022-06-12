<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
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
div{
	text-align: center;
}

 .button:link, .button:visited {
     background-color: #9D968F;
     color: maroon;
     padding: 15px 25px;
     text-align: center;
     text-decoration: none;
     display: inline-block;
}
 .button:hover, .button:active {
     background-color: #97c390;
}
</style>
</head>
<body>
<!-- header -->
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>

<div>
	<h3>회원가입이 완료 되었습니다.</h3>
	<p>${joinUser.user_nickname }님의 회원가입이 성공적으로 완료되었습니다.</p>
	 <a class="btn btn-sm btn-outline-secondary" href="login.do">로그인</a>
	 <a class="btn btn-sm btn-outline-secondary" href="main.do">메인화면으로 이동</a>
</div>


<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</footer>

</body>
</html>