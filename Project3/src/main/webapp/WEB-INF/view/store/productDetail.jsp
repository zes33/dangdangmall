<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
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
}

.goods {
	position: relative;
}

.prdNamePrice {
	padding: 30px;
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
	top: 5px;
	left: 550px;
}

.box {
	margin: 20px auto;
}

.content {
	width: 800px;
	padding: 10px;
	border: 1px solid #ddd;
}

.star {
	width: 70px;
}

.reviewid {
	width: 60px;
}

.reviewdt {
	width: 120px;
}

.grade {
	color: red;
}
</style>
<body>
	<script>

	
$(document).ready(function () {
	
	$(".1").html("&#9733;");
	$(".2").html("&#9733;&#9733;");
	$(".3").html("&#9733;&#9733;&#9733;");
	$(".4").html("&#9733;&#9733;&#9733;&#9733;");
	$(".5").html("&#9733;&#9733;&#9733;&#9733;&#9733;");
	
	
	$(".a1").html("식품");
	$(".a2").html("운동");
})

var product_id = "<c:out value='${product.product_id}'/>";
var nowPage = "<c:out value='${paging.nowPage}'/>";	


function replyList(nowPage, product_id) {
	/* alert("replyList() 실행");
	alert("nowPage : " + nowPage +"\nproduct_id : " + product_id); */
	if(nowPage == 0){
		nowPage = 1;
	}
	
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
					a += '<p>&nbsp;&nbsp;&nbsp;&nbsp;ㄴ <b>[답변완료]</b> '+value.qna_content+'</p>';
					a += '<hr></div>';
				}
				
			});
			
			a+='<nav aria-label="Page navigation example">';
			a+='<ul class="pagination">';
			
			/* alert("paging.startPage : " + paging.startPage+"\npaging.endPage : " + paging.endPage); */
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
				a+='<a class="page-link" onclick="replyList('+paging.endPage+'+'+1+',\''+product.product_id+'\')" aria-label="Previous">';
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

		<nav id="navbar-example2"
			class="navbar navbar-light bg-white px-3 sticky-lg-top border-bottom border-top">
			<a class="navbar-brand" href="#"><img src="./img/상세페이지위로.png"
				alt="상세페이지위로로고" width="20"></a>
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link text-dark"
					href="#scrollspyHeading1"><strong>상품 설명</strong></a></li>
				<li class="nav-item"><a class="nav-link text-black-50"><small>|</small></a>
				</li>
				<li class="nav-item"><a class="nav-link text-dark"
					href="#scrollspyHeading2"><strong>상세 정보</strong></a></li>
				<li class="nav-item"><a class="nav-link text-black-50"><small>|</small></a>
				</li>
				<li class="nav-item"><a class="nav-link text-dark"
					href="#scrollspyHedding3"><strong>후기&nbsp;&nbsp;<span
							class="text-danger">${fn:length(reviewList) }</span></strong></a></li>
				<li class="nav-item"><a class="nav-link text-black-50"><small>|</small></a>
				</li>
				<li class="nav-item"><a class="nav-link text-dark"
					href="#scrollspyHedding4"><strong>상품 문의</strong></a></li>
			</ul>
			<hr>
		</nav>
		<div class="goods">
			<img src="./img/과일주스여러개.jpg" alt="..." width="480px" height="448px">
			<div id="tit">
				<div class="h3">
					<strong>${product.product_name }</strong>
				</div>
				<div class="text-black-50 h5">
					<small>건강하게 먹는</small>
				</div>
				<hr>
				<div class="item">
					<ul class="list-inline">
						<li id="litag"><strong>정가</strong>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div>
								<del>
									<span> <fmt:formatNumber type="number"
											maxFractionDigits="3" value="${product.product_price}" />
									</span> 원
								</del>
							</div></li>
						<li class="price " id="litag"><strong>판매가</strong>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div>
								<strong style="color: #d1221d;"> <fmt:formatNumber
										type="number" maxFractionDigits="3"
										value="${product.product_price * (1- product.product_discount)}" />
								</strong><strong style="color: #d1221d; font-size: 14px;">원</strong> <strong
									style="color: #d1221d; font-size: 14px;">(${product.product_discount * 100}%)</strong>
							</div></li>
						<li id="litag"><strong>구매제한</strong> &nbsp;&nbsp;&nbsp;&nbsp;
							<div>
								<span> 최소 1개 </span>
							</div></li>
						<li id="litag"><strong>상품구분</strong> &nbsp;&nbsp;&nbsp;&nbsp;
							<div>
								<span class="a${product.category_code }"></span>
							</div>

							<form enctype="multipart/form-data">

								<input type="hidden" name="product_id"
									value="${product.product_id}"> <input type="hidden"
									name="user_id" value="${user_id}"></li>

						<li id="litag"><strong>수량</strong>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div>
								<span> <select name="cart_product_qty"
									id="cart_product_qty" style="font-size: 15px;">
										<option value="1" selected>1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
								</select>
								</span>
							</div></li>
						<li><br> <br></li>
						<li>
							<div class="d-grid gap-2 mx-auto">
								<button type="button" class="btn btn-block btn-success"
									onclick="goCart('${user_id}',${product.product_id})">장바구니
									담기</button>
								<script type="text/javascript">
                     			function goCart(user_id, product_id) {
                     				if(!user_id){
                     					alert("로그인 이후에 장바구니 담기가 가능합니다. \n로그인 페이지로 이동합니다. ");
                     					location.href="login.do";
                     				} else{
									//alert(user_id + " : " +product_id + " : " + $("#cart_product_qty").val());
									location.href="cart/insert.do?product_id="+product_id+"&cart_product_qty="+$("#cart_product_qty").val();
                     				}
                     				}
                    			</script>
								<button type="button" class="btn btn-block btn-success"
									onclick="goBuy('${user_id}',${product.product_id})">바로
									구매하기</button>
								<script type="text/javascript">
										function goBuy(user_id, product_id) {
											if(!user_id){
		                     					alert("로그인 이후에 구매 가능합니다. \n로그인 페이지로 이동합니다. ");
		                     					location.href="login.do";
		                     				} else{
											//alert(user_id + " : " +product_id + " : " + $("#cart_product_qty").val());
											location.href="cart/orderDirect.do?product_id="+product_id+"&cart_product_qty="+$("#cart_product_qty").val();
		                     				}
		                     				}
									</script>
								</form>
								<%-- <form action="cart/orderDirect.do" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="product_id"
										value="${product.product_id}"> <input type="hidden"
										id="cart_product_qty" value="cart_product_qty">
								</form> --%>

							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<hr>
		<br>
		<div data-bs-spy="scroll" data-bs-target="#navbar-example2"
			data-bs-offset="0" class="scrollspy-example" tabindex="0">
			<h4 id="scrollspyHeading1">
				<strong>상품 설명</strong>
			</h4>
			<div class="productInfo">
				<img src="./img/고무밴드.jpg" alt="..." class="prdInfoPic">
				<h1>설명은 여기에~~</h1>
			</div>
			<h4 id="scrollspyHeading2">
				<strong>상세 정보</strong>
			</h4>
			<p>상세 정보는 여기에~~~~</p>
			<h4 id="scrollspyHedding3">
				<strong>상품후기&nbsp;&nbsp;<span class="text-danger">${fn:length(reviewList) }</span></strong>
			</h4>
			<div class="reviewZone">
				<hr>
				<!-- <p>
					<a class="text-dark text-decoration-none"><strong>별점순</strong></a><small
						class="text-muted"> | </small> <a
						class="text-dark text-decoration-none"><strong>최신순</strong></a>
				</p> -->

				<!-- forEach 쓰걸아 -->
				<div class="reviewComment">
					<table class="table table-hover">
						<thead style="text-align: center;">
							<tr>
								<th scope="col" class="star text-start" style="width: 10%;"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">별점</font></font></th>
								<th scope="col" style="width: 60%;"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">후기내용</font></font></th>
								<th scope="col" class="reviewid " style="width: 12%;"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">닉네임</font></font></th>
								<th scope="col" class="reviewdt text-end" style="width: 12%;"><font
									style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">구매일</font></font></th>
							</tr>
						</thead>
						<tbody>
							<!-- foreach 사용 -->
							<c:forEach var="review" items="${reviewList }" begin="0" end="4">
								<tr>
									<th scope="row"
										class="grade star text-start ${review.REVIEW_GRADE }"></th>
									<td><font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;">${review.REVIEW_CONTENT }</font></font></td>
									<td class="reviewid text-end"><font
										style="vertical-align: inherit;"><font
											style="vertical-align: inherit;"><strong>${review.USER_NICKNAME }</strong></font></font></td>
									<td class="reviewdt text-end"><font
										style="vertical-align: inherit;"><font
											style="vertical-align: inherit;"><small
												class="text-muted"><fmt:formatDate
														pattern="yyyy-MM-dd" value="${review.ORDER_DATE}" /></small></font></font></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" class="btn btn-outline-primary"
						onclick="moreReview(${product.product_id })">더 보기</button>
				</div>
			</div>
			<br> <br> <br>
			<h4 id="scrollspyHedding4">
				<strong>상품 문의</strong>
			</h4>
			<hr>

			<div class="prdList">

				<script>
		replyList(nowPage, product_id);
		</script>

			</div>

			<c:choose>
				<c:when test="${empty user }">
					<br>
					<br>
					<p>상품문의는 로그인 후 가능합니다.</p>
					<a href="login.do">로그인</a>
				</c:when>
				<c:otherwise>
					<div id="prdQnaWrite">
						<br> <br>
						<form id="prdQnaForm" role="form" method="post">
							<textarea id="txtara" name="qna_content"></textarea>
						</form>
						<button type="button" class="btn btn-outline-primary" id="testBtn"
							onclick="writeQna()">등록</button>
					</div>
				</c:otherwise>
			</c:choose>




		</div>
	</div>

	<script>

function moreReview(product_id) {
	 window.open("moreReview.do?product_id="+product_id,"pop1",
     "width=500, height=700 top=100, left=250");
}

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
		
		/* alert("formObj,qna_content :" +formObj+","+ qna_content); */
		
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
				alert("formObj,qna_content :" +formObj+","+ qna_content);
				$("#txtara").val("");
				replyList(nowPage, product_id);
			},
			error : function(){
				alert("오류발생");
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