<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객목록 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<style>

#container { width: 1200px; margin: auto; }
h1, h3, p { text-align: center; }
table { border-collapse: collapse; }
table, th, td {
	border: 1px solid black;
	margin: 0 auto;
}
.center { text-align: center; }

.border-none, .border-none td { border: none; }

.container {
 	position: relative;
}
#ss {
	width: 100px;
}

.menuname {
	position:relative;
	top: 35px;
	left: -25px;
	border: 1px solid LightGray;
	border-radius: 7px;
	width: 1170px;
	height: 140px;
	font-family: "Audiowide", sans-serif;	
}
.centers {
  display: flex;
  justify-content: center;
  align-items: center;
}
.contents {
	position:relative;
	left: 0px;
	top: 48px;
	width: 1145px;
	height: 600px;
}

.padding{
	padding-left: 30px;
}
</style>
</head>
<body>
	<header>
      <jsp:include page="../common/header.jsp"></jsp:include>
   </header>
   
	<div class="container">
   <jsp:include page="sidebarTemplate.jsp"></jsp:include>
   	<div class="menuname h1 text-center centers" style="background-color:rgb(240, 240, 240);">
   		<strong style="font-size:3vw">&lt; 회원정보 조회 &gt;</strong>
   	</div>
	<!-- 검색을 위한 폼 -->
	<!-- <form action="getBoardList.do" method="get">  -->
	<div class="contents">
	<form>
		<input type="hidden" name="seq" value="#">
	<table class="border-none">
		<tr>
			<td>	 
				<select name="searchCondition">
					<option value="TITLE">ID</option>
					<option value="CONTENT">이름</option>
				</select>
				<input type="text" name="searchKeyword">
				<button type="button" class="btn btn-outline-secondary btn-sm" id="ss">검색</button>
				<!-- <input type="submit" value="검색"> -->	
			</td>
		</tr>	
	</table>
	</form>
	<!-- 데이터 표시 영역 -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th width="100" class="center">ID</th>
				<th width="200" class="center">이름</th>
				<th width="150" class="center">닉네임</th>
				<th width="150" class="center">회원등급</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<!-- <td><button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#demo">Simple collapsible</button></td>  -->
				<td class="center"><a class="btn btn-white text-decoration-none text-dark" data-toggle="collapse" data-target=".demo">ID1234</a></td>
				<td class="center"><a href="adminUser.do" class="text-decoration-none text-dark">홍길동</a></td>
				<td class="center"><a href="adminUser.do" class="text-decoration-none text-dark">홍길동입니다</a></td>
				<td class="center"><a href="adminUser.do" class="text-decoration-none text-dark">일반회원</a></td>
			</tr>
			
			<tr>
				<tr class="demo collapse">
					<th class="center">이메일</th>
					<th class="center">전화번호</th>
					<th class="center">주소</th>
					<th class="center">상세주소</th>
				</tr>
				<tr class="demo collapse">
					<td class="center">test123@naver.com</td>
					<td class="center">010-1234-1234</td>
					<td class="center">서울시 서초구</td>
					<td class="center">어디빌라어디동어디호</td>
				</tr>
		</tbody>
	</table>
</div>	
</div>
	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>