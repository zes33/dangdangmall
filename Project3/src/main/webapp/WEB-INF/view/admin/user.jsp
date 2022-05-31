<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객정보조회</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
	#container { width: 900px; margin: auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
<div id="container">
		<div class="card border-success mb-3" style="max-width: 35rem;">
		  <div class="card-header"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><span class="h3"><strong>홍길동</strong></span><span><strong>님</strong></span>
		  	<span class="text-success position-absolute top-0 end-0"><strong>일반회원</strong></span><br>abc123@naver.com</font></font></div>
		  <div class="card-body">
		    <h4 class="card-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><strong>ID : </strong> ID1234</font></font></h4>
		    <p class="card-text"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
		    	<div><strong>닉네임 : </strong>홍길동이다</div><br>
		    	<div><strong>비밀번호 : </strong>홍길동pw</div><br>
				<div><strong>전화번호 : </strong>010-1234-4321</div><br>
		    	<div><strong>주소 : </strong>서울시 강남구 서초동</div><br>
		    	<div><strong>상세주소 : </strong>서초빌라 2동 201호</div><br>
		    	<div><strong>우편번호 : </strong>12345</div><br>
		    	<div><strong>포인트 : </strong>1,345p</div>
		    	<br>
		    	<p>
					<button type="button" class="btn btn-outline-secondary btn-sm">회원삭제</button>
				</p>
		    </font></font></p>
		  </div>
		</div>
	</form>
	<br>
	
</div>	
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>