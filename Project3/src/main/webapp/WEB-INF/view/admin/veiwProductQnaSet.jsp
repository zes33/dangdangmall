<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의 상세보기</title>
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

.sin {
	margin: auto;
	padding-top: 20px;
	padding-bottom: 60px;
}
.whereIsIt {
	/* background-color: #CCCCFF; */
	margin: auto;
	font-size: 23px;
	font-weight: 700;
	margin-bottom: 5px;
}
table,td,th {
	margin: auto;
}
.tableParent {
	margin: auto;
}
.qnaConBaby {
	margin: 15px;
}
.dateInfo {
	font-weight: 600;
}
.regDate {
	font-size: 15px;
	color: gray;
}
th {
	font-size: 17px;
}
.tdZone {
	padding-left: 10px;
}


</style>
</head>
<body>
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div class="col-sm-7 sin">
	<div class="col-sm-11 whereIsIt">상품문의 조회</div>
	<div class="col-sm-11 tableParent">
	
		<table class="table table-bordered">
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		<c:forEach items="${productQnaSet }" var="prdQna">
		<c:choose>
			<c:when test="${prdQna.q_or_a eq 0}">
		
			<tr>
				<th class="align-middle thZone" style="background-color: #F0F0F3" height="50px">상품번호/상품명</th>
				<td class="align-middle tdZone">${prdQna.product_id} / ${prdQna.product_name}</td>
			</tr>
			<tr>
				<th class="align-middle thZone" style="background-color: #F0F0F3" height="50px">작성자</th>
				<td class="align-middle tdZone">${prdQna.user_id}</td>
			</tr>
			<tr height="100px">
				<td class="qnaCon" colspan="4">
					<div class="qnaConBaby">
						<span class="dateInfo">작성일</span>
						<span class="regDate">${prdQna.product_qna_date}</span>
					</div>
					<div class="qnaConBaby">[상품문의]</div>
					<div class="qnaConBaby fat">
					 ${prdQna.qna_content}
					</div>
				</td>
			</tr>
			</c:when>
			
			<c:otherwise>
			<tr height="100px">
				<td class="qnaCon" colspan="4">
					<div class="qnaConBaby">
						<span class="dateInfo">작성일</span>
						<span class="regDate">${prdQna.product_qna_date}</span>
					</div>
					<div class="qnaConBaby">[답변]</div>
					<div class="qnaConBaby fat">
					 ${prdQna.qna_content}
					 </div>
				</td>
			</tr>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		</table>
	</div>
	<div class="col-sm-11 row btnZone">
		<div class="col-sm-6">
			<button onclick="location.href='${pageContext.request.contextPath }/adminProductQnaList.do'"
			type="button" class="btn btn-outline-secondary">목록</button>
		</div>
        <div class="col-sm-6 rightBtn">
        	<div class="plzRight">
        	<c:choose>
        	<c:when test="${fn:length(productQnaSet) gt 1 }">
        	<button type="button" class="btn btn-outline-secondary">답변수정</button>
        	<button type="button" class="btn btn-outline-secondary">답변삭제</button>
        	<button type="button" class="btn btn-danger">문의삭제</button>
        	</c:when>
        	<c:otherwise>
        	<button type="button" class="btn btn-outline-secondary">답변작성</button>
        	<button type="button" class="btn btn-danger">문의삭제</button>
        	</c:otherwise>
        	</c:choose>
        	</div>
        </div>
	</div>
<style>
.btnZone {
	/* background-color: aqua; */
	margin: auto;
}
.rightBtn {
	/* background-color: aqua; */
}
.plzRight {
	float:right;
}


</style>	
</div>

</body>
</html>