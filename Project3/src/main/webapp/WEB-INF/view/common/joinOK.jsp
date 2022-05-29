<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
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
	<p>${user.user_nickname }님의 회원가입이 성공적으로 완료되었습니다.</p>
	 <a class="button" href="login.do">로그인</a>
	 <a class="button" href="#">메인화면으로 이동</a>
</div>


<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</footer>

</body>
</html>