<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
#ss {
	position:relative;
	width: 700px;
	top: 250px;
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
}
#body-wrapper {
    min-height: 100%;
    position: relative;
}
#body-content {
	width: 400px;
}
#shot {
	width: 100px;
}
#btn {
	width: 150px;
}



</style>
<title>상품 등록(관리자)</title>
</head>
<body>
	<header>
      <jsp:include page="../common/header.jsp"></jsp:include>
   </header>

<div class="container">
   <jsp:include page="sidebarTemplate.jsp"></jsp:include>
   	<div class="menuname h1 text-center center" style="background-color:rgb(240, 240, 240);">
   		<strong style="font-size:3vw">&lt; 상품 등록 &gt;</strong>
   	</div>
   
   <div class="contents">
   <div id="body-wrapper">
   <div id="body-content">
   <form action="" method="post" class="h3" id="input">
     <strong>상품등록번호(*) 자동생성</strong> <input type="text" class="form-control" disabled
                     name="" maxlength="20"><br/><br>
    <strong>상품명*</strong> <input type="text" class="form-control" placeholder="상품명을 입력하세요." 
    				 name="" maxlength="20"><br/><br>
    <strong>상품 카테고리*</strong> <select name="" id="">
    		  	<option value="식품" selected>식품</option>
    		  	<option value="운동" selected>운동</option>
    		  </select><br/><br/><br>
   <strong>상품금액*</strong> <input type="text" class="form-control" placeholder="금액을 입력하세요" 
    				 name="" maxlength="20"><br/><br>
    
    <div><strong>상품 입고수량*</strong></div> <span><input type="text" id="shot" class="form-control" style="float:left" 
    				 name="" maxlength="10"></span><strong>개</strong><br/><br><br>
  	 <div><strong>할인율</strong></div> <span><input type="text" id="shot" class="form-control" style="float:left"
    				 name="" maxlength="3"></span><strong>%</strong><br/><br><br>
   <br>
	<div class="mb-3">
  		<label for="formFile" class="form-label"><strong>상품정보*</strong></label>
  		<input class="form-control" type="file" id="formFile">
	</div>  				 
            <br/><br>
   <table>
      <tr>
      	<td>
         <input type="reset" class="btn btn-secondary btn-lg" id="btn" value="취소">&nbsp;&nbsp;&nbsp;
         <a class="btn btn-secondary btn-lg" href="#" id="btn">상품 등록하기</a>
      	</td>
      </tr>
   </table>
   </form>
</div>
</div>
   
   
   </div>
</div>
   

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>