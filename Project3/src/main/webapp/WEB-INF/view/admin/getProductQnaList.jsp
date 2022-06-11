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
<title>상품문의 목록</title>
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
var qstate = '<c:out value="${qna_state}"/>';

$(document).ready(function () {

	$(".1").html("식품");
	$(".2").html("운동");
	
	// 검색어 유지
	$('option[value='+condition+']').prop('selected', true);
	
	// 검색조건 유지 : 상품분류
	$('.prd_category[value='+category+']').prop('checked', true);
	
	// 검색조건 유지 : 답변상태
	$('.qna_state[value='+qstate+']').prop('checked', true);
	
	
	// 검색어 input 초기화
	$('#keyzone').click(function () {
		$('#keyzone').val('');
	})
	
	
})

function resetOpt() {
	$('#keyzone').val('');
	$('.prd_category').prop('checked', false);
	$('.qna_state').prop('checked', false);
}


function goInsertQna(qna_id){
    let f = document.createElement('form');
    
    let obj1;
    obj1 = document.createElement('input');
    obj1.setAttribute('type', 'hidden');
    obj1.setAttribute('name', 'qna_id');
    obj1.setAttribute('value', qna_id);
    
    f.appendChild(obj1);

    f.setAttribute('method', 'post');
    f.setAttribute('action', 'adminInsertProductQna.do');
    document.body.appendChild(f);
    f.submit();
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
   		<strong style="font-size:3vw">&lt; 상품 문의 &gt;</strong>
   	</div>
   
   <div class="contents">
   
		<div class="col-sm-12 bowl">
		<!-- 검색을 위한 폼 -->
		<!-- <form action="getBoardList.do" method="get">  -->
		<div class="search col-sm-7">
	  		<form action="adminProductQnaList.do" method="post">
			<table class="border-none">
				<tr>
					<td>
						<select name="searchCondition" style="width: 80px;">
							<c:forEach var="option" items="${prdQnaSearchMap }">
								<option class="opt" value="${option.value }">${option.key }</option>
							</c:forEach>
						</select>
						<input id="keyzone" value="${searchKeyword }" type="text" name="searchKeyword">
						
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
						<span><b>[답변상태]</b></span>
						<input style="margin-left: 10px;" class="qna_state" type="radio" name="qna_state" value="0">답변대기
						<input style="margin-left: 10px;" class="qna_state" type="radio" name="qna_state" value="1">답변완료
						<input style="margin-left: 10px;" class="qna_state" type="radio" name="qna_state" value="2">전체선택&nbsp;&nbsp;&nbsp;
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
					<th style="text-align: center" width="10%" >상품명</th>
					<th style="text-align: center" width="30%">내용</th>
					<th style="text-align: center" width="8%">작성자</th>
					<th style="text-align: center" width="11%">작성일</th>
					<th style="text-align: center" width="7%">답변상태</th>
					<th style="text-align: center" width="8%"></th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${empty productQnaList  }">
				<tr>
					<td colspan="9">등록된 상품문의가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="productQna" items="${productQnaList }">
				<tr>
					<td style="text-align: center">${productQna.R_NUM }</td>
					<td style="text-align: center" class="${productQna.CATEGORY_CODE }"></td>
					<td style="text-align: center" >${productQna.PRODUCT_ID }</td>
					<td style="text-align: center">
						<span class="d-inline-block text-truncate" style="max-width: 180px;">${productQna.PRODUCT_NAME }</span>
					</td>
					<td style="text-align: center">
						<a class="qnaTitle " href="adminViewPrdQnaOne.do?qna_group=${productQna.QNA_GROUP }">
						${productQna.QNA_CONTENT }</a>
					</td>
					
					<td style="text-align: center">${productQna.USER_ID }</td>
					<td style="text-align: center">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${productQna.PRODUCT_QNA_DATE }"/>
					</td>
					<c:choose>
					<c:when test="${0 eq productQna.PRODUCT_QNA_STATE }">
						<td style="text-align: center">답변대기</td>
					</c:when>
					<c:otherwise>
						<td style="color: #C9C7C7;">답변완료</td>
					</c:otherwise>
					</c:choose>
					<td style="text-align: center">
					<c:choose>
					<c:when test="${0 eq productQna.PRODUCT_QNA_STATE }">
						<button type="button" onclick="goInsertQna(${productQna.QNA_ID})"
						class="btn btn-dark btn-sm">답변작성</button>
					</c:when>
					<c:otherwise>
					</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</tbody>
		</table>	
		</div>
		</div>
   
   <div class="col-sm-12 bobody">
  	
	<nav style="margin-left: 500px;">
	  <ul class="navul">
	  <c:if test="${paging.startPage != 1 }">
	    <li>
	      <a style=" margin-left: 10px;" href="adminProductQnaList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&qna_state=${qna_state}&prd_category=${prd_category}"
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
	    			<li><a style="font-size: 20px;  margin-left: 10px;" href="adminProductQnaList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&qna_state=${qna_state}&prd_category=${prd_category}">${p }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
	   
	    <c:if test="${paging.endPage != paging.lastPage }">
	    <li>
	      <a style=" margin-left: 10px;" href="adminProductQnaList.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&qna_state=${qna_state}&prd_category=${prd_category}" aria-label="Previous">
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