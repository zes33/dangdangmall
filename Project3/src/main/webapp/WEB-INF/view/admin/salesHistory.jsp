<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 내역</title>
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
#container {
	width: 1200px;
	margin: auto;
}

h1, h3, p {
	text-align: center;
}

table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
	margin: 0 auto;
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

/* adminTemplate 아래 */
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
#navul {float: center;
		text-align: center;
		margin:auto;
		display:inline-block;
}
.navul {
    list-style:none;
    margin:auto;
    padding:0;
 	float: center;
    text-align: center;
    display:inline-block;
}

.navul>li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
    /* margin: auto; */
    text-align: center;
    display:inline-block;
}
/*
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
} */
</style>
</head>
<body>
<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>

		<div class="container">
			<jsp:include page="sidebarTemplate.jsp"></jsp:include>
			<div class="menuname h1 text-center center"
				style="background-color: rgb(240, 240, 240);  padding-top: 45px !important;">
				<strong style="font-size: 3vw">&lt; 판매내역 &gt;</strong>
			</div>
<%-- <h1>salesHistory.jsp</h1>
${all } --%>

<div style="margin-top: 60px;">
				<c:if test="${empty all}">
					<br />
					<h2>판매내역이 존재하지 않습니다.</h2>
				</c:if>


				<c:if test="${not empty all}">
					<!--판매 내역 목록 -->
					<table class="table table-hover table1">
						<thead>
							<tr>
								<th class="center" width="10%">주문 번호</th>
								<th class="center" width="7%">총구매 가격 </th>
								<th class="center" width="10%">고객 아이디</th>
								<th class="center" width="10%">주문일자</th>
								<th class="center" width="5%">수령인</th>
								<th class="center" width="13%">연락처</th>
								<th class="center" width="25%">배송주소</th>
								<th class="center" width="8%">배송상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${all }">
								<tr>
									<td class="center"><a
								href="salesHistory/salesHistoryOne.do?order_id=${list.order_id }"
								class="text-decoration-none text-dark">${list.order_id}</a></td>
									<td class="center"><a
								href="salesHistory/salesHistoryOne.do?order_id=${list.order_id }"
								class="text-decoration-none text-dark">
								<c:choose>
										<c:when test="${100000  lt list.order_total}"><fmt:formatNumber
										type="number" maxFractionDigits="3"
										value="${list.order_total- 2500 }" />원</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${list.order_total }"
												type="number" /> 
										</c:otherwise>
									</c:choose>
								
								</a></td>
									<td class="center"><a
								href="salesHistory/salesHistoryOne.do?order_id=${list.order_id }"
								class="text-decoration-none text-dark">${list.user_id }</a></td>
									 <td class="center"><a
								href="salesHistory/salesHistoryOne.do?order_id=${list.order_id }"
								class="text-decoration-none text-dark">${list.order_date}</a></td> 
									<td class="center"><a
								href="salesHistory/salesHistoryOne.do?order_id=${list.order_id }"
								class="text-decoration-none text-dark">${list.order_receiver }</a></td>
									 <td class="center"><a
								href="salesHistory/salesHistoryOne.do?order_id=${list.order_id }"
								class="text-decoration-none text-dark">
								<c:set var="user_phone" value="${list.order_phone }" />
								<c:if test="${ '-' eq fn:substring(user_phone,3,4)}"> 
									${list.order_phone }
									</c:if> 
									<c:if test="${ '-' ne fn:substring(user_phone,3,4)}"> 
									${fn:substring(user_phone,0,3) }-${fn:substring(user_phone,3,7) }-${fn:substring(user_phone,7,11) }
									</c:if> 
								
								</a></td>
									<td class="center"><a
								href="salesHistory/salesHistoryOne.do?order_id=${list.order_id }"
								class="text-decoration-none text-dark">${list.order_addr }<br>
										${list.order_addr_d }&nbsp;[${list.order_zipcode }]
									</a></td>
									<td class="center">
									<c:if test="${1 eq list.user_status }"> [주문 완료] </c:if> 
									<c:if test="${2 eq list.user_status }"> [배송중] </c:if> 
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
			
		<div  style="text-align: center; float: center; margin-bottom: 70px;">
			<nav class="navul">
              <ul class="navul">
              
              
              <c:if test="${paging.startPage != 1 }">
                <li class="page-item">
                  <a class="page-link" href="salesHistoryView.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"
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
                         <li class="page-item"><a class="page-link" href="salesHistoryView.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                     </c:when>
                  </c:choose>
               </c:forEach>
               
                <c:if test="${paging.endPage != paging.lastPage }">
                <li class="page-item">
                  <a class="page-link" href="salesHistoryView.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}" aria-label="Previous">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
               </c:if> 
                
              </ul>
            </nav>
			
			
		</div>	
		</div>

</body>
</html>