<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 후기</title>
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
	.col-xs-12 {
		border-top: 4px solid #CACACA;
		border-bottom: 4px solid #CACACA;
		background-color: #E8E8E8;
	}
	table {text-align: center;}
	td {
		height: 40px;
		font-size: 20px;
	}
	.rowMan{
		height: 140px;
		padding: 5px 10px;
		display: flex;
	}
	.rowManBaby {
		display: inline-flex;
		align-items: center;
	}
	.myDang {
		font-size: 40px;
	}
	th {
		font-size: 36px;
		height: 70px;
		padding-bottom: 0px;
	}
	.colMan { 
		padding: 0px;
		/* background-color: orange; */
	}
	.colMan > div{
		background-color: #E8E8E8; 
		margin-top: 2px;
		margin-bottom: 5px;
		height: 60px;
		border-radius: 10px;
		
		position: relative;
	}
	p {
		display: table-cell;
		font-size: 20px;
		text-align: center;
		
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		
		width: 200px;
	}
	
	b > a {
		text-decoration: none;
		color: black;
	}
	
	
	
	.whoruBaby {
		/* background-color: orange; */
		margin-left: 20px;
		padding-left:10px;
		padding-top:10px;
		padding-bottom: 10px;
		
		border-top: 2px solid #CCCCCC;
		margin-bottom: 10px;
	}
	
	.aimg{
		width:70px;
		height:70px;
	}
	.imgZone {
		padding-top: 7px;
		padding-left:10px;
	}
	.prdname{
		font-size:22px;
	}
	h3 {margin-left:20px;}
	.review {
		margin-left: 10px;
	}
	hr{
		width: 98%;
	}
	.star {
		font-size:24px;
		color: red;
	}
	.content{
		padding-top: 10px;
		font-size:17px;
		padding-bottom: 9px;
	}
	.btn1 {
		width:60%;
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
	
function editReview(review_id) {
	window.open("editReview.do?review_id="+review_id,"pop1",
	"width=500, height=700 top=100, left=150");
}

function deleteReview(review_id) {
	var cf = confirm("리뷰를 삭제하시겠습니까?");
	if(cf){
		let f = document.createElement('form');
		    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'review_id');
	    obj.setAttribute('value', review_id);
	    
	    f.appendChild(obj);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', 'deleteReview.do');
	    document.body.appendChild(f);
	    f.submit();
	}
}


</script>
</head>
<body>

<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>



	<div class="container">
	    <div class="row rowMan">
	        <div class="col-xs-12 rowManBaby">
			<table>
			<colgroup>  <!--컬럼에 관한 속성-->
	            <col width="300px">   <!--1번째 컬럼 너비 조정-->
	            <col width="330px" >
	            <col width="330px">
	            <col width="330px">
	        </colgroup>
	        	<tr>
	        		<th rowspan="2" class="myDang">My당당몰</th>
	        		<th>회원등급</th>
	        		<th>배송중</th>
	        		<th>포인트</th>
	        	</tr>
	        	<tr>
	        		<c:if test="${user.user_grade== 1 }">
	        			<td>일반회원</td>
	        		</c:if>
	        		<c:if test="${user.user_grade == 2 }">
	        			<td>vip회원</td>
	        		</c:if>
	        		<!-- ================================= -->
	        			<c:set var="sum" value="0" />
						<c:forEach var="list" items="${orderList }">
							<c:if test="${list.user_status == 2 }">
								<c:set var="sum" value="${sum+1}" />
							</c:if>
						</c:forEach>
						<c:if test="${sum ==0}">
							<td>0건</td>
						</c:if>
						<c:if test="${sum ne 0}">
							<td><c:out value="${sum }" />건</td>
						</c:if>
	        		<!-- ================================= -->
	        		<td>${user.user_point }p</td>
	        	</tr>
	        </table>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-2 colMan">
		        <div><p><b><a href="${pageContext.request.contextPath }/myinfo.do">주문내역</a></b></p></div>
		        <div><p><b><a href="${pageContext.request.contextPath }/myprivateinfo.do">나의 정보</a></b></p></div>
		        <div><p><b><a href="cart/list.do">장바구니</a></b></p></div>
		        <div><p><b><a href="${pageContext.request.contextPath }/goMyPrdQna.do">상품 문의내역</a></b></p></div>
		        <div><p><b><a href="${pageContext.request.contextPath }/user/myCenterQna.do">기타 문의내역</a></b></p></div>
		        <div><p><b><a href="${pageContext.request.contextPath }/goMyReview.do">후기내역</a></b></p></div>
	        </div>
	        <div class="col-md-10 whoru">
	        <br>
				<h3><b>나의 상품 후기 </b></h3>
				<br>
				
				<c:forEach var="myReviewList" items="${myReviewList }">
				<div class="col-md-11 whoruBaby">
					<div class="row imgZone">
				        <div class="col-sm-1">
				        	<img alt="제품사진" class="aimg" src="${pageContext.request.contextPath }/img/${myReviewList.PRODUCT_PIC }">
				        </div>
				        <div class="col-sm-9 info">
				        	<div class="prdname">${myReviewList.PRODUCT_NAME }</div>
				        	<div class="date">구매일 : 
				        	<fmt:formatDate pattern="yyyy-MM-dd" value="${myReviewList.ORDER_DATE }"/>
				        	</div>
				        </div>
				        <div class="col-sm-2 btns">
				        	<div class="row btn1">
				        		<button style="font-size: 14px;" onclick="editReview(${myReviewList.REVIEW_ID})"
				        		type="button" class="btn btn-outline-secondary">리뷰수정</button>
				        	</div>
				        	<div class="row btn1" style="margin-top: 7px;">
				        		<button style="font-size: 14px;" onclick="deleteReview(${myReviewList.REVIEW_ID})"
				        		type="button" class="btn btn-secondary">리뷰삭제</button>
				        	</div>
				        </div>
				    </div>
				    <hr>
				    <div class="row floor">
				        <div class="col-sm-12 review">
				        	<div class="row">
				        	<!-- 별점 -->
						        <div class="col-sm-4 star ${myReviewList.REVIEW_GRADE }">
						        	
						        </div>
						    </div>
						    <div class="row">
						        <div class="col-sm-11 content">${myReviewList.REVIEW_CONTENT }</div>
						    </div>
				        </div>
				    </div>
				</div>
				</c:forEach>
				<br><br>
				
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  
				  
				  <c:if test="${paging.startPage != 1 }">
				    <li class="page-item">
				      <a class="page-link" href="goMyReview.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"
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
				    			<li class="page-item"><a class="page-link" href="goMyReview.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
				   
				    <c:if test="${paging.endPage != paging.lastPage }">
				    <li class="page-item">
				      <a class="page-link" href="goMyReview.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}" aria-label="Previous">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				   </c:if> 
				    
				  </ul>
				</nav>
				
				
				
				
				
				
				
			</div>
	    </div>
	    <!-- <div class="row wru">
	    	<h3>넌 머야</h3>
	    </div> -->
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