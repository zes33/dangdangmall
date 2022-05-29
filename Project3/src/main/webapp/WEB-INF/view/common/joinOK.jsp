<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
<!-- header -->
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>

<div>
	<h1>회원가입이 완료 되었습니다.</h1>
	<p>${joinUser }</p>
</div>


<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</footer>

</body>
</html>