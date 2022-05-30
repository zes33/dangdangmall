<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터(고객문의목록)</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
	#container { width: 700px; margin: auto; }
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
	<!-- 검색을 위한 폼 -->
	<!-- <form action="getBoardList.do" method="get">  -->
	<table class="border-none">
		<tr>
			<td>
				 
				<select name="searchCondition">
					<option value="TITLE">제목</option>
					<option value="CONTENT">내용</option>
				</select>
				<input type="text" name="searchKeyword">
				<button type="button" class="btn btn-outline-secondary btn-sm" id="ss">검색</button>
				<!-- <input type="submit" value="검색"> -->	
			</td>
		</tr>
		
	</table>
	<br>
	</form>
	
	
	<!-- 데이터 표시 영역 -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th width="100" class="center">NO.</th>
				<th width="200" class="center">상담제목</th>
				<th width="150" class="center">ID</th>
				<th width="150" class="center">문의날짜</th>
				<th width="150" class="center">답변하기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="center">1</td>
				<td class="d-inline-block text-truncate" style="max-width: 170px;">제목11111111111111111111</td>
				<td class="center">ID</td>
				<td class="center">2022-05-30</td>
				<td class="center"><button type="button" class="btn btn-outline-secondary btn-sm">답변하기</button></td>
			</tr>
			<tr>
				<td class="center">2</td>
				<td class="d-inline-block text-truncate" style="max-width: 170px;">제목22222222222222222222222222</td>
				<td class="center">ID123</td>
				<td class="center">2022-04-23</td>
				<td class="center"><button type="button" class="btn btn-outline-secondary btn-sm">답변하기</button></td>
			</tr>
		</tbody>
	</table>	
</div>	
	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>