<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              <img src="./img/과일주스여러개.jpg" alt="..." width= "480px" height="448px">
           <div id="tit">
              <div class="h3"><strong>과일주스~~(제목)</strong></div>
              <div class="text-black-50 h5"><small>건강하게 마시는(더 맛깔나게 꾸미는 글..)</small></div>   
           <hr>
           <div class="item">
              <ul class="list-inline">
              	 <li id="litag">
                     <strong>상품번호</strong> &nbsp;&nbsp;&nbsp;
                     <div>
                         <span> 1번(번호넣어주세요) </span>
                     </div>
                  </li>
                  
                 <li id="litag">
                    <strong>정가</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div>
                    <span>12,000원</span>
                    </div>
                 </li>
                 
                  <li id="litag">
                     <strong>구매제한</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                     <div>
                         <span> 최소  1개  </span>
                     </div>
                  </li>
                   <li id="litag">
                     <strong>상품구분</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                     <div>
                         <span> 식품 </span>
                     </div>
                  </li>
                   <li id="litag">
                     <strong>수량</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <div>
                         <span> 1개 </span>
                     </div>
                  </li>
                  <li id="litag">
                     <strong>상품설명</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                     <div>
                         <span> 필요없으면 삭제만 하세요~ </span>
                     </div>
                  </li>
                  <li id="litag">
                     <strong>할인율</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                     <div>
                         <span> 10% </span>
                     </div>
                  </li>
                  <li id="litag">
                     <strong>상품판매상태</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                     <div>
                         <span> 판매중 </span>
                     </div>
                  </li>
                  <li><br><br></li>
                  <li>
                  <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="margin-top:36px; margin-left: -15px;">
                     <input class="btn btn-success" type="submit" value="상품 목록">
                     <input class="btn btn-success" type="submit" value="상품 수정">
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