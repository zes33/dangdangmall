<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
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
		
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		
		width:200px;		
		text-align: center;
	}
	
/*  #container { width: 800px; margin: auto;}
   table { border-collapse: collapse; }
   table, th, td {
      border: 1px solid black;
      margin: 0 auto;
      padding-bottom: 10px;
   } 
   .center { text-align: center; }
   .border-none, .border-none td { border: none; }
 */
	b > a {
		text-decoration: none;
		color: black;
	}
	
	.wru {
		/* background-color: aqua; */
		padding-top: 30px;
	}
	.card {
		margin-bottom: 12px;
		padding-top: 10px;
	}
</style>
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
						<c:if test="${sum == 0}">
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
		        <div><p><b><a href="#">상품 문의내역</a></b></p></div>
		        <div><p><b><a href="#">기타 문의내역</a></b></p></div>
		        <div><p><b><a href="#">후기내역</a></b></p></div>
	        </div>
	        <div class="col-md-10 wru">
	        <c:forEach var="orderList" items="${orderList }">
	          <div class="container">
			      <div class="card">
			        <div class="card-body">
			          <h3 class="card-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><strong>${orderList.product_name }</strong></font></font></h3>
			          <h5 class="card-subtitle mb-2 text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><span>${orderList.product_price }원 | ${orderList.order_date } 주문</span></font></font></h5>
			          <p class="card-text"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></p>
			          <br><br>
			          <div>
			          		<c:choose>
			          		<c:when test="${orderList.user_status == 1 }"><strong>결제완료</strong></c:when>
			          		<c:when test="${orderList.user_status == 2 }"><strong>배송중</strong></c:when>
			          		<c:otherwise><strong>배송완료</strong></c:otherwise>
			          		</c:choose>
			         </div>
			         <div><small class="text-muted text-black-50">결제가 완료되었습니다. 이용해주셔서 감사합니다.</small></div><br>
			        </div>
			           <span class="position-absolute top-0 end-0">
			              <a href="#"><img src="img/상세보기.png" alt="상세보기로고" width="90"></a>
			              <br><br>
			            <div><button type="button" class="btn btn-outline-dark btn-sm" id="wbtn">환불 신청</button></div><br>
			            <div><button type="button" class="btn btn-outline-dark btn-sm" id="wbtn">리뷰 작성</button></div>
			         </span>
			      </div>
			   </div>
				</c:forEach>
			</div>
	    </div>
	    <div class="row"></div>
	</div>
	<%-- <p>\${map } : ${map }</p> --%>

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