<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>상품 목록</title>
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
	
	.colorBtn {
		background-color: white;
		border-color: #ECECEC;
		border-radius: 10%;
	}
	
	.qnaTitle {
		text-decoration: none;
		color: black;
	}
	.search {
	margin-top: 30px;
	margin-left: 250px;
	}
	.bowl {
		text-align: center;
		margin: auto;
	}
	/* 위가 내것 */
	
	
	
.container {
 position: relative;
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
	position:relative;
	left: 0px;
	top: 48px;
	width: 1145px;
	height: 600px;
}
	
	

</style>
<script>

var condition = '<c:out value="${searchCondition}"/>';
var category = '<c:out value="${prd_category}"/>';
var pstate = '<c:out value="${prd_state}"/>';

$(document).ready(function () {

	$(".1").html("식품");
	$(".2").html("운동");

	$(".a1").html("판매중");
	$(".a2").html("판매중지");
	
	// 검색어 유지
	$('option[value='+condition+']').prop('selected', true);
	
	// 검색조건 유지 : 상품분류
	$('.prd_category[value='+category+']').prop('checked', true);
	
	// 검색조건 유지 : 상품상태
	$('.prd_state[value='+pstate+']').prop('checked', true);
	
	
	// 검색어 input 초기화
	$('#keyzone').click(function () {
		$('#keyzone').val('');
	})

})


function goInsertQna(qna_id){
    let f = document.createElement('form');
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'qna_id');
    obj.setAttribute('value', qna_id);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'adminInsertProductQna.do');
    document.body.appendChild(f);
    f.submit();
}

function resetOpt() {
	$('#keyzone').val('');
	$('.prd_category').prop('checked', false);
	$('.prd_state').prop('checked', false);
}

function goInsert() {
	location.href = "goInsertProduct.do";
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
   		<strong style="font-size:3vw">&lt; 상품 목록 &gt;</strong>
   	</div>
   
   <div class="contents">
   
		<div class="col-sm-12 bowl">
		<div class="search col-sm-5">
	  		<form action="adminProductList.do" method="post">
			<table class="border-none">
				<tr>
					<td>
						<select name="searchCondition" style="width: 80px;">
							<option value="PRODUCT_NAME">상품명</option>
							<option value="PRODUCT_ID">상품번호</option>
						</select>
						<input type="text" value="${searchKeyword }" id="keyzone" name="searchKeyword">
						<button type="submit" >검색</button>
					</td>
				</tr>
				<tr>
					<td style="text-align: left;">
						<br>
						<span><b>[상품분류]</b></span>
						<input style="margin-left: 10px;" class="prd_category" type="radio" name="prd_category" value="1">식품
						<input style="margin-left: 10px;" class="prd_category" type="radio" name="prd_category" value="2">운동
					</td>
				</tr>
				<tr>
					<td style="text-align: left;">
						<span><b>[상품상태]</b></span>
						<input style="margin-left: 10px;" id="state1" class="prd_state" type="radio" name="prd_state" value="1">판매중
						<input style="margin-left: 10px;" id="state2" class="prd_state" type="radio" name="prd_state" value="2">판매중지
						<button type="button" onclick="resetOpt()">초기화</button>
					</td>
				</tr>
			</table>
			<br>
			</form>
	  	</div>
		
		
	   <div class="row col-sm-12"><!-- mine -->
		<!-- 데이터 표시 영역 -->
		<table class="table table-hover table1">
			<thead>
				<tr>
					<th style="text-align: center" width="5%" >NO.</th>
					<th style="text-align: center" width="7%" >상품분류</th>
					<th style="text-align: center" width="7%">상품번호</th>
					<th style="text-align: center" width="20%" >상품명</th>
					<th style="text-align: center" width="8%">가격(원)</th>
					<th style="text-align: center" width="6%">할인율(%)</th>
					<th style="text-align: center" width="11%">상품상태</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${empty prdList  }">
				<tr>
					<td colspan="7">등록된 상품문의가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="prdList" items="${prdList }"> 
				<tr>
					<td style="text-align: center">${prdList.R_NUM }</td>
					<td style="text-align: center" class="aa ${prdList.CATEGORY_CODE }"></td>
					<td style="text-align: center" >${prdList.PRODUCT_ID }</td>
					<td style="text-align: center">
						<a href="${pageContext.request.contextPath }/productInfo.do?product_id=${prdList.PRODUCT_ID}&nowPage=${paging.nowPage }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}">
						${prdList.PRODUCT_NAME }
						</a>
					</td>
					<td style="text-align: center">
					<fmt:formatNumber value="${prdList.PRODUCT_PRICE }" pattern="#,###" />
					</td>
					<td style="text-align: center">
						<fmt:formatNumber value="${prdList.PRODUCT_DISCOUNT * 100}" pattern="#,###" />
					</td>
					<td style="text-align: center" class="a${prdList.PRODUCT_STATE }"></td>
				</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<div>
			<button type="button" style="float: right" onclick="goInsert()">상품 등록</button>
		</div>	
		</div>
		</div>
   
   <div class="col-sm-12 bobody">
  	
	<nav style="margin-left: 500px;">
	  <ul class="navul">
	  <c:if test="${paging.startPage != 1 }">
	    <li>
	      <a style=" margin-left: 10px;" href="adminProductList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}"
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
	    			<li><a style="font-size: 20px;  margin-left: 10px;" href="adminProductList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}">${p }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	   
	    <c:if test="${paging.endPage != paging.lastPage }">
	    <li>
	      <a style=" margin-left: 10px;" href="adminProductList.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&prd_state=${prd_state}&prd_category=${prd_category}" aria-label="Previous">
	        <span style="font-size: 20px;" aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	   </c:if> 
	    
	  </ul>
	</nav>
  </div>
   
   
   </div>
</div>


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