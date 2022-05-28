<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<title>장바구니 목록</title>
<!-- css 스크립트 삽입 -->
<link href="common/styles.css" rel="stylesheet">
<style type="text/css">
#container {
	width: 700px;
	margin: auto;
}

h1, h3, p {
	text-align: center;
}

table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
	margin: 0 auto;
	border-bottom: 1px solid #444444;
}

th {
	background-color: lightgray;
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

.outer {
	display: flex;
	justify-content: center;
}

div.contents {
	position: absolute;
	left: 0;
	top: 0;
	width: 800px;
	height: 1280px;
}
/*img:hover{*/
/*    cursor: pointer;*/
/*}*/
div.contents {
	position: absolute;
	left: 0;
	top: 0;
	width: 800px;
	height: 1280px;
}

.pos:hover {
	cursor: pointer;
}

.btn_light_green:hover, .btn_light_green:active, .btn_light_green:visited
	{
	background-color: #CFE3A1 !important;
	color: #6F923E !important;
	border-color: #CFE3A1 !important;
}

.btn-outline-success {
	background-color: white !important;
	color: #6F923E !important;
	border-color: #6F923E !important;
}

.btn-outline-success:hover, .btn-outline-success:active,
	.btn-outline-success:visited {
	background-color: #CFE3A1 !important;
	color: #6F923E !important;
	border-color: #CFE3A1 !important;
}

.btn_disabled {
	background-color: white !important;
	color: #CFE3A1 !important;
	border-color: #CFE3A1 !important;
}

.btn-success {
	background-color: #CFE3A1 !important;
	color: black !important;
	border-color: #CFE3A1 !important;
}

.btn-success:hover, .btn-success:active, .btn-success:visited {
	background-color: #6F923E !important;
	color: white !important;
	border-color: #6F923E !important;
}

.light_green {
	background-color: #CFE3A1 !important;
}

.trim {
	padding: 0;
}

.last_block {
	height: 50pt;
}

.two_button {
	width: 49%;
}

.three_button {
	margin: 0 !important;
	width: 33%;
}

.three_button_center {
	width: 33%;
	margin-left: 0.5%;
	margin-right: 0.5%;
}

.up_down_center {
	margin: auto;
}

.left_input {
	width: 70%;
	float: left;
}

.right_input {
	margin-left: 1%;
	width: 29%;
}

.margin_up {
	margin-top: 3pt;
}

.phone_one_two {
	width: 30%;
	float: left;
}

.phone_three {
	width: 30%;
}

.margin_first {
	margin-top: 30pt;
}

.category {
	margin: 10%;
	width: 80%;
}

.category_label:hover {
	cursor: pointer;
}

.map_button {
	width: inherit;
	padding: 5pt;
}

.map_button:hover {
	cursor: pointer;
}

.nav_five {
	width: 20%;
}

.nav_two {
	width: 50%;
}

.nav_three {
	width: 33%;
}

.cart {
	width: 20pt;
}

.cart:hover {
	cursor: pointer;
}

.home {
	width: 25pt;
}

.home:hover {
	cursor: pointer;
}

.img-title {
	width: 18%;
	margin-bottom: 3pt;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}
.basketdiv {
    width: 100%;
    border-top: 1px solid #e0e0e0;
    float: left;
    font-size: 0.9375em;
    margin-bottom: 20px;
}
    .basketdiv .row.head {
        border-bottom: 2px solid #888;
        box-sizing: border-box;
        background-color: #f4f4f4;
        font-weight: 500;
    }
    .basketdiv .data {
        border-bottom: 1px dashed #888;
        box-sizing: border-box;
        cursor: pointer;
        float: left;
        width: 100%;
    }
    .basketdiv .data .empty{
        text-align: center;
        padding: 12px 0;
    }
    .basketdiv .row.head .subdiv {
        background-color: #f4f4f4;
    }
    .basketdiv .row > .subdiv {
        display: block;
        float: left;
    }
    .basketdiv .row > .subdiv:nth-child(1) {
        width: 50%;
    }
    .basketdiv .row > .subdiv:nth-child(2) {
        width: 40%;
    }
    .basketdiv .row > .subdiv:nth-child(3) {
        width: 10%;
    }
    .basketdiv2 .row > .subdiv:nth-child(1) {
        width: 60%;
    }
    .basketdiv2 .row > .subdiv:nth-child(2) {
        width: 40%;
    }
    .basketdiv .row > div > div {
        display: block;
        float: left;
        text-align: center;
        margin: 0;
        padding: 12px 0;
    }
    .basketdiv .row.data > div > div {
        height: 60px;
        line-height: 60px;
    }
        .basketdiv .data .num .updown {
            color: #0075ff;
            font-size: 2em;
            letter-spacing: -5px;
        }
        .basketdiv .check {
            width: 10%;
        }
    .basketdiv .check input[type=checkbox] {
        transform: scale(1.5);
    }
    .basketdiv .img{
        width: 20%;
    }
    .basketdiv .pname{
        width: 70%;
    }
    .basketdiv2 .pname {
        width: 80%;
    }
    .basketdiv .basketprice {
        width: 33%;
    }
    .basketdiv .num {
        width: 33%;
      min-width: 105px;
    }
    .basketdiv .sum {
        width: 34%;
      max-width: 80px;
        color: #0000aa;
    }
    .basketdiv .point {
        width: 50%;
    }
    .basketdiv2 .basketprice {
        width: 25%;
    }

    .basketdiv2 .num {
        width: 25%;
    }

    .basketdiv2 .sum {
        width: 25%;
        color: #0000aa;
    }

    .basketdiv2 .point {
        width: 25%;
    }
    .basketdiv .basketcmd{
        width: 100%;
    }
    .basketdiv .data .pname {
        text-align: left !important;
      line-height: 1.2 !important;
    }
    .basketdiv .data .price, .basketdiv .data .sum, .basketdiv .data .point {
        text-align: right;
    }
    .baseform > tbody > tr > td:first-child {
        width: 100px;
    }

.buttongroup {
    padding: 11px 0;
    margin: 50px 0;
}
.narrowbuttongroup{
    margin: 15px 0;
}
    .buttongroup.center {
        text-align: center;
    }
    .buttongroup input[type=text], .buttongroup input[type=password] {
        height: 30px;
    }
    .buttongroup button, .buttongroup a {
        margin-right: 5px;
    }
        .buttongroup button:last-child, .buttongroup a:last-child {
            margin-right: 0;
        }

    .abutton, .abutton:link, .abutton:visited, .abutton:active, input[type=button] {
        background-color: #383838;
        border: 1px solid #888888;
        color: #ffffff;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 3px 5px;
        margin: 2px 3px;
        width: auto;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
    }

.abutton-alt {
    background-color: #d3e2c6;
}

.red {
    color:#b00;
}
.blue {
  color: #0075ff;
}
.basketrowcmd, .sumcount, .summoney{
  text-align: right;
  margin-bottom: 10px;
}
.sumcount, .summoney{
  font-size: 1.25em;
    font-weight: bold;
}
.buttongroup{
  text-align: center;
}
.buttongroup a{
  text-decoration: none;
}
.cmd a, .cmd span {
    padding: 12px 30px;
    box-sizing: border-box;
    margin-top: 10px;
    font-size: 1.2em;
    color: #000;
    background-color: #f4f4f4;
    border: 1px solid #e0e0e0;
    text-align: center;
}
.cmd.small a, .cmd.small span {
    padding: 6px 20px;
    font-size: 0.8125em;
}

.orderform .p_num {
    text-align: right;
    width: 40px;
    font-size: 1em;
}


</style>
</head>

<body>
	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>


	<!--Content-->
	<div class="container-fluid text-center" style="margin-top: 25pt; margin-bottom: 25px;">
			<img src="../img/shopbag.svg" class="img-title" alt="no title" width="200"/>
		</div>
	<div>
		<h1>장바구니 목록</h1>
		<br>
	</div>
	<%-- ${getCartList } --%>
	<div class="text-center">
		<c:if test="${empty getCartList}">
		<br/>
		장바구니가 비어있습니다.
		<br/><br/>
		</c:if>
		</div>

		<c:if test="${not empty getCartList}">
	<!--장바구니 목록-->
	<div style="font-weight: bold; font-size: 20px;">
		<form action="updateCart.do" method="post">
			<table style="width: 90%; padding-top: 3pt;">
				<tr>
					<th>상품 이름</th>
					<th>수량</th>
					<th>할인율</th>
					<th>금액</th>
					<th>총 금액</th>
					<th>선택</th>
				</tr>

				<c:forEach items="${getCartList }" var="list" varStatus="i">
				<div class="menuClass" data-menuId=<c:out value="${list.cart_detail_id}"/>>
					<tr>
						<td><span id="amount"> <c:out
									value="${list.product_name }" />
						</span></td>
						<td><span id="num">${list.cart_detail_cnt } </span> &nbsp; <i
							id="minusButton" class="fas fa-minus-square pos"></i> <i
							id="plusButton" class="fas fa-plus-square pos"></i></td>
						<td><span id="discount" style="color:red;"
							data-amount=<c:out value="${list.product_discount}"/>> <c:out
									value="${list.product_discount }" /> %
						</span></td>
						<td><span id="price"
							data-amount=<c:out value="${list.product_price}"/>><c:out
									value="${list.product_price}"/>원</span>
									</td>
						<td><span id="total"
							data-amount=<c:out value="${list.product_price * list.cart_detail_cnt}"/>>
								<c:out
									value="${(list.product_price * list.cart_detail_cnt) - ( list.product_price / list.product_discount)}" />원
						</span></td>
						<td>
							<div style="width: 7%">
								<input type="checkbox">
							</div>
						</td>
					</tr>
					</div>
				</c:forEach>

			</table>
		</form>
	</div>
	<div class="text-right" style="margin: 10pt">
	<br>
		<h5 style="font-weight: bold; font-size: 20px;">
			총 금액 : <span id="totalPrice">0원</span>
		</h5>
	</div>
	<div class="container-fluid margin_first">
		<button style="font-size: 20px; font-weight: bold;" type="button"
			id="delete" class="btn btn-success two_button float-right">선택
			메뉴 삭제</button>
		<button style="font-size: 20px; font-weight: bold;" type="button"
			id="order" class="btn btn-success two_button">선택 메뉴 주문</button>
	</div>
</c:if>

	<div class="last_block"></div>
	
	<div>
	<form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
    
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
    
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
        
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="260" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><img src="./img/basket1.jpg" width="60"></div>
                        <div class="pname">
                            <span>찜마마(XJ-92214/3)</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="20000">20,000원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="2" onkeyup="javascript:basket.changePNum(1);">
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">40,000원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="261" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><img src="./img/basket2.jpg" width="60"></div>
                        <div class="pname">
                            <span>노바 요거팜(JP-268T)</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" value="19000">19,000원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num2" id="p_num2" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(2);">
                                <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">19,000원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
                <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="262" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><img src="./img/basket3.jpg" width="60"></div>
                        <div class="pname">
                            <span>아날도 바시니 보스톤 가방 20인치 (ab-380)</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price3" class="p_price" value="15200">15,200원</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num3" id="p_num3" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(3);">
                                <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(3);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">15,200원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
        
            </div>
    
            <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 4개</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: 74,200원</div>
    
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="javascript:void(0);">선택한 상품 주문</a>
                </div>
            </div>
        </form>
        </div>
        
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script>
	let basket = {
		    totalCount: 0, 
		    totalPrice: 0,
		    //체크한 장바구니 상품 비우기
		    delCheckedItem: function(){
		        document.querySelectorAll("input[name=buy]:checked").forEach(function (item) {
		            item.parentElement.parentElement.parentElement.remove();
		        });
		        //AJAX 서버 업데이트 전송
		    
		        //전송 처리 결과가 성공이면
		        this.reCalc();
		        this.updateUI();
		    },
		    //장바구니 전체 비우기
		    delAllItem: function(){
		        document.querySelectorAll('.row.data').forEach(function (item) {
		            item.remove();
		          });
		          //AJAX 서버 업데이트 전송
		        
		          //전송 처리 결과가 성공이면
		          this.totalCount = 0;
		          this.totalPrice = 0;
		          this.reCalc();
		          this.updateUI();
		    },
		    //재계산
		    reCalc: function(){
		        this.totalCount = 0;
		        this.totalPrice = 0;
		        document.querySelectorAll(".p_num").forEach(function (item) {
		            if(item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true){
		                var count = parseInt(item.getAttribute('value'));
		                this.totalCount += count;
		                var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
		                this.totalPrice += count * price;
		            }
		        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
		    },
		    //화면 업데이트
		    updateUI: function () {
		        document.querySelector('#sum_p_num').textContent = '상품갯수: ' + this.totalCount.formatNumber() + '개';
		        document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';
		    },
		    //개별 수량 변경
		    changePNum: function (pos) {
		        var item = document.querySelector('input[name=p_num'+pos+']');
		        var p_num = parseInt(item.getAttribute('value'));
		        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
		        
		        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

		        item.setAttribute('value', newval);
		        item.value = newval;

		        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
		        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
		        //AJAX 업데이트 전송

		        //전송 처리 결과가 성공이면    
		        this.reCalc();
		        this.updateUI();
		    },
		    checkItem: function () {
		        this.reCalc();
		        this.updateUI();
		    },
		    delItem: function () {
		        event.target.parentElement.parentElement.parentElement.remove();
		        this.reCalc();
		        this.updateUI();
		    }
		}

		// 숫자 3자리 콤마찍기
		Number.prototype.formatNumber = function(){
		    if(this==0) return 0;
		    let regex = /(^[+-]?\d+)(\d{3})/;
		    let nstr = (this + '');
		    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
		    return nstr;
		};
		
	</script>  
	<script type="text/javascript">
	$(document).ready(function() {
		releaseCheck();
		clickDeleteMenus();
		clickOrderMenus();
		allCheck();
		clickCountButton();
		checkForCalc();
	});

	// 화면이 업데이트 될 때마다 체크된 것들이 해제됨
	function releaseCheck() {
		if ($("#totalToggle").is(":checked")) {
			$("#totalToggle").prop("checked", false);
		}
		var menus = $(".menuClass").get();
		for (let i = 0; i < menus.length; i++) {
			var jMenus = $(menus[i]);
			var checkBox = jMenus.find(".form-control");
			if (checkBox.is(":checked")) {
				checkBox.prop("checked", false);
			}
		}
	}

	// 체크박스가 체크될 때마다 총금액이 변하도록 하는 함수
	function checkForCalc() {
		var menus = $(".menuClass").get();
		for (let i = 0; i < menus.length; i++) {
			var jMenus = $(menus[i]);
			var checkBox = jMenus.find(".form-control");
			checkBox.change(function() {
				calcAllPrice();
			});
		}
	}

	// 체크되어있는 메뉴들의 가격을 더해서 총 금액에 출력해주는 함수
	function calcAllPrice() {
		var allPrice = 0;
		var menus = $(".menuClass").get();
		for (let i = 0; i < menus.length; i++) {
			var jMenus = $(menus[i]);
			var checkBox = jMenus.find(".form-control");

			// 하나의 메뉴의 총 가격
			// "5000원"이렇게 넘어옴
			var amount = jMenus.find("#amount").text();
			amount = Number(amount.replace(/[^0-9]/g, ""));

			if (checkBox.is(":checked")) {
				allPrice += amount;
			}
		}
		$("#totalPrice").text(String(allPrice) + "원");
	}

	// -,+ 버튼을 클릭할 때마다 메뉴의 수량과 가격이 변하도록 하는 함수
	function clickCountButton() {
		var menus = $(".menuClass").get();
		for (let i = 0; i < menus.length; i++) {
			var jMenus = $(menus[i]);
			var minusButton = jMenus.find("#minusButton");
			var plusButton = jMenus.find("#plusButton");

			minusButton.click(function() {
				var num = Number(($(this).siblings('#num')).text());
				--num;
				if (num <= 0) {
					num = 1;
				}
				// 버튼을 통해 메뉴의 수량을 바꿈
				($(this).siblings("#num")).text(num);
				// 메뉴 하나의 가격
				var price = Number(($(this).siblings("#amount")).data("amount"));
				// 메뉴의 개수만큼의 가격
				var priceMultNum = String(price * num) + "원";
				($(this).siblings("#amount")).text(priceMultNum);
				calcAllPrice();
			});
			plusButton.click(function() {
				var num = Number(($(this).siblings('#num')).text());
				++num;
				if (num > 5) {
					num = 5;
				}// 버튼을 통해 메뉴의 수량을 바꿈
				($(this).siblings("#num")).text(num);
				// 메뉴 하나의 가격
				var price = Number(($(this).siblings("#amount")).data("amount"));
				// 메뉴의 개수만큼의 가격
				var priceMultNum = String(price * num) + "원";
				($(this).siblings("#amount")).text(priceMultNum);
				calcAllPrice();
			});
		}
	}

	// 전체선택 박스를 클릭할 때를 처리하는 함수
	function allCheck() {
		$("#totalToggle").click(function() {
			var menus = $(".menuClass").get();
			for (let i = 0; i < menus.length; i++) {
				var jMenus = $(menus[i]);
				var checkBox = jMenus.find(".form-control");

				// 전체선택 박스를 체크하면
				if ($(this).is(":checked")) {
					checkBox.prop("checked", true);
					calcAllPrice();
				}
				// 전체선택 박스 체크를 해제하면
				else {
					checkBox.prop("checked", false);
					calcAllPrice();
				}
			}
		});
	}

	// 선택메뉴삭제버튼을 클릭할 때를 처리하는 함수
	function clickDeleteMenus() {
		$("#delete").click(function() {
			// 삭제할 메뉴아이디가 담길 배열
			var arr = [];
			var menus = $(".menuClass").get();
			for (let i = 0; i < menus.length; i++) {
				var jMenus = $(menus[i]);
				var checkBox = jMenus.find(".form-control");

				if (checkBox.is(":checked")) {
					arr.push(jMenus.data("menuid"));
				}
			}

			if (arr.length == 0) {
				swal.fire({
					title : "삭제할 메뉴를 선택해주세요"
				}).then((result) => {
					if (result.value) {
						return;
					}
				});
			}

			$.ajax({
				type : "DELETE",
				url : "cart",
				data : {
					"arr" : arr
				},
				success : function(data) {
					swal.fire({
						title : data.msg
					}).then((result) => {
						if (result.value) {
							window.location.href = "cart";
						}
					});
				}
			});
		});
	}

	function clickOrderMenus() {
		$("#order").click(function() {
			// 주문할 하나의 매장아이디 + 메뉴개수 + 여러 메뉴아이디 + 총 가격을 저장할 배열
			var arr = [];
			var arr2 = [];
			var checkedMenus = 0;
			var storeId = $("#storeId").data("storeid");
			var totalPrice = $("#totalPrice").text();

			// 배열의 맨 앞에는 매장아이디를 넣음
			arr.push(storeId);

			var menus = $(".menuClass").get();
			for (let i = 0; i < menus.length; i++) {
				var jMenus = $(menus[i]);
				var checkBox = jMenus.find(".form-control");
				if (checkBox.is(":checked")) {
					++checkedMenus;
				}
			}

			// 체크되어있는 메뉴의 개수를 넣음
			arr.push(checkedMenus);

			// 그 다음에는 체크되어있는 메뉴아이디를 순서대로 넣음
			for (let i = 0; i < menus.length; i++) {
				var jMenus = $(menus[i]);
				var checkBox = jMenus.find(".form-control");
				if (checkBox.is(":checked")) {
					arr.push(jMenus.data("menuid"));
					arr2.push(jMenus.find("#num").text());
				}
			}

			// 그리고 마지막에는 총 가격을 넣음
			arr.push(totalPrice);

			if (arr.length == 3) {
				swal.fire("주문할 메뉴를 선택해주세요.");
				return;
			}

			$.ajax({
				type : "POST",
				url : "cart/order",
				data : {
					"arr" : arr,
					"arr2" : arr2
				},
				success : function(data) {
					swal.fire({
						title : data.msg
					}).then((result) => { 
						if (result.value) {
							window.location.href = "order";
						}
					});
				}
			});
		});
	}

	</script>
</body>
</html>
