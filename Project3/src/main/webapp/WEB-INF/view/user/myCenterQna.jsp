

	



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터(고객문의목록)</title>
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
	#container { width: 700px; margin: auto; }
	h1, p { text-align: center; }
	table { border-collapse: collapse; }
	.ct>th .ct td {
		border: 1px solid black;
		margin: 0 auto;
	}
/* 	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	} */
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>
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

	
</style>
<script>
	//문의글의 제목을 누르면 글의 내용과 답변이 한눈에 보이는 상세페이지로 이동하는 함수
	function go_getCenter(center_qna_id) {
		location.href = "myCenter.do?center_qna_id="+center_qna_id;
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
		        <div><p><b><a href="${pageContext.request.contextPath }/goMyPrdQna.do">상품 문의내역</a></b></p></div>
		        <div><p><b><a href="${pageContext.request.contextPath }/user/myCenterQna.do">기타 문의내역</a></b></p></div>
		        <div><p><b><a href="${pageContext.request.contextPath }/goMyReview.do">후기내역</a></b></p></div>
	        </div>
	        <div class="col-md-10 whoru">
				<h3>
				<h3>[기타 문의내역]</h3>
					<!-- 데이터 표시 영역 -->
					<table class="table table-hover ct">
						<thead>
							<tr>
								<th style="font-size: 20px;" width="100" class="center">NO.</th>
								<th style="font-size: 20px;" width="300" class="center">문의제목</th>
								<th style="font-size: 20px;" width="150" class="center">문의날짜</th>
								<th style="font-size: 20px;" width="150" class="center">답변상태</th>
							</tr>
						</thead>
						<tbody>
							 <c:if test="${empty myCenterQna }">
								<tr>
									<th colspan="2" class="center" style="font-size: 20px;">등록된 고객문의가 없습니다.</th>
								</tr>
							 </c:if>
							 <c:forEach items="${myCenterQna }" var="center" varStatus="status">
							 	<tr>
									<td class="center">${status.count}</td>
									<td><span class="d-inline-block text-truncate" style="max-width: 180px; cursor:pointer; float: left;" onclick="go_getCenter(${center.CENTER_QNA_ID });">
										${center.CENTER_QNA_TITLE }</span>
									</td>
									<td class="center"><fmt:formatDate value="${center.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/></td>
									<!-- 아래 c:choose 구문은 reply테이블에 해당하는 답변이 비어있으면 답변대기, 데이터가 있으면 답변완료 -->
									<c:choose>
										<c:when test="${empty center.CENTER_REPLY_ID }">
											<td class="center">답변대기</td>
										</c:when>
										<c:otherwise>
											<td class="center">답변완료</td>
										</c:otherwise>
									</c:choose>
							    </tr>
							 </c:forEach>
							 
						</tbody>
					</table>
				</h3>
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