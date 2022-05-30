<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<style>
  #container { width: 800px; margin: auto; height: 200px; background-color: light;}
	table, th, td {
		margin: 0 auto;
		text-align: center;
	}
	th {
		border-bottom: 1px solid black;
	}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	
	
	<table id="container">
		<thead>
			<tr class="fs-4">
				<th>상품관리</th>
				<th>회원관리</th>
				<th>고객센터</th>
				<th>상품 후기관리</th>
				<th>주문관리</th>
				<th>매출관리</th>
			</tr>
		</thead>
			<tr>
				<td><button type="button" class="btn btn-light">상품 목록</button></td>
				<td><button type="button" class="btn btn-light">회원정보 조회</button></td>
				<td><button type="button" class="btn btn-light">고객 문의 목록</button></td>
				<td><button type="button" class="btn btn-light">후기 조회</button></td>
				<td><button type="button" class="btn btn-light">판매내역 조회</button></td>
				<td><button type="button" class="btn btn-light">매출 조회</button></td>
			</tr>
			<tr>
				<td><button type="button" class="btn btn-light">상품 등록</button></td>
				<td><button type="button" class="btn btn-light">회원 삭제</button></td>
				<td><button type="button" class="btn btn-light">문의 삭제</button></td>
				<td><button type="button" class="btn btn-light">후기 삭제</button></td>
				<td><button type="button" class="btn btn-light">배송상태 변경</button></td>
				<td></td>
			</tr>
			<tr>
				<td><button type="button" class="btn btn-light">상품 삭제</button></td>
				<td></td>
				<td></td>
				<td></td>
				<td><button type="button" class="btn btn-light">환불 요청 목록</button></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><button type="button" class="btn btn-light">환불 승인</button></td>
				<td></td>
			</tr>
	</table>
	
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>

</html>