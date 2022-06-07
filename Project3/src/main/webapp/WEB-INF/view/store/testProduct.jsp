<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트-상품상세</title>
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
</head>
<style>
.totPage {
	margin: auto;
	width: 1100px;
	padding: 30px;
	
	border: 1px solid gray;
}

.card-photo {
	background-color: aqua;
}

.mainPic {
	width: 1040px;
	height: 600px;
}

.prdNamePrice {
	background-color: yellow;
	padding: 30px;
}

.productInfo {
	background-color: pink;
}

textarea {
	width: 1040px;
	height: 100px;
}

.prdInfoPic {
	width: 1040px;
}

.d-grid {
	padding-top: 15px;
}

.prdQnaContent {
	margin-top: 5px;
}
</style>
<body>
<script>

var product_id = "<c:out value='${product.product_id}'/>";
var nowPage = "<c:out value='${paging.nowPage}'/>";		
		
		
/* $(document).ready(function() {
	alert("입장 ");
	
	/* $('select[name=product_cnt]').change(function() {
		$('#product_cnt').val($(this).val());
			$("#product_cnt").attr("readonly", true);
		}
	}); 
}); */

function replyList(nowPage, product_id) {
	alert("replyList() 실행");
	alert("nowPage : " + nowPage +"\nproduct_id : " + product_id);
	
	$.ajax({
		url : "qnaWithPaging.do",
		type : "post",
		data : {
			'product_id' : product_id,
			'nowPage' : nowPage
		},
		dataType : "json",
		success : function(data){
			var a = '';
			var paging = data.paging;
			var qnaList = data.qnaList;
			var product = data.product;
			
			if(qnaList == null){
				a += '<p>등록된 게시물이 없습니다.</p>';
			}
			$.each(qnaList, function(key, value){
				
				if (value.q_or_a == 0) {
					a += '<div class="prdQnaContent">';
					a += '<p>'+value.qna_content+'</p>';
					a += '<small>'+value.user_nickname+'</small>';
					a += '<hr></div>';
				} else {
					a += '<div class="prdQnaContent">';
					a += '<p>&nbsp;&nbsp;&nbsp;&nbsp;ㄴ [답변완료] '+value.qna_content+'</p>';
					a += '<hr></div>';
				}
				
			});
			
			a+='<nav aria-label="Page navigation example">';
			a+='<ul class="pagination">';
			
			alert("paging.startPage : " + paging.startPage+"\npaging.endPage : " + paging.endPage);
			if (paging.startPage != 1){
				a+='<li class="page-item">';
				a+='<a class="page-link" onclick="replyList('+paging.startPage+'-'+1+',\''+product.product_id+'\')" aria-label="Previous">';
				a+='<span aria-hidden="true">&laquo;</span></a></li>';
			} 
			
			for(var num = paging.startPage; num <= paging.endPage; num++){
				 if(num == paging.nowPage){
					a+='<li class="page-item"><b class="page-link" >'+num+'</b></li>';
				} else {
					a+='<li class="page-item"><a class="page-link" onclick="replyList('+num+',\''+product.product_id+'\')">'+num+'</a></li>';
				} 
			}
			
			if(paging.endPage != paging.lastPage){
				a+='<li class="page-item">';
				a+='<a class="page-link" onclick="replyList('+paging.startPage+'+'+1+',\''+product.product_id+'\')" aria-label="Previous">';
				a+='<span aria-hidden="true">&raquo;</span></a></li>';
			}
					
			a+='</ul></nav>';
			$('.prdList').html(a);
		},
		error : function(){
			alert("오류발생");
		}
	});
} 
</script>
<!-- header -->
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<!-- -------------------------------- -->
<div class="totPage">
	<div>
		<div class="card-photo">
			<img src="../img/고무밴드.jpg" alt="..." class="mainPic">
		</div>
		<div class="prdNamePrice">
			<h1>
				<span>${product.product_name }</span>
			</h1>
			<h1>세션테스트 : ${user.user_id} </h1>
			<c:choose>
				<c:when test="${0 eq product.product_discount }">
					<h3>
						<span>${product.product_price }</span>
					</h3>
				</c:when>
				<c:otherwise>
					<span><strike>${product.product_price * (1- product.product_discount)}원</strike></span>
				</c:otherwise>
			</c:choose>

			<p>
				<span>식품</span>
			</p>
			<form action="cart/insert.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="product_id"
					value="${product.product_id}"> <input type="hidden"
					id="product_cnt" value="product_cnt"> <input type="hidden"
					name="user_id" value="${user_id}">
					<%-- <input type="hidden" name="product_id"
					value="${product.product_discount}"> --%>
				<!-- <input type="hidden" name="product_id" value="88"> -->

				<div>
				<h3>수량선택</h3>
				<select name="cart_product_qty"  style="font-size:30px;" >
					<option value="1" selected>1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
				</select>
				</div>
				<div class="d-grid gap-2">
					<input class="btn btn-primary" type="submit" value="장바구니">
					<input class="btn btn-primary" type="submit" value="구매하기">
				</div>
			</form>
		</div>
	</div>
	<div class="productInfo">
		<img src="../img/고무밴드.jpg" alt="..." class="prdInfoPic">
	</div>
	<br> <br> <br>
	<div class="reviewZone">
		<hr>
		<h3>
			<span>상품후기</span>
		</h3>
		<p>
			<a>베스트순 </a><a> 최신순</a>
		</p>
		<!-- forEach 쓰걸아 -->
		<div class="reviewComment">
			<div>
				<p>아이디:id</p>
			</div>
			<p>
				<span>맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절맛있어서기절</span>
			</p>
			<hr>
		</div>
	</div>
	<br> <br>
	<div class="prdQnaZone">
		<h3>
			<span>상품문의</span>
		</h3>
		<br>
		
		<div class="prdList">
	
			<script>
			replyList(nowPage, product_id);
			</script>

		</div> 
		
		<c:choose>
			<c:when test="${empty user }">
				<br>
				<p>상품문의는 로그인 후 가능합니다.</p>
				<a href="login.do">로그인</a>
			</c:when>
			<c:otherwise>
				<div id="prdQnaWrite">
					<%-- <form id="prdQnaForm" action="insertPrdQna.do?product_id=${product.product_id }"method="post">
					 --%><form id="prdQnaForm" role="form" method="post">
						<textarea id="txtara" name="qna_content"></textarea>
					</form>
						<button type="button" id="testBtn" onclick="writeQna()">등록</button>
				</div>
			</c:otherwise>
		</c:choose>
		
</div>


<script>

	function writeQna() {
		console.log("writeQna() 실행~~")
		var contentBlank = $("#prdQnaForm").children("textarea").val()
				.trim();
		console.log("contentBlank : " + contentBlank);
		if (contentBlank.length == 0) {
			alert("내용이 없어요.");
		} else {
			alert("product_id, nowPage : " + product_id +','+nowPage);
			
			var formObj = $("#prdQnaWrite form[role='form']");
			var qna_content = $("#txtara").val();
			
			alert("formObj,qna_content :" +formObj+","+ qna_content);
			
			var data = {
				'nowPage' : null,
				'qna_content' : qna_content,
				'product_id' : product_id
						};
			alert("data : " + data);
			
			$.ajax({
				url : 'writePrdQna.do',
				type : 'post',
				data : data,
				success : function(){
					$("#txtara").val("");
					replyList(nowPage, product_id);
				},
				error : function(){
					alert("오류발생");
				},
				complete : function(){
					alert("complete()");
				}
			});
		}
	}
	
</script>


<!-- footer -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</body>
</html>