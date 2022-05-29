<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>

html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}

#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
	background-color: #F5F5F5;
    margin-top: 100px;
    padding-bottom: 170px; /* footer의 높이 */
    padding-left: 430px;
}

footer {
    width: 100%;
    height: 160px; /* footer의 높이 */
    position: absolute;  
    bottom: 0;
    left: 0;
}

.form-group{
	padding: 15px;
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
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="joinAction.do">
					<h3 style="text-align: center;">회원 정보 입력</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디(영문 소문자/숫자 포함 4~16자)"
							name="user_id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="비밀번호"
							name="user_pw" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="비밀번호 확인"
							 maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="user_name" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="닉네임"
							name="user_nickname" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="e-mail"
							name="user_email" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="연락처"
							name="user_phone" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="회원가입">
				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
	<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</div>
</body>
</html>