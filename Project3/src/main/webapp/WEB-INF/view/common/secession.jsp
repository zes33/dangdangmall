<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴</title>
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
<script src="resources/jQuery/jquery-3.4.1.min.js"></script>
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
    margin-top: 100px;
    padding-bottom: 170px; /* footer의 높이 */
    padding-left: 200px;
    padding-right: 200px;
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

#delFrm{
	background-color: #F3F3F3;
	padding: 20px;
	text-align: center;
}

#secession{
	float: right;
}

.element{
	padding: 10px;
	padding-left: 250px;
}

.ajax{
	padding-top: 0px;
	padding-left: 80px;
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
	<h1>회원탈퇴</h1>
	<hr />
	<form action="secessionProc.do" name="delFrm" id="delFrm" method="post">
		<table>
			<tr>
				<td class="element">아이디</td>
				<td><input type="text" name="user_id" value="${user.user_id}" readonly></td>
			</tr>
			<tr>
				<td class="element">패스워드</td>
				<td><input type="password" name="user_pw" id="user_pw"></td>
			</tr>
			<tr>
				<td class="element">패스워드 확인</td>
				<td><input type="password" name="passwdCheck" id="passwdCheck"></td>
			</tr>
			<tr><p style="color: red;">${msg }</p></tr>
			<tr>
				<td colspan=2 align="center"><input id="secession" type="submit" value="탈퇴하기"></td>
				<td colspan=2 align="right"><a href="${pageContext.request.contextPath }/main.do">메인페이지로 돌아가기</a></td>
			</tr>
		</table>
	</form>
	</div>
	<hr>
	<!-- footer -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	</div>
	  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="js/bootstrap.js"></script>
</body>

<script type="text/javascript">
	$(document).ready(function(e){
		$('#secession').click(function(){
			
			//패스워드 입력 확인
			if($('#user_pw').val() == ''){
				alert("패스워드를 입력해 주세요.");
				$('#user_pw').focus();
				return;
			}else if($('#passwdCheck').val() == ''){
				alert("패스워드를 입력해 주세요.");
				$('#passwdCheck').focus();
				return;
			}
			
			//입력한 패스워드가 같은지 체크
			if($('#passwdCheck').val() != $('#user_pw').val()){
				alert("패스워드가 일치하지 않습니다.");
				$('#passwdCheck').focus();
				return;
			}
			
			//패스워드 맞는지 확인
/* 			$.ajax({
				url: "${pageContext.request.contextPath}/passCheck.do",
				type: "POST",
				data: $('#delFrm').serializeArray(),
				success: function(data){
					if(data==0){
						alert("패스워드가 틀렸습니다.");
						return;
					}/*else {
						//탈퇴
						var result = confirm('정말 탈퇴 하시겠습니까?');
						if(result){
							$('#delFrm').submit();
						}
					}
				},
				error: function(){
					alert("서버 에러.");
				} */
			});
		});
	});
</script>
</html>