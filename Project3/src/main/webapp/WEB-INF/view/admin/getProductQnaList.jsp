<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</style>
<script>
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


</script>
</head>

<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>

<div id="container">
<div class="row">
	<div class="col-sm-9">
	<!-- 검색을 위한 폼 -->
	<!-- <form action="getBoardList.do" method="get">  -->
	<form>
	<table class="border-none">
		<tr>
			<td>
				 
				<select name="searchCondition">
					<option value="TITLE">제목</option>
					<option value="CONTENT">내용</option>
				</select>
				<input type="text" name="searchKeyword">
				<button type="button" class="btn btn-outline-secondary btn-sm" id="ss">검색</button>
				<!-- <input type="submit" value="검색"> -->	
			</td>
		</tr>
		
	</table>
	<br>
	</form>
	
	
	<!-- 데이터 표시 영역 -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th class="center">NO.</th>
				<th class="center">상품명</th>
				<th class="center">상품id</th>
				<th class="center">내용</th>
				<th class="center">ID</th>
				<th class="center">문의날짜</th>
				<th class="center">답변상태</th>
				<th class="center">답변하기</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="productQna" items="${productQnaList }">
		<c:choose>
		<c:when test="${empty productQnaList  }">
			<tr>
				<td>등록된 상품문의가 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td class="center">${productQna.qna_id }</td>
				<td><span class="d-inline-block text-truncate" style="max-width: 180px;">${productQna.product_name }</span></td>
				<td class="center">${productQna.product_id }</td>
				<!-- 누르면 문의(+답변) 모두 보이는 페이지로 이동 -->
				<td class="center">
					<a class="qnaTitle" href="adminViewPrdQnaOne.do?qna_group=${productQna.qna_group }">
					${productQna.qna_content }</a>
				</td>
				
				<td class="center">${productQna.user_id }</td>
				<td class="center">${productQna.product_qna_date }</td>
				<c:choose>
				<c:when test="${0 eq productQna.product_qna_state }">
					<td class="center">답변대기</td>
				</c:when>
				<c:otherwise>
					<td class="center">답변완료</td>
				</c:otherwise>
				</c:choose>
				<td class="center">
				<c:choose>
				<c:when test="${0 eq productQna.product_qna_state }">
					<button type="button" onclick="goInsertQna(${productQna.qna_id})"
					class="btn btn-outline-secondary btn-sm">답변하기</button>
				</c:when>
				<c:otherwise>
					<button type="disable" onclick="goInsertQna(${productQna.qna_id})"
					class="colorBtn btn-outline-secondary">추가답변</button>
				</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</c:otherwise>
		</c:choose>
		</c:forEach>
		</tbody>
	</table>	
	</div>
</div>
</div>	
	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>

</body>
</html>