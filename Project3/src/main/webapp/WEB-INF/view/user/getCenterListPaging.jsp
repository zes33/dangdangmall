<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터(고객문의목록)</title>
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
<script>
	//문의하기 버튼을 누르면 활성화되는 go_qna() 함수
	function go_qna(userId) {
		if (userId == undefined) {
			var con = confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?");
			if(con) {
				location.href = "${pageContext.request.contextPath }/login.do";
			}
		} else {
			location.href = "insertCenterQna.do";
		}
	}

	//문의글의 제목을 누르면 글의 내용과 답변이 한눈에 보이는 상세페이지로 이동하는 함수
	function go_getCenter(center_qna_id) {
		location.href = "getCenterQna.do?center_qna_id="+center_qna_id;
	}

</script>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div id="container">
	<!-- 검색을 위한 폼 -->
	<form action="getCenterListPaging.do" method="get">
	<table class="border-none">
		<tr>
			<td>
				<select name="searchCondition">
				<c:forEach items="${conditionMap }" var="option">
					<option value="${option.value }">${option.key }</option>
				</c:forEach>	
				</select>
				<input type="text" name="searchKeyword">
				<button type="submit" class="btn btn-outline-secondary btn-sm" id="ss">검색</button>
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
				<th width="300" class="center">문의제목</th>
				<!-- 
				<th width="150" class="center">ID</th>
				 -->
				<th width="200" class="center">닉네임</th>
				<th width="150" class="center">문의날짜</th>
				<th width="150" class="center">답변상태</th>
				<!--  
				<th width="150" class="center">답변하기</th>
				-->
			</tr>
		</thead>
		<tbody>
			 <c:if test="${empty getCenterListPaging }">
				<tr>
					<th colspan="2" class="center">등록된 고객문의가 없습니다.</th>
				</tr>
			 </c:if>
			 <c:forEach items="${getCenterListPaging }" var="center" varStatus="status">
			 	<tr>
					<td class="center">${center.R_NUM}</td>
					<td><span class="d-inline-block text-truncate" style="max-width: 180px; cursor:pointer;" onclick="go_getCenter(${center.CENTER_QNA_ID });">
						${center.CENTER_QNA_TITLE }</span>
					</td>
					<!-- 
					<td class="center">${center.user_id }</td>
					 -->
					<td class="center">${center.USER_NICKNAME }</td>
					<td class="center"><fmt:formatDate value="${center.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/></td>
					<!-- 아래 c:choose 구문은 reply테이블에 해당하는 답변이 비어있으면 답변대기, 데이터가 있으면 답변완료 -->
					<c:choose>
						<c:when test="${empty center.CENTER_REPLY_ID }">
							<td class="center">답변대기</td>
						</c:when>
						<c:otherwise>
							<td class="center"><strong>답변완료</strong></td>
						</c:otherwise>
					</c:choose>
					<!--
					<td class="center">${center.CENTER_QNA_DATE }</td>
					<td class="center"><button type="button" class="btn btn-outline-secondary btn-sm">답변하기</button></td>
					 -->
			    </tr>
			 </c:forEach>
			 
		</tbody>
	</table>
	
	<div style="float:right;">
		<button type="button" class="btn btn-sm btn-outline-secondary" onclick="go_qna('${user.user_id}');">문의하기</button>
	</div>
	<br>
	
	<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  <c:if test="${paging.startPage != 1 }">
		    <li class="page-item">
		      <a class="page-link" href="getCenterListPaging.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
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
		    			<li class="page-item"><a class="page-link" href="getCenterListPaging.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${p }</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
		   
		    <c:if test="${paging.endPage != paging.lastPage }">
		    <li class="page-item">
		      <a class="page-link" href="getCenterListPaging.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}" aria-label="Previous">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		   </c:if> 
		    
		  </ul>
		</nav>
	
</div>	
	<!-- footer -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	
</body>
</html>