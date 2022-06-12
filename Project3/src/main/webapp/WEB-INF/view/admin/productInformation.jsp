<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품개별정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

.goods{
   position: relative;
}
#litag {
   display: -webkit-box;
   display: -moz-box;      
   display: -ms-flexbox;   
   display: -webkit-flex;   
   display: flex;   
   margin: 15px 0px;
}
#tit {
   width: 450px;
   position: absolute;
   top: -15px;
   left: 550px;
}
 .box {margin:20px auto;}
.content {
	width:800px;
	padding:10px;
	border:1px solid #ddd;
}
.btn {
	width: 150px;
}
</style>
<script>
$(document).ready(function () {

	$(".1").html("식품");
	$(".2").html("운동");

	$(".a1").html("판매중");
	$(".a2").html("판매중지");

})


function editPrrd(product_id) {
	let f = document.createElement("form");
	
	let obj = document.createElement('input');
	obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'product_id');
    obj.setAttribute('value', product_id);
	
 	f.appendChild(obj);
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'goUpdateProduct.do');
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
   		<strong style="font-size:3vw">&lt; 상품개별정보 &gt;</strong>
   	</div>
   
   <div class="contents">
   	<div class="goods">
              <img src="./img/${product.product_pic }" alt="..." width= "480px" height="448px">
           <div id="tit">
              <div class="h3"><strong>${product.product_name }</strong></div>
           <hr>
           <div class="item">
              <ul class="list-inline">
              	 <li id="litag">
                     <strong>상품번호</strong> &nbsp;&nbsp;&nbsp;
                     <div>
                         <span> ${product.product_id } </span>
                     </div>
                  </li>
                  
                 <li id="litag">
                    <strong>정가</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div>
                    <span>
                    	<fmt:formatNumber value="${product.product_price }" pattern="#,###" />원
                    </span>
                    </div>
                 </li>
                 
                   <li id="litag">
                     <strong>상품 분류</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                     <div>
                         <span class="${product.category_code }"> </span>
                     </div>
                  </li>
                   <li id="litag">
                     <strong>재고</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <div>
                         <span> ${product.product_stock } </span>
                     </div>
                  </li>
                  <li id="litag">
                     <strong>할인율</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                     <div>
                         <span>
                         	<fmt:formatNumber value="${product.product_discount * 100}" pattern="#,###" />%
                         </span>
                     </div>
                  </li>
                  <li id="litag">
                     <strong>상품판매상태</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                     <div>
                         <span class="a${product.product_state }">  </span>
                     </div>
                  </li>
                  <li><br><br></li>
                  <li>
                  <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="margin-top:36px; margin-left: -15px;">
                     <a href="${pageContext.request.contextPath }/adminProductList.do?nowPage=${paging.nowPage }&cntPerPage=${paging.cntPerPage }&searchCondition=${searchCondition }&searchKeyword=${searchKeyword }&prd_state=${prd_state }&prd_category=${prd_category}" 
                     class="btn btn-success" type="button">상품 목록</a>
                     <!-- <button onclick="goPrdList()" class="btn btn-success" type="button">상품 목록</button>
                      -->
                     <button onclick="editPrrd(${product.product_id})" class="btn btn-success" type="button" >상품 수정</button>
                    </div>
               </li>
              </ul>
           </div>
        </div>
     </div>
     <br>
   
   </div>
</div>
</body>
</html>