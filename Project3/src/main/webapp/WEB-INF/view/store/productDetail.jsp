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
	margin-top: 30px;
	margin-bottom: 30px;
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
/* var qnaList = "<c:out value='${qnaList}'/>"; */	

function replyList(nowPage, product_id) {
	
	/* if(qnaList == null){
		nowPage = 1;
	}  */
	
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
		
			if(qnaList == ''){
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
	<script type="text/javascript">
	string = document.referrer;
	console.log(document.referrer);
	</script>
	<!-- -------------------------------- -->
	<div class="totPage">

		<nav id="navbar-example2"
			class="navbar navbar-light bg-white px-3 sticky-lg-top border-bottom border-top">
			<a class="navbar-brand" href="#"><img src="./img/위로.png"
				alt="상세페이지위로로고" width="35"></a>
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
				<li class="nav-item"><a class="nav-link text-dark" style="background-color: white;"
					href="#scrollspyHedding4"><strong>상품 문의</strong></a></li>
			</ul>
			<hr>
		</nav>
		<div class="goods">
			<img src="${pageContext.request.contextPath }/img/${product.product_pic}" alt="..." width="480px" height="448px">
			<div id="tit">
				<div class="h3">
					<strong>${product.product_name }</strong>
				</div>
				<!-- <div class="text-black-50 h5">
					<small>건강하게 먹는</small>
				</div> -->
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

							<!-- <form enctype="multipart/form-data"> -->

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
                     					/* alert(user_id + " : " +product_id + " : " + $("#cart_product_qty").val());
                     					 */alert("로그인 이후에 장바구니 담기가 가능합니다. \n로그인 페이지로 이동합니다. ");
                     					location.href="login.do";
                     				} else{
									/* alert(user_id + " : " +product_id + " : " + $("#cart_product_qty").val());
									 */location.href="cart/insert.do?product_id="+product_id+"&cart_product_qty="+$("#cart_product_qty").val();
                     				}
                     				}
                    			</script>
								<button type="button" class="btn btn-block btn-success"
									onclick="goBuy('${user_id}',${product.product_id})">바로
									구매하기</button>
								<script type="text/javascript">
										function goBuy(user_id, product_id) {
											if(!user_id){
												alert(user_id + " : " +product_id + " : " + $("#cart_product_qty").val());
		                     					alert("로그인 이후에 구매 가능합니다. \n로그인 페이지로 이동합니다. ");
		                     					location.href="login.do";
		                     				} else{
											//alert(user_id + " : " +product_id + " : " + $("#cart_product_qty").val());
											location.href="cart/orderDirect.do?product_id="+product_id+"&cart_product_qty="+$("#cart_product_qty").val();
		                     				}
		                     				}
									</script>
								<!-- </form> -->
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
			<br>
			<div class="productInfo">
				 <!-- <img src="${pageContext.request.contextPath }/img/${product.product_info}" alt="..." class="prdInfoPic">  -->
				<img src="./img/상품디테일1.png" alt="..." class="prdInfoPic">
				<img src="./img/포만감디테일.gif" alt="..." class="prdInfoPic">
				<img src="./img/구매평.png" alt="..." class="prdInfoPic">
				<img src="./img/point.gif" alt="..." class="prdInfoPic">
				<img src="./img/point2.gif" alt="..." class="prdInfoPic">
				<img src="./img/보관유통기한.png" alt="..." class="prdInfoPic">
			</div>
			<h4 id="scrollspyHeading2">
				<strong>상품 정보 고시</strong>
			</h4>
			<br>
			<table class="table">
				<tr>
					<th class="text-center table-active"><strong>용량, 수량</strong></th>
					<td class="text-center">80g / 개</td>
				</tr>
				<tr>
					<th class="text-center table-active"><strong>배송비 정책</strong></th>
					<td class="text-center">2,500원 (10만원 이상 구매 시 무료)</td>
				</tr>
				<tr>
					<th class="text-center table-active"><strong>보관방법</strong></th>
					<td class="text-center">냉장보관</td>
				</tr>
				<tr>
					<th class="text-center table-active"><strong>유통기한</strong></th>
					<td class="text-center">제조일로부터 6일</td>
				</tr>
				<tr>
					<th class="text-center table-active"><strong>식품유형</strong></th>
					<td class="text-center">신선편의식품</td>
				</tr>
				<tr>
					<th class="text-center table-active"><strong>생산지</strong></th>
					<td class="text-center">아이티윌법인 주식회사/강남 서초구 테헤란로 5555</td>
				</tr>
				<tr>
					<th class="text-center table-active"><strong>제품원재료명</strong></th>
					<td class="text-center">그린믹스샐러드:양상추(국내산),적채(국내산, 치커리(국내산)<br>
									파프리카믹스샐러드:양상추(국내산),파프리카(국내산),치커리(국내산),라디치오</td>
				</tr>
			</table>
			<hr>
			<h4><strong>배송 안내</strong></h4>
			<br>
			<table class="table">
				<tr>
					<th class="text-center table-active"><strong>지역</strong></th>
					<th class="text-center table-active"><strong>배송여부</strong></th>
					<th class="text-center table-active"><strong>배송비</strong></th>
				</tr>
				<tr>
					<td class="text-center">일반</td>
					<td class="text-center">가능</td>
					<td class="text-center">2,500</td>
				</tr>
				<tr>
					<td class="text-center">도서/산간</td>
					<td class="text-center">가능</td>
					<td class="text-center">2,500</td>
				</tr>
				<tr>
					<td class="text-center">제주</td>
					<td class="text-center">가능</td>
					<td class="text-center">2,500</td>
				</tr>
			</table>
			<ul style="list-style-type:square;">
				<li>새벽배송/택배배송 구분 없이 당당배송 상품으로 10만원 이상 구매 시 무료배송입니다.</li>
				<li>'배송 준비 중'상태인 경우 주문을 취소할 수 없습니다</li>
				<li>배송 현황은 [마이페이지]>[주문내역]에서 조회하실 수 있습니다</li>
				<li>일부 추가 구성 상품의 경우 본 상품과 별도 배송되어 수령일이 다를 수 있습니다.</li>
				<li>택배 및 개별배송의 경우 출고 후 배송까지는 약 1~3일 소요됩니다.(공휴일 제외 / 제주 및 도서산간 지역은 1~2일 추가소요)</li>
			</ul>
			<br>
			<hr>
			<h4><strong>교환 및 반품 안내</strong></h4>
			<br>
			<ul style="list-style-type:square;">
				<li>교환 및 반품을 원하시면 수령 후 7일 이내 게시판, 전화로 연락바랍니다.</li>
				<li>상품 불량의 경우 사진을 촬영하여 당당몰 고객센터로 연락 주시면 신속히 처리해 드립니다.<p class="text-danger">(단, 신선식품의 경우 수령일을 포함하여 3일 이내 연락 주셔야 처리가 가능합니다.)</p></li>
				<li>단순 변심으로 인한 교환 및 반품은 왕복 배송비 5,000원이 발생됩니다.</li>
				<li>환불의 경우 2~3일 소요될 수 있습니다.</li>
			</ul>
			<br>
			<hr>
			<h4><strong>단순 교환 및 반품이 불가능한 경우</strong></h4>
			<br>
			<ul style="list-style-type:square;">
				<li>배송을 받으신 날로부터 7일이 경과한 경우<p class="text-danger">(단, 신선(냉동)식품은 단순 변심으로 인한 교환 및 반품이 불가능합니다.)</p></li>
				<li>상품 포장을 개봉하였거나 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
				<li>전자기기의 경우 개봉 후 사용시 변심 교환/환불이 불가합니다.</li>
				<li>단독 패키지 상품의 외포장을 개봉한 경우 (ex. 브라운라이스소울스 빅사이즈 / 당당바 선물세트 / 당당 꺼내땅콩 박스 등)</li>
				<li>고객님의 책임이 있는 사유로 상품의 멸실 또는 훼손으로 인해 제품 확인이 어려운 경우 <p>(재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</p></li>
				<li>고객의 주문에 따라 개별적으로 생산되는 상품일 경우</li>
				<li>주소, 연락처 오기입, 택배기사와의 연락 불가 등 고객 과실로 인해 반송되었거나 그 과정에서 제품 손상이 발생한 경우</li>
				<li>PC 및 휴대폰 화면과 실제 상품의 색상/이미지 차이 또는 개인적 취향/기호에 따른 단순 변심의 경우
				<li>불량 상품 수령 후 사진 촬영 없이 임의 폐기한 경우</li>
				<li>판매자와 교환/반품에 대한 협의 없이 임의로 폐기처분 또는 반송한 경우
			</ul>
			<br>
			<hr>
			<br>
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
						<tbody >
							<!-- foreach 사용 -->
							<c:if test="${empty reviewList }">
								<tr>
									<td style="text-align: center;" colspan="4">등록된 리뷰가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="review" items="${reviewList }" begin="0" end="4">
								<tr >
									<th scope="row"
										class="grade star text-start ${review.REVIEW_GRADE }"></th>
									<td><font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;">${review.REVIEW_CONTENT }</font></font></td>
									<td class="reviewid text-end"><font
										style="vertical-align: inherit;"><font
											style="text-align:ca vertical-align: inherit;"><strong>${review.USER_NICKNAME }</strong></font></font></td>
									<td class="reviewdt text-end"><font
										style="vertical-align: inherit;"><font
											style="vertical-align: inherit;"><small
												class="text-muted"><fmt:formatDate
														pattern="yyyy-MM-dd" value="${review.ORDER_DATE}" /></small></font></font></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${!empty reviewList }">
						<button type="button" class="btn btn-outline-primary"
							onclick="moreReview(${product.product_id })">더 보기</button>
					</c:if>
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
		
		var formObj = $("#prdQnaWrite form[role='form']");
		var qna_content = $("#txtara").val();
		
		var data = {
			'qna_content' : qna_content,
			'product_id' : product_id
					};
		$.ajax({
			url : 'writePrdQna.do',
			type : 'post',
			data : data,
			success : function(){
				$("#txtara").val("");
				replyList(undefined, product_id);
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