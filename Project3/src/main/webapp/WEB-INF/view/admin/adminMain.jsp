<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
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
  #container { width: 800px; margin: auto; height: 200px; background-color: light;}
   table, th, td {
      margin: 0 auto;
      text-align: center;
   }
   th {
      border-bottom: 1px solid black;
   }
   .btn {
      width: 170px;
   }
   
   td {
   	height: 27px;
   }
   
</style>
</head>
<body>
   
   <header>
      <jsp:include page="../common/header.jsp"></jsp:include>
   </header>
   <table id="container">
      <thead>
         <tr class="fs-4">
            <th>상품관리</th>
            <th>상품후기/문의</th>
            <th>회원관리</th>
            <th>주문관리</th>
            <th>매출관리</th>
         </tr>
      </thead>
         <tr>
            <td><button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath }/adminProductList.do'">상품 목록</button></td>
            <td><button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath }/adminReviewList.do'">상품후기 조회</button></td>
            <td><button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath }/admin/adminUserList.do'">회원정보 조회</button></td>
            <td><button type="button" class="btn btn-light" onclick="location.href='#'">판매내역 조회</button></td>
            <td><button type="button" class="btn btn-light" onclick="location.href='salesView.do'">매출 조회</button></td>
         </tr>
         <tr>
            <td><button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath }/goInsertProduct.do'">상품 등록</button></td>
             <td><button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath }/adminProductQnaList.do'">상품 문의 조회</button></td>
             <td><button type="button" class="btn btn-light" onclick="location.href='adminGetCenterList.do'">고객 문의 목록</button></td>
            <td><button type="button" class="btn btn-light" onclick="location.href='#'">배송상태 변경</button></td>
            <td></td>
            <!-- <td></td> -->
         </tr>
         <tr>
            <td></td>
            <td></td>
            <td></td>
            <td><button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath }/adminRefund/adminRefundView.do'">환불 요청 목록</button></td>
            <td></td>
             <td></td>
         </tr>
         <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
         </tr>
   </table>
   
</body>

</html>