<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	background-color : #F3F3F3;
    margin-top: 100px;
    padding-bottom: 170px; /* footer의 높이 */
    padding-left: 300px;
    padding-right: 300px;
}
	.container { width: 700px; margin: auto; }
	h1 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	.right { 
	text-align: center; 
	float: right;
	}
	.search{
	padding-left: 15px;
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
	<br/><br/>
	<h2>로그인</h2>
	<form action="loginAction.do" method="post">
	  아이디 <input type="text" class="form-control" placeholder="아이디"
                     name="user_id" maxlength="20"><br/>
	 비밀번호 <input type="text" class="form-control" placeholder="비밀번호"
                   name="user_pw" maxlength="20"><br/>
				<input class="right" type="submit" value="로그인"><p style="color: red;">${msg }</p>
				<br/><br/>
	<table class="search">
		<tr>
			<a class="right btn btn-sm btn-outline-secondary" href="findPwdView.do" style="padding-left : 10px;">비밀번호 찾기</a>
			<a class="right btn btn-sm btn-outline-secondary" href="findIdView.do">아이디 찾기</a>
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