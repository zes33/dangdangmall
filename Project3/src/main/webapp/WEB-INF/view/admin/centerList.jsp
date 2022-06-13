<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 문의 목록</title>
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
.container {
 position: relative;
}
#ss {
	position:relative;
	width: 700px;
	top: 250px;
}

.menuname {
	position:relative;
	top: 35px;
	/*left: -205px;*/
	left: -25px;
	border: 1px solid LightGray;
	border-radius: 7px;
	width: 1170px;
	height: 140px;
	font-family: "Audiowide", sans-serif;	
}
.center {
  display: flex;
  justify-content: center;
  align-items: center;
}
.contents {
	/* border: 1px solid black; */
	position:relative;
	left: 0px;
	top: 48px;
	width: 1145px;
	height: 630px;
}

</style>
<style>
	#container { width: 1100px; margin: auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>

<style>
#navul {float: center;
		text-align: center;
		margin:auto;
		display:inline-block;
}
.navul {
    list-style:none;
    margin:auto;
    padding:0;
 	float: center;
    text-align: center;
    display:inline-block;
}

.navul>li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
    /* margin: auto; */
    text-align: center;
    display:inline-block;
}

</style>
<script>
	//문의글의 제목을 누르면 글의 내용과 답변이 한눈에 보이는 상세페이지로 이동하는 함수
	function go_getCenter(center_qna_id) {
		location.href = "adminCenter.do?center_qna_id="+center_qna_id;
	}
	
	//답변 등록 - 답변하기 버튼을 누르면 활성화되는 함수
	function go_insertReply(center_qna_id) {
		location.href = "${pageContext.request.contextPath }/admin/adminCenter.do?center_qna_id=" + center_qna_id;
	}
</script>

</head>
<body>
	<header>
      <jsp:include page="../common/header.jsp"></jsp:include>
   </header>

	<div class="container">
   <jsp:include page="sidebarTemplate.jsp"></jsp:include>
   	<div class="menuname h1 text-center center" style="background-color:rgb(240, 240, 240);">
   		<strong style="font-size:3vw">&lt; 고객 문의 목록 &gt;</strong>
   	</div>
   
   <div class="contents">
   <!-- CenterList 데이터 표시 영역 -->
		<div id="container">
		<!-- 검색을 위한 폼 -->
		<form action="adminCenterList.do" method="get">
		<table class="border-none">
			<tr>
				<td>
					<select name="searchCondition">
					<c:forEach items="${conditionMap }" var="option">
						<option value="${option.value }">${option.key }</option>
					</c:forEach>	
					</select>
					<input type="text" name="searchKeyword">
					<button type="submit" class="btn btn-outline-secondary">검색</button>
				</td>
			</tr>
			
		</table>
		<br>
		</form>
		<!-- 데이터 표시 영역 -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="text-align: center; vertical-align: middle;" width="7%">NO.</th>
					<th style="text-align: center; vertical-align: middle;" width="43%">문의제목</th>
					<th style="text-align: center; vertical-align: middle;" width="10%">ID</th>
					<th style="text-align: center; vertical-align: middle;" width="20%">닉네임</th>
					<th style="text-align: center; vertical-align: middle;" width="10%">문의날짜</th>
					<th style="text-align: center; vertical-align: middle;" width="10%">답변상태</th>
					<th style="text-align: center; vertical-align: middle;" width="10%"></th>
				</tr>
			</thead>
			<tbody>
				 <c:if test="${empty centerList }">
					<tr>
						<th colspan="2" style="text-align: center; vertical-align: middle;">등록된 고객문의가 없습니다.</th>
					</tr>
				 </c:if>
				 <c:forEach items="${centerList }" var="center" varStatus="status">
				 	<tr>
						<td style="text-align: center; vertical-align: middle;">${center.R_NUM}</td>
						<td style="vertical-align: middle;"><span class="d-inline-block text-truncate" style="max-width: 180px; cursor:pointer;" onclick="go_getCenter(${center.CENTER_QNA_ID });">
							<strong>${center.CENTER_QNA_TITLE }</strong></span>
						</td>
						<td style="text-align: center; vertical-align: middle;">${center.USER_ID }</td>
						<td style="text-align: center; vertical-align: middle;">${center.USER_NICKNAME }</td>
						<td style="text-align: center; vertical-align: middle;">
							<fmt:formatDate value="${center.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/>
						</td>
						<!-- 아래 c:choose 구문은 reply테이블에 해당하는 답변이 비어있으면 답변대기, 데이터가 있으면 답변완료 -->
						<c:choose>
							<c:when test="${empty center.CENTER_REPLY_ID }">
								<td style="text-align: center; vertical-align: middle;">답변대기</td>
								<td style="text-align: center; vertical-align: middle;">
									<button type="button" class="btn btn-dark btn-sm" onclick="go_insertReply(${center.CENTER_QNA_ID}, ${center.CENTER_REPLY_ID })">답변하기</button>
								</td>
							</c:when>
							<c:otherwise>
								<td style="text-align: center; vertical-align: middle;"><strong>답변완료</strong></td>
								<td style="text-align: center; vertical-align: middle;">
									<button type="button" class="btn btn-outline-secondary btn-sm" style="border: 1px solid black;" onclick="go_insertReply(${center.CENTER_QNA_ID})" disabled>답변하기</button>
								</td>
							</c:otherwise>
						</c:choose>
						<c:if test="${empty center.CENTER_REPLY_ID }">
							
						</c:if>
				    </tr>
				 </c:forEach>
				 
			</tbody>
		</table>
		<!-- 
		<div style="float:right;">
			<button type="button" class="btn btn-sm btn-outline-secondary" onclick="go_qna('${user.user_id}');">문의하기</button>
		</div>
		 -->
		 <div style="text-align: center; float: center;">
			<nav class="navul">
			  <ul class="navul">
			  <c:if test="${paging.startPage != 1 }">
			    <li class="page-item">
			      <a class="page-link" href="centerList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
			       aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			   </c:if> 
			   
			   <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="page-item"><b class="page-link" >${p }</b></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
			    			<li class="page-item"><a class="page-link" href="centerList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${p }</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
			   
			    <c:if test="${paging.endPage != paging.lastPage }">
			    <li class="page-item">
			      <a class="page-link" href="centerList.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}" aria-label="Previous">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			   </c:if> 
			    
			  </ul>
			</nav>
			</div>
		 
		<br><br><br>
			
		</div>
		<br><br><br><br><br><br><br><br><br><br>	
			   
   </div>
   </div>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>