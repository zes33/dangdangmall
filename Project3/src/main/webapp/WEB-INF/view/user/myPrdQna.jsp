<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 상품문의</title>
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
   /* th {
      font-size: 36px;
      height: 70px;
      padding-bottom: 0px;
   } */
   .titleTh {
      font-size: 36px;
      height: 70px;
      padding-bottom: 0px;
   } 
   .colMan { 
      padding: 0px;
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
   
   .qnaTitle {
      text-decoration: none;
      color: black;
   }
   
   .mine > th {
      font-size: 20px;
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
                 <th class="titleTh">회원등급</th>
                 <th class="titleTh">배송중</th>
                 <th class="titleTh">포인트</th>
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
              <%-- <div><p><b><a href="${pageContext.request.contextPath }/cart/list.do">장바구니</a></b></p></div>
               --%><div><p><b><a href="${pageContext.request.contextPath }/goMyPrdQna.do">상품 문의내역</a></b></p></div>
              <div><p><b><a href="${pageContext.request.contextPath }/user/myCenterQna.do">기타 문의내역</a></b></p></div>
              <div><p><b><a href="${pageContext.request.contextPath }/goMyReview.do">후기내역</a></b></p></div>
           </div>
           <div class="col-md-10 whoru"><!-- 여기에 채우세요 -->
           <br>
           <h3>[상품문의 내역]</h3>
              <table class="mine table table-hover table1">
               <thead>
                  <tr>
                     <th class="center" width="7%">NO.</th>
                     <th class="center" width="15%">상품명</th>
                     <th class="center" width="39%">내용</th>
                     <th class="center" width="15%">작성일</th>
                     <th class="center" width="15%">답변상태</th>
                  </tr>
               </thead>
               <tbody>
               <c:choose>
               <c:when test="${empty myPrdQnaList  }">
                  <tr>
                     <td colspan="5">등록된 상품문의가 없습니다.</td>
                  </tr>
               </c:when>
               <c:otherwise> 
               <c:forEach var="myPrdQna" items="${myPrdQnaList }" varStatus="i">
                  <tr>
                     <td class="center">${myPrdQna.R_NUM }</td>
                     <td><span class="d-inline-block text-truncate" style="max-width: 180px;">${myPrdQna.PRODUCT_NAME }</span></td>
                     <!-- 누르면 문의(+답변) 모두 보이는 페이지로 이동 -->
                     <td class="center ">
                        <a class="qnaTitle " href="adminViewPrdQnaOne.do?qna_group=${myPrdQna.QNA_GROUP }">
                        ${myPrdQna.QNA_CONTENT }</a>
                     </td>
                     
                     <td class="center">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${myPrdQna.PRODUCT_QNA_DATE }"/>
                     </td>
                     <c:choose>
                     <c:when test="${0 eq myPrdQna.PRODUCT_QNA_STATE }">
                        <td class="center">답변대기</td>
                     </c:when>
                     <c:otherwise>
                        <td class="center" style="color: #C9C7C7;">답변완료</td>
                     </c:otherwise>
                     </c:choose>
                  </tr>
               </c:forEach>
               </c:otherwise>
               </c:choose>
               </tbody>
            </table>            
            
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
              
              
              <c:if test="${paging.startPage != 1 }">
                <li class="page-item">
                  <a class="page-link" href="goMyPrdQna.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"
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
                         <li class="page-item"><a class="page-link" href="goMyPrdQna.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                     </c:when>
                  </c:choose>
               </c:forEach>
               
                <c:if test="${paging.endPage != paging.lastPage }">
                <li class="page-item">
                  <a class="page-link" href="goMyPrdQna.do?nowPage=${paging.endPage+1  }&cntPerPage=${paging.cntPerPage}" aria-label="Previous">
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