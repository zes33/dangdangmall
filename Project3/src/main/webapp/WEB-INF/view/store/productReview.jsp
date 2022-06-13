<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기 목록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
.reviewTitle{
	background-color: #515154;
	height: 60px;
	font-size: 27px;
	font-weight: 700;
}
.prdInfo {
	padding-top: 10px;
	padding-bottom: 10px;
	
	border-bottom: 1px solid gray;
}
.wrtRV {
	text-align: center;
	padding-top: 10px;
	color: white;
}
.star {
	padding-bottom: 5px;
	color: red;
}
.content {
	padding-top: 5px;
	padding-bottom: 5px;
	margin-left: 10px;
}
.momtong {
	margin-top: 10px;
}
.nick {
	text-align: right;
	font-size: 14px;
}
.review {
	padding-left: 20px;
}
.nad {
	margin-left: 15px;
}

</style>
<script>
$(document).ready(function () {
	
	$(".1").html("&#9733;");
	$(".2").html("&#9733;&#9733;");
	$(".3").html("&#9733;&#9733;&#9733;");
	$(".4").html("&#9733;&#9733;&#9733;&#9733;");
	$(".5").html("&#9733;&#9733;&#9733;&#9733;&#9733;");
	
})



</script>
</head>
<body>
    <div class="container-fluid reviewTitle ">
    	<div class="wrtRV">사용후기</div>
    </div>
    <c:forEach var="reviewList" items="${reviewListPaging }">
		<div class="container-fluid prdInfo">
			<div class="col-sm-12 review">
	        	<div class="row " >
	        	<!-- 별점 -->
			        <div class="col-sm-4 star ${reviewList.REVIEW_GRADE }">
			        </div>
			    </div>
			    <div class="row">
			        <div class="col-sm-11 content" >${reviewList.REVIEW_CONTENT }</div>
			    </div>
			    <div class="row nick">
			        <div class="col-sm-11 nad" >
			        	 <b>${reviewList.USER_NICKNAME }</b> | <fmt:formatDate pattern="yyyy-MM-dd" value="${reviewList.ORDER_DATE}"/>
			        </div>
			        
			    </div>
	        </div>
		</div>
	</c:forEach>
	
	<div class="container-fluid momtong">
		<nav aria-label="Page navigation example">
		  <ul class="pagination pagination-sm justify-content-center">
		  
		  
		  <c:if test="${paging.startPage != 1 }">
		    <li class="page-item">
		      <a class="page-link" href="moreReview.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&prd_c=${prd_c}"
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
		    			<li class="page-item"><a class="page-link" href="moreReview.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&prd_c=${prd_c}">${p }</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
		   
		    <c:if test="${paging.endPage != paging.lastPage }">
		    <li class="page-item">
		      <a class="page-link" href="moreReview.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}&prd_c=${prd_c}" aria-label="Previous">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		   </c:if> 
		    
		  </ul>
		</nav>
	</div>


</body>
</html>