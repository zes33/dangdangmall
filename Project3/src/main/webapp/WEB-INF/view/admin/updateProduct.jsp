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
 margin-bottom: 200px;
 
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
.bao {
	margin: 10px;
	font-size: 15px;
}

</style>
<title>상품 수정(관리자)</title>
<script>
function updateProduct() {
	alert("상품수정 실행");
	
	//할인율 유효성 검사
	var dc = $('#product_discount').val();
	alert("dc : " + dc);
	if(dc > 100 || dc < 0){
		alert("할인율은 0~100 사이의 숫자로 입력해주세요.");
		return false;
	}
	
	var prd = $('#prdForm');
	
	var length = $('input').length;
	for (let i = 1; i < length-3; i++) {
		if ($.trim($('input').eq(i).val()) == "") {
			alert($('input').eq(i).attr('title') + '을 입력하세요');
			$('input').eq(i).focus();
			//return; // --------없으면 제출함
			return false;
		}
	}
	
	
	prd.submit();
}


function setThumbnail(event) {
	let tg = event.target.name;
	if(tg == 'pic_file'){
		$('#t1').empty();
		let lo = $('#thm1');
		addImg(lo);
		lo.empty();
	} else if(tg == 'info_file'){
		$('#t2').empty();
		let lo = $('#thm2');
		addImg(lo);
		lo.empty();
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
   		<strong style="font-size:3vw">&lt; 상품 수정 &gt;</strong>
   	</div>
   
   <div class="contents">
   <div id="body-wrapper" >
   <div id="body-content" >
   
   <form action="updateProduct.do" method="post" class="h3" id="prdForm" enctype="multipart/form-data">
     <strong>상품등록번호(*)</strong> <input value="${product.product_id }" type="text" class="form-control" disabled
                     maxlength="20"><br/><br>
                     <input type="hidden" name="product_id" value="${product.product_id }" >
    <strong>상품명*</strong> <input value="${product.product_name }" type="text" class="form-control f1" placeholder="상품명을 입력하세요." 
    				title="상품명" name="product_name" maxlength="20"><br/><br>
    <strong>상품 카테고리*</strong> <select name="category_code" class="f2">
    		  	<option value="1" selected>식품</option>
    		  	<option value="2" selected>운동</option>
    		  </select><br/><br/><br>
   <strong>상품금액*</strong> <input value="${product.product_price }" type="text" class="form-control f3" placeholder="금액을 입력하세요" 
    				title="상품금액" name="product_price" maxlength="20"><br/><br>
    
    <div><strong>상품 입고수량*</strong></div> <span><input value="${product.product_stock }" type="text" id="shot" class="form-control f4" style="float:left" 
    				title="입고수량" name="product_stock" maxlength="10"></span><p style="font-size: 20px; ">개</p><br/><br><br>
  	 <div><strong>할인율</strong></div> <span>
  	 <input value="${product.product_discount*100 }" type="text" id="shot" class="form-control f5" style="float:left"
    			title="할인율"	id="product_discount" value="0" name="product_discount" maxlength="3"></span><strong>%</strong><br/><br><br>
   <br>
   			<strong>상품 상태*</strong> 
     		<select name="product_state" class="f2">
		  	<option value="1" selected>판매중</option>
		  	<option value="2" >판매중지</option>
		  	</select><br/><br/><br>
   
	<div class="mb-3">
  		<label for="formFile" class="form-label"><strong>상품사진*</strong></label>
  		<input onchange="setThumbnail(event);" title="상품사진" class="form-control f6" name="pic_file" type="file" id="pic_file">
	</div>  
	
					 
	<div id="result1">
		<div class="bao" id="f1"><p id="t1">${product.product_pic }</p></div>
	</div>
	<div id="thm1"></div>
	
	
   <br><br>
   
   
	<div class="mb-3">
  		<label for="formFile" class="form-label"><strong>상품정보*</strong></label>
  		<input onchange="setThumbnail(event);" title="상세정보" class="form-control f7" name="info_file" type="file" id="info_file">
	</div> 
	
	
	<div id="result2">
		<div class="bao" id="f2"><p id="t2">${product.product_info }</p></div>
	</div> 
	<div id="thm2"></div>				 
            <br/><br>
     
     
     
   <table>
      <tr>
      	<td>
         <input type="reset" class="btn btn-secondary btn-lg" id="btn" value="취소">&nbsp;&nbsp;&nbsp;
         <a class="btn btn-secondary btn-lg" onclick="updateProduct()" id="btn">수정</a>
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