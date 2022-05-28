<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	#container { width: 700px; margin: auto; }
	h1 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	
	.login
</style>
</head>
<body>
<!-- header -->
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>

<div id="container">
	
	<h1>로그인 [login.jsp]</h1>
	<form action="loginAction.do" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="user_id" placeholder="아이디"></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="text" name="user_pw" placeholder="비밀번호"></td>
		</tr>
		<tr>
			<td colspan="2" class="center login">
				<input type="submit" value="로그인">
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<a href="#">아이디 찾기</a>
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