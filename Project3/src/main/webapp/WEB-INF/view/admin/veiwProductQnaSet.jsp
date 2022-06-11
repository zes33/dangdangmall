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
<script>


//공통
function cmmSubmit(name1, value1, action1) {
	let f = document.createElement('form');
	    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', name1);
    obj.setAttribute('value', value1);
    
    f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', action1);
    document.body.appendChild(f);
    f.submit();
}

function goInsertQna(qna_id){
	
	var name1 = 'qna_id';
	var value1 = qna_id;
	var action1 = 'adminInsertProductQna.do';
	cmmSubmit(name1, value1, action1);
}

function delPrdQna(qna_group) {
	alert("param : " + arguments.length);

	let del = confirm("문의를 삭제하면 답변까지 삭제됩니다. \n삭제하시겠습니까?");
	if(del){
		var name1 = 'qna_group';
		var value1 = qna_group;
		var action1 = 'delProductQue.do';
		cmmSubmit(name1, value1, action1);
	}
}

function delPrdAns(qna_group, qna_id) {
	alert("param : " + arguments.length);
	
	let del = confirm("답변을 삭제하시겠습니까?");
	if(del){
		let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'qna_group');
	    obj.setAttribute('value', qna_group);
	    
	    let obj2;
	    obj2 = document.createElement('input');
	    obj2.setAttribute('type', 'hidden');
	    obj2.setAttribute('name', 'qna_id');
	    obj2.setAttribute('value', qna_id);
	    
	    f.appendChild(obj);
	    f.appendChild(obj2);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', 'delProductAns.do');
	    document.body.appendChild(f);
	    f.submit();
	}
}

function updateAns(qna_group){
	var name1 = 'qna_group';
	var value1 = qna_group;
	var action1 = 'updatePrdAns.do';
	cmmSubmit(name1, value1, action1);
}	

function updateQue(qna_id){
	var name1 = 'qna_id';
	var value1 = qna_id;
	var action1 = 'updatePrdQue.do';
	cmmSubmit(name1, value1, action1);
}

</script>
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
						<span class="dateInfo">관리자</span>
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
		
		<c:choose> 
			<c:when test="${user.user_state eq 2 }"> 
				<button onclick="location.href='${pageContext.request.contextPath }/adminProductQnaList.do?nowPage=${paging.nowPage }&cntPerPage=${paging.cntPerPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}&qna_state=${qna_state}&prd_category=${prd_category}'"
				type="button" class="btn btn-outline-secondary">목록</button>
			</c:when>
			<c:otherwise>  
				<button onclick="location.href='${pageContext.request.contextPath }/goMyPrdQna.do'"
				type="button" class="btn btn-outline-secondary">목록</button>
			
			</c:otherwise>
		</c:choose>	
		</div>
		
		
        <div class="col-sm-6 rightBtn">
        	<div class="plzRight">  
        	<c:choose>
        	<c:when test="${user.user_state eq 2 }">
        		
        		<c:choose>
				   	<c:when test="${fn:length(productQnaSet) gt 1 }">
				   	<button type="button" class="btn btn-outline-secondary"
				   	onclick="updateAns(${productQnaSet[0].qna_group})">답변수정</button>
				   	<button type="button" class="btn btn-outline-secondary"
				   	onclick="delPrdAns(${productQnaSet[0].qna_group},${productQnaSet[0].qna_id})">답변삭제</button>
				   	<button type="button" class="btn btn-danger"
				   	onclick="delPrdQna(${productQnaSet[0].qna_group})">문의삭제</button>
				   	</c:when>
				   	<c:otherwise>
				   	<button type="button" class="btn btn-outline-secondary"
				   	onclick="goInsertQna(${productQnaSet[0].qna_id})">답변작성</button>
				   	<button type="button" class="btn btn-danger"
				   	onclick="delPrdQna(${productQnaSet[0].qna_group})">문의삭제</button>
				   	</c:otherwise>
			   	</c:choose>
        		
        	</c:when>
        	<c:otherwise>
        		<c:choose>
				   	<c:when test="${fn:length(productQnaSet) gt 1 }">
				   	<button type="button" class="btn btn-danger"
				   	onclick="delPrdQna(${productQnaSet[0].qna_group})">문의삭제</button>
				   	</c:when>
				   	<c:otherwise>
				   	<button type="button" class="btn btn-outline-secondary"
				   	onclick="updateQue(${productQnaSet[0].qna_id})">문의수정</button>
				   	<button type="button" class="btn btn-danger"
				   	onclick="delPrdQna(${productQnaSet[0].qna_group})">문의삭제</button>
				   	</c:otherwise>
			   	</c:choose>
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