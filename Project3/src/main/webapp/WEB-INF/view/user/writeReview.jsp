<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품후기 작성</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
.reviewTitle{
	background-color: #8FF34D;
	height: 80px;
	font-size: 27px;
	font-weight: 700;
	
	display: table;
}
.wrtRV {
	 display: table-cell;
     vertical-align: middle;
     text-align: center;
}
.back {
	/* background-color: gray; */
	margin-top:10px;
}
.nameZone{
	/* background-color: aqua; */
	display: table;
	
	margin-left:10px;
}
.nameZone>div{
	display: table-cell;
    vertical-align: middle;
}
.prdName {
	 /* background-color: pink; */
	 font-size: 24px;
}

.imgLine {
	padding:15px;
}
.starZone {
	/* background-color: yellow; */
	text-align: center;
	height:90px;
	margin-top:-25px;
}

p>a  {
	text-decoration: none;
	font-size:65px;
}
.on{
	
	color: #DEDEDE;
}


.txtZone{
	margin-top:10px;
}
.btnZone{
	margin-top:15px;
	margin-left:1px;
}
.btn{
	height:70px;
	font-size:27px;
}
textarea{
	border: solid 1px gray;
	background-color: #FCF9F9;
	border-radius: 10px;
	padding: 15px;
}
.prdImg{
	padding-left:20px;
}


</style>
<script>

function closeReview() {
	let cfm = confirm("리뷰 작성을 취소하시겠습니까?");
	if(cfm){
		window.close();
	}
}

//별점 vlaue 추가
function mark(star) {
	$('#rvGrade').attr('value',star);
	show(star);
}
// 별점 색상 변경
function show(star) {
	$('.on').css('color','#DEDEDE');
	$('p>a').slice(0,star).css('color','red');
}

function reviewSubmit() {
	 
	let contentBlank = $("#reviewFrm").find("textarea").val().trim();
	let starGrade = $('#rvGrade').val();
	if(starGrade == 0){
		alert('별점을 입력해주세요.');
	} else if(contentBlank.length == 0){
		alert("내용을 입력해주세요.");
	} else {
		
		
		var params = $("#reviewFrm").serialize();

		$.ajax({
	       type: "POST",
	       url: "insertReview.do?order_detail_id=${myOrder.ORDER_DETAIL_ID }",
	       data: params,      
	        success: function (data) {
	
	           window.close();
	           window.opener.location.href="${pageContext.request.contextPath }/myinfo.do";
	           
	       }, error: function (jqXHR, textStatus, errorThrown) {
	          alert(jqXHR + ' ' + textStatus.msg);
	       }

		});
	}
	
}
</script>
</head>
<body>
    <div class="container-fluid reviewTitle ">
    	<div class="wrtRV">리뷰쓰기</div>
    </div>
	<div class="container-fluid back">
	<form id="reviewFrm" action="${pageContext.request.contextPath }/insertReview.do?order_detail_id=${myOrder.ORDER_DETAIL_ID }">
	    <div class="row">
	        <div class="col-sm-12 row imgLine">
	        	<div class="col-sm-4 prdImg">
	        		<img alt="상품사진" class="img-fluid" src="${pageContext.request.contextPath }/img/${myOrder.PRODUCT_PIC }">
	        	</div>
        		<div class="col-sm-8 row nameZone">
        			<div class="container">
					    <div class="row orderInfo">
					        <div class="col-sm-12 prdName">${myOrder.PRODUCT_NAME }</div>
					        <div class="col-sm-12">구매수량 : ${myOrder.USER_ORDER_CNT }</div>
					    </div>
					</div>
        		</div>
	        </div>
	       <hr>
	        <div class="col-sm-12">
		        <p style="text-align: center; font-size: 25px;">상품은 만족하셨나요?</p>
	        </div>
	        <div class="col-sm-12 row starZone">
	        	<span>
	        		<p class="star_rating">
	        			<a onclick="mark(1)" class="on">★</a>
	        			<a onclick="mark(2)" class="on">★</a>
	        			<a onclick="mark(3)" class="on">★</a>
	        			<a onclick="mark(4)" class="on">★</a>
	        			<a onclick="mark(5)" class="on">★</a>
	        		</p>
	        	</span>
	        	<input type="hidden" id="rvGrade" name="review_grade">
	        </div>
	        <div class="col-sm-12 txtZone">
	        	<textarea style="width:100%; " rows="18" name="review_content"></textarea>
	        </div>
	        <div class="col-sm-12 row btnZone">
		        <div class="col-sm-6" >
		        	<button class="btn col-sm-12 btn-lg btn-secondary" type="button" 
		        				onclick="closeReview()">취소</button>
		        </div>
	        	<div class="col-sm-6">
		        	<input class="btn  col-sm-12 btn-lg" type="button" 
		        					style="background-color:#8FF34D;" onclick="reviewSubmit()" value="등록">
		        	
	        	</div>
	        	
	        </div>
	        
	    </div>
	  </form>
	</div>


</body>
</html>