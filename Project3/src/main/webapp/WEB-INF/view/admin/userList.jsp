<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
#container {
	width: 1200px;
	margin: auto;
}

h1, h3, p {
	text-align: center;
}

table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
	margin: 0 auto;
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

.container {
	position: relative;
}

#ss {
	width: 100px;
}

.menuname {
	position: relative;
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
	position: relative;
	left: 0px;
	top: 48px;
	width: 1145px;
	height: 600px;
}

.padding {
	padding-left: 30px;
}
</style>
	<script type="text/javascript">
								function goSearch() {

									var usr = document.getElementById('searchKeyword').value;
									var key = document.getElementById('searchCondition').value;
									if (usr == "") {
                     					alert("검색어를 입력해 주세요.");
                     				} else{
                     					/* alert(usr); */
										location.href ="${pageContext.request.contextPath }/admin/searchUserList.do?searchKeyword="+usr+"&searchCondition="+key;
									}
								}
							</script>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<%--  ${AdminusersList } --%>
	
		<div class="container">
   <jsp:include page="sidebarTemplate.jsp"></jsp:include>
	   	<div class="menuname h1 text-center center" style="background-color:rgb(240, 240, 240);">
	   		<strong style="font-size:3vw">&lt; 회원정보 관리 &gt;</strong>
	   	</div>

		<!-- 검색을 위한 폼 -->
		<form style="margin-top: 60px;"
			action="admin/searchUserList.do"
			method="get">
			<table class="border-none">
				<tr>
					<td>
					<select name="searchCondition" id="searchCondition">
				<c:forEach var="option" items="${conditionMapU }">
					<option value="${option.value }">${option.key}</option>
				</c:forEach>
				</select>
					
					
					 &nbsp;&nbsp;&nbsp;
					<input type="text" name="searchKeyword" id="searchKeyword" >&nbsp;&nbsp;
						<button type="button"  id="searchKeyword" onclick="goSearch();">
							검색</button> 
							
						
							</td>
				</tr>
			</table>
		</form>
		
		 <c:if test="${not empty searchKeyword }">
		 <br> <h4> ' ${searchKeyword } ' 에 대한 검색 결과 </h4>
		 </c:if>
		 
		 
		
		<!-- 데이터 표시 영역 -->
		<div style="margin-top: 25px;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="100" class="center">아이디</th>
						<th width="200" class="center">이름</th>
						<th width="150" class="center">닉네임</th>
						<th width="150" class="center">회원등급</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${AdminusersList }" var="list" varStatus="i">
						<tr>
							<td class="center"><a
								class="btn btn-white text-decoration-none text-dark"
								data-toggle="collapse">${list.user_id }</a></td>
							<td class="center"><a
								href="admin/adminUser.do?user_id=${list.user_id }"
								class="text-decoration-none text-dark">${list.user_name }</a></td>

							<td class="center"><a
								href="admin/adminUser.do?user_id=${list.user_id }"
								class="text-decoration-none text-dark">${list.user_nickname }</a></td>
							<td class="center"><a
								href="admin/adminUser.do?user_id=${list.user_id }"
								class="text-decoration-none text-dark"> <c:if
										test="${1 eq list.user_state }"> [일반회원] </c:if> <c:if
										test="${2 eq list.user_state }">
										<p style="color: #1ABC9C;">[관리자]</p>
									</c:if> <c:if test="${0 eq list.user_state }">
										<p style="color: #C9C7C7;">[휴먼회원]</p>
									</c:if>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath }/admin/adminUserList.do'">전체 목록으로 돌아가기</button>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>