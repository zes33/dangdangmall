<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 완료</title>
</head>
<body>
	<h3>findIdOK.jsp</h3>
	<div class="card o-hidden border-0 shadow-lg my-5">



		<div class="jumbotron">
			<h2>아이디는 :</h2>
			<br />
			<ul>
					<li>${user}</li>
			</ul>
			<h2>입니다</h2>
			<button type="button" class="btn btn-primary"
				onclick="location.href='/member/loginView'">로그인페이지</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='/board/list'">메인페이지</button>


		</div>
</body>
</html>