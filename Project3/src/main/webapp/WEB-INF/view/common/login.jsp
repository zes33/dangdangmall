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

#body-wrapperr {
    min-height: 100%;
    position: relative;
}

#body-contentt {
	background-color : #F3F3F3;
	width: 500px;
	height: 450px;
    margin-top: 60px;
    padding-bottom: 170px; /* footer의 높이 */
    padding-left: 300px;
    padding-right: 300px;
}
	.container1 { width: 700px; margin: auto; }
	.right { 
	text-align: center; 
	width: 250px;
	height: 40px;
	
	}
	.bbtt {
	position: absolute;
	top: 330px;
	left: -128px;
	}
	.log {
		position: relative;
		left: -138px;
	}
	.foo {
		position: absolute;
	}
	.idpw {
  text-decoration: none;
	}
</style>
</head>
<body>
<!-- header -->
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div id="body-wrapperr">
	<div id="body-contentt" class="container1">
	
	<br>
	<form action="loginAction.do" method="post" class="foo">
	<div class="log">
	<br/>
	<h2 style="margin-left: 88px;"><strong>로그인</strong></h2><br>
	  아이디 <input type="text" class="form-control" placeholder="아이디" style="width:250px;"
                     name="user_id" maxlength="20"><br/>
	 비밀번호 <input type="password" class="form-control" placeholder="비밀번호" style="width:250px;"
                   name="user_pw" maxlength="20"><br/>
         
			<input class="right btn btn-outline-success" type="submit" value="로그인"><p style="color: red;">${msg }</p>
			</div>
				<br/><br/>
	<table class="bbtt">
		<tr>
		<!-- <a onClick="history.back();">돌아가기 </a> -->
		<td>
			<a class="idpw text-dark" href="findPwdView.do">비밀번호 찾기</a> <span class="text-black-50">&nbsp;<small> | </small>&nbsp;</span>
			<a class="idpw text-dark" href="findIdView.do">아이디 찾기</a>
		</td>
			<!-- <a class="right btn btn-sm btn-outline-secondary" href="findPwdView.do" style="padding-left : 10px;">비밀번호 찾기</a>
			<a class="right btn btn-sm btn-outline-secondary" href="findIdView.do">아이디 찾기</a>  -->
		</tr>
	</table>
	</form>
</div>
</div>

	<!-- footer -->
	<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
	/* function goBack(){
		//뒤로갈 히스토리가 있으면,
		if ( document.referrer ) { 
			// 뒤로가기
			alert("히스토리 있음");
			history.go(-1);
		}

		// 히스토리가 없으면,
		else { 
			// 메인 페이지로
			alert("히스토리 없음");
			location.href = "/main.do";
		}
	}  */
	
	</script>
</body>
</html>