<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	/* position:relative; */
	width: 70px;
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
	border: 1px solid black;
	position:relative;
	left: 0px;
	top: 48px;
	width: 1145px;
	height: 600px;
}



.bobody {
	margin-left: 2px;
}
.search {
	margin-top: 30px;
	margin-left: 400px;
}


</style>
<title>상품 리뷰(관리자)</title>
<script>
$(document).ready(function () {
	
	$(".1").html("&#9733;");
	$(".2").html("&#9733;&#9733;");
	$(".3").html("&#9733;&#9733;&#9733;");
	$(".4").html("&#9733;&#9733;&#9733;&#9733;");
	$(".5").html("&#9733;&#9733;&#9733;&#9733;&#9733;");

	$(".category1").html("식품");
	$(".category2").html("운동");

})
</script>
<style >
.star {
	color: red;
}
</style>
</head>
<body>

<header>
     <jsp:include page="../common/header.jsp"></jsp:include>
 </header>

<div class="container">
  <jsp:include page="sidebarTemplate.jsp"></jsp:include>
  	<div class="menuname h1 text-center center" style="background-color:rgb(240, 240, 240);">
  		<strong style="font-size:3vw">&lt; 상품 리뷰 &gt;</strong>
  	</div>
  
  <div class="contents ">
  	<div class="search col-sm-5">
  		<form action="adminReviewList.do" method="post">
		<table class="border-none">
			<tr>
				<td>
					<select name="searchCondition" style="width: 80px;">
					<c:forEach var="option" items="${conditionMap }">
						<option value="${option.value }">${option.key }</option>
					</c:forEach>
					</select>
					<input type="text" name="searchKeyword">
					<button type="submit"  id="ss">검색</button>
					<!-- <input type="submit" value="검색"> -->	
				</td>
			</tr>
		</table>
		<br>
		</form>
  	</div>
  	
  	<div class="col-sm-12 bobody">
  	<table class="table table-hover table1">
		<thead style="text-align: center">
			<tr>
				<th style="text-align: center" width="4%" >NO.</th>
				<th style="text-align: center" width="4%">분류</th>
				<th style="text-align: center" width="9%">상품번호</th>
				<th style="text-align: center" width="8%" >상품명</th>
				<th style="text-align: center" width="30%">내용</th>
				<th style="text-align: center" width="10%">작성자</th>
				<th style="text-align: center" width="10%" >주문일</th>
				<th style="text-align: center" width="9%">별점</th>
			</tr>
		</thead>
			<c:forEach var="reviewList" items="${reviewList }">
			<%-- <c:choose>
			<c:when test="${0 eq reviewList} ">
			<tr>
				<td>등록된 상품문의가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise> --%>
			<tr>
				<td style="text-align: center">${reviewList.R_NUM }</td>
				<td style="text-align: center" class="category${reviewList.CATEGORY_CODE }"></td>
				<td style="text-align: center" >${reviewList.PRODUCT_ID }</td>
				<td style="text-align: center">
					<span class="d-inline-block text-truncate">${reviewList.PRODUCT_NAME}</span>
				</td>
				<c:set var="review_content" value="${reviewList.REVIEW_CONTENT }"/>
				<c:choose>
				<c:when test="${fn:length(review_content) > 20}">
				<td style="text-align: center">
					${fn:substring(review_content,0,20) } <b>...</b> 
				</td>
				</c:when>
				<c:otherwise>
				<td style="text-align: center">${reviewList.REVIEW_CONTENT }</td>
				</c:otherwise>
				</c:choose>
				<td style="text-align: center">${reviewList.USER_ID}</td>
				<td style="text-align: center">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${reviewList.ORDER_DATE }"/>
				</td>
				<td style="text-align: center" class="star ${reviewList.REVIEW_GRADE }"></td>
			</tr>
			<%-- </c:otherwise>
			</c:choose>--%>
			</c:forEach> 
		</tbody>
	</table>
	<br><br>
	
<div class="col-sm-12 bobody">
  	
	<nav style="margin-left: 500px;">
	  <ul class="navul">
	  <c:if test="${paging.startPage != 1 }">
	    <li>
	      <a style=" margin-left: 10px;" href="adminReviewList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
	       aria-label="Previous">
	        <span style="font-size: 20px;" aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	   </c:if> 
	   
	   <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<li><b style="font-size: 20px;  margin-left: 10px;" >${p }</b></li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
	    			<li><a style="font-size: 20px;  margin-left: 10px;" href="adminReviewList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${p }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	   
	    <c:if test="${paging.endPage != paging.lastPage }">
	    <li>
	      <a style=" margin-left: 10px;" href="adminReviewList.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}" aria-label="Previous">
	        <span style="font-size: 20px;" aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	   </c:if> 
	    
	  </ul>
	</nav>
  </div>
</div>
	
	<%-- <nav aria-label="Page navigation" style="margin-left: 100px;">
	  <ul class="pagination">
	  
	  <c:if test="${paging.startPage != 1 }">
	    <li class="page-item">
	      <a class="page-link" href="adminReviewList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
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
	    			<li class="page-item"><a class="page-link" href="adminReviewList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${p }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	   
	    <c:if test="${paging.endPage != paging.lastPage }">
	    <li class="page-item">
	      <a class="page-link" href="adminReviewList.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}" aria-label="Previous">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	   </c:if> 
	    
	  </ul>
	</nav> --%>
	
	
  	</div>
  </div>
  
  <!-- 효과 뺀 버전 -->
 
<style>
.navul {
    list-style:none;
    margin:0;
    padding:0;
}

.navul>li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}

</style>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>