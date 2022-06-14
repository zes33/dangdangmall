<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
#container {
	width: 900px;
	margin: auto;
}

p {
	text-align: right;
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
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div class="container">
		<jsp:include page="sidebarTemplate.jsp"></jsp:include>
		<div class="menuname h1 text-center centers"
			style="background-color: rgb(240, 240, 240);">
			<strong style="font-size: 3vw">&lt; 회원정보 상세 조회 및 삭제 &gt;</strong>
		</div>

		<div class="contents">
			<%-- ${userA } --%>
			<div class="card border-success mb-3" style="max-width: 35rem;">
				<div class="card-header">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"> <span class="h3"><strong>${userA.user_name }</strong></span><span><strong>님</strong></span>
							<span class="text-success position-absolute top-0 end-0">
								<strong> <c:if test="${1 eq userA.user_state }"> 일반회원 </c:if>
									<c:if test="${2 eq userA.user_state }"> 관리자 </c:if> <c:if
										test="${0 eq userA.user_state }"> 휴면회원 </c:if> &nbsp;
							</strong>
						</span><br>${userA.user_email }</font></font>
				</div>
				<div class="card-body">
					<h4 class="card-title">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"> <strong>ID : </strong>
								${userA.user_id }
						</font></font>
					</h4>
					<p class="card-text">
						<font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;">
								<div>
									<strong>닉네임 : </strong>${userA.user_nickname }</div>
								<br>
								<div>
									<strong>전화번호 : </strong>
									<c:if test="${empty userA.user_phone }">  </c:if>
									<c:if test="${not empty userA.user_phone }"> 
									<c:set var="user_phone" value="${userA.user_phone }" />
									${fn:substring(user_phone,0,3) } - 
									${fn:substring(user_phone,3,7) } - 
									${fn:substring(user_phone,7,11) }
									</c:if>
								</div>
								<br>
								<div>
									<strong>주소 : </strong>${userA.user_addr }</div>
								<br>
								<div>
									<strong>상세주소 : </strong>${userA.user_addr_d }</div>
								<br>
								<div>
									<strong>우편번호 : </strong>${userA.user_zipcode }</div>
								<br>
								<div>
									<strong>포인트 : </strong>
									<fmt:formatNumber value="${userA.user_point }"
										pattern="###,###,###" /> point
									<br>
									<p>
										<button type="button" class="btn btn-outline-secondary btn-sm" onclick="goDelete('${userA.user_id }')">회원삭제</button>
										<script type="text/javascript">
											function goDelete(user_id){
												//alert(user_id);
												location.href="deleteUser.do?user_id="+user_id;
											}
										</script>
									</p>
						</font></font>
					</p>
				</div>
			</div>
		</div>
		<br>

			<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath }/admin/adminUserList.do'">목록으로 돌아가기</button>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>