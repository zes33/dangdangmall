<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.container { width: 700px; margin: auto; }
	h1 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	.center { text-align: center; }
	
	.login
</style>
</head>
<body>
<!-- header -->
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div id="body-wrapper">
	<div id="body-content" class="container">
	
	<h2>로그인</h2>
	<form action="loginAction.do" method="post">
	  아이디 <input type="text" class="form-control" placeholder="영문 소문자/숫자 포함 4~16자"
                     name="user_id" maxlength="20"><br/>
	 비밀번호 <input type="text" class="form-control" placeholder="비밀번호"
                   name="user_pw" maxlength="20"><br/>
				<input type="submit" value="로그인">
	<table>
		<tr>
			<a href="findIdView.do">아이디 찾기</a>
			<a href="#">비밀번호 찾기</a>
		</tr>
	</table>
	</form>

</div>

	<!-- footer -->
	<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>