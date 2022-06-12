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

.prdPic{
	width: 400px;
	height: 400px;
}


</style>
<title>상품 등록(관리자)</title>
<script>
function insertProduct() {
	
	//할인율 유효성 검사
	var dc = $('#product_discount').val();
	if(dc > 100 || dc < 0){
		alert("할인율은 0~100 사이의 숫자로 입력해주세요.");
		return false;
	}
	
	var prd = $('#prdForm');
	
	var length = $('input').length;
	for (let i = 1; i < length; i++) {
		if ($.trim($('input').eq(i).val()) == "") {
			alert($('input').eq(i).attr('title') + '을 입력하세요');
			$('input').eq(i).focus();
			return; // --------없으면 제출함
		}
	}
	prd.submit();
}

function setThumbnail(event) {
	let tg = event.target.name;
	if(tg == 'pic_file'){
		let lo = $('#thm1');
		lo.empty();
		addImg(lo);
	} else if(tg == 'info_file'){
		let lo = $('#thm2');
		lo.empty();
		addImg(lo);
	}
}

function addImg(lo) {
	var reader = new FileReader();

    reader.onload = function(event) {
    	var img = document.createElement("img");
      	img.setAttribute("src", event.target.result);
      	img.className = 'prdPic';
      	lo.append(img);
	 };
	 reader.readAsDataURL(event.target.files[0]);
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
   		<strong style="font-size:3vw">&lt; 상품 등록 &gt;</strong>
   	</div>
   
   <div class="contents" style="margin-bottom: 100px;">
   <div id="body-wrapper" >
   <div id="body-content" >
   
   <form action="insertProduct.do" method="post" class="h3" id="prdForm" enctype="multipart/form-data">
   		<strong>상품등록번호(*) 자동생성</strong> 
     	<input type="text" class="form-control" disabled maxlength="20"><br/><br>
    	<strong>상품명*</strong> <input title="상품명" type="text" class="form-control f1" placeholder="상품명을 입력하세요." 
    				 name="product_name" maxlength="20"><br/><br>
    	<strong>상품 카테고리*</strong> 
    	<select name="category_code" class="f2">
 		  	<option value="1" selected>식품</option>
 		  	<option value="2" selected>운동</option>
 		 </select><br/><br/><br>
		  <strong>상품금액*</strong> 
		   <input title="금액" type="number" min="0" class="form-control f3" placeholder="금액을 입력하세요" 
    				 name="product_price" maxlength="20"><br/><br>
    
    <div><strong>상품 입고수량*</strong></div> <span><input title="수량" type="number" min="0" id="product_discount" class="form-control f4" style="float:left" 
    				 name="product_stock" maxlength="10"></span><br/><br><br>
  	 <div><strong>할인율</strong></div> <span><input title="할인율" type="number" min="0" max="100" id="shot" class="form-control f5" style="float:left"
    				 name="product_discount" maxlength="3"></span><strong>%</strong><br/><br><br>
   <br>
	<div class="mb-3">
  		<label for="formFile" class="form-label"><strong>상품사진*</strong></label>
  		<input onchange="setThumbnail(event);" title="상품사진" class="form-control f6" name="pic_file" type="file" id="formFile">
	</div>  
	<div id="thm1"></div>				 
   <br>
	<div class="mb-3">
  		<label for="formFile" class="form-label"><strong>상품정보*</strong></label>
  		<input onchange="setThumbnail(event);" title="상세설명 파일" class="form-control f7" name="info_file" type="file" id="formFile">
	</div>  
	<div id="thm2"></div>				 
            <br/><br>
   <table>
      <tr>
      	<td>
         <button type="reset" class="btn btn-secondary btn-lg" id="btn" >&nbsp;&nbsp;초기화</button>
         <button type="button" class="btn btn-secondary btn-lg" onclick="insertProduct()" id="btn">상품 등록하기</button>
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