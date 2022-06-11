<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보</title>
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
.col-xs-12 {
	border-top: 4px solid #CACACA;
	border-bottom: 4px solid #CACACA;
	background-color: #E8E8E8;
}

table {
	text-align: center;
}

td {
	height: 40px;
	font-size: 20px;
}

.rowMan {
	height: 140px;
	padding: 5px 10px;
	display: flex;
}

.rowManBaby {
	display: inline-flex;
	align-items: center;
}

.myDang {
	font-size: 40px;
}

th {
	font-size: 36px;
	height: 70px;
	padding-bottom: 0px;
}

.colMan {
	padding: 0px;
	/* background-color: orange; */
}

.colMan>div {
	background-color: #E8E8E8;
	margin-top: 2px;
	margin-bottom: 5px;
	height: 60px;
	border-radius: 10px;
	position: relative;
}

p {
	display: table-cell;
	font-size: 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.padding {
	padding-top: 15px;
}

b>a {
	text-decoration: none;
	color: black;
}

html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}

#body-wrapper {
    min-height: 100%;
    position: relative;
}


.form-group{
   padding: 15px;
}

#updateFrm{
	background-color: #F3F3F3;
	padding: 20px;
	text-align: center;
}

.button{
	float: right;
}

.element{
	padding: 10px;
	padding-left: 100px;
}

.ajax{
	padding-top: 0px;
	padding-left: 80px;
}

.bottom{
	padding-left: 250px;
}

</style>
</head>
<body>
	<!-- header -->
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<div class="container">
		<div class="row rowMan">
			<div class="col-xs-12 rowManBaby">
					<table>
						<colgroup>
							<!--컬럼에 관한 속성-->
							<col width="300px">
							<!--1번째 컬럼 너비 조정-->
							<col width="330px">
							<col width="330px">
							<col width="330px">
						</colgroup>
						<tr>
							<th rowspan="2" class="myDang">My당당몰</th>
							<th>회원등급</th>
							<th>배송중</th>
							<th>포인트</th>
						</tr>
						<tr>
							<c:if test="${user.user_grade== 1 }">
								<td>일반회원</td>
							</c:if>
							<c:if test="${user.user_grade == 2 }">
								<td>vip회원</td>
							</c:if>
							<!-- ================================= -->
							<c:set var="sum" value="0" />
							<c:forEach var="list" items="${orderList }">
								<c:if test="${list.user_status == 2 }">
									<c:set var="sum" value="${sum+1}" />
								</c:if>
							</c:forEach>
							<c:if test="${sum ==0}">
								<td>0건</td>
							</c:if>
							<c:if test="${sum ne 0}">
								<td><c:out value="${sum }" />건</td>
							</c:if>
							<!-- ================================= -->
							<td>${user.user_point }p</td>
						</tr>
					</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2 colMan">
				<div>
					<p>
						<b><a href="${pageContext.request.contextPath }/myinfo.do">주문내역</a></b>
					</p>
				</div>
				<div>
					<p>
						<b><a
							href="${pageContext.request.contextPath }/myprivateinfo.do">나의 정보</a></b>
					</p>
				</div>
				<!-- <div>
					<p>
						<b><a href="cart/list.do">장바구니</a></b>
					</p>
				</div> -->
				<div>
					<p>
						<b><a href="${pageContext.request.contextPath }/goMyPrdQna.do">상품
								문의내역</a></b>
					</p>
				</div>
				<div>
					<p>
						<b><a href="#">기타 문의내역</a></b>
					</p>
				</div>
				<div>
					<p>
						<b><a href="${pageContext.request.contextPath }/goMyReview.do">후기내역</a></b>
					</p>
				</div>
			</div>
			<div class="col-md-10 wrapper">
				<h3 class="padding">회원 정보 수정</h3>
			<form id="updateFrm" name="updateFrm" action="updateAction.do" method="post">
					<table>
						<tbody>
							<tr>
								<td class="element">아이디</td>
								<td class="element"><input type="text" id="user_id"
									name="user_id" placeholder="아이디" value="${user.user_id}"
									class="form-control" readonly></td>
							</tr>
							<tr>
								<td class="element">비밀번호 변경</td>
								<td colspan="2" class="element"><input id="user_pw"
									name="user_pw" type="password" placeholder="비밀번호"
									maxlength="20" class="form-control"></td>
							</tr>
							<tr>
								<td class="element">비빌먼호 변경 확인</td>
								<td colspan="2" class="element"><input id="passwdCheck"
									name="passwdCheck" type="password" placeholder="비밀번호 확인"
									maxlength="20" class="form-control"></td>
							</tr>
							<tr>
								<td class="element">이름</td>
								<td colspan="2" class="element"><input id="user_name"
									name="user_name" type="text" placeholder="이름"
									value="${user.user_name }" readonly maxlength="20"
									class="form-control"></td>
							</tr>
							<tr>
								<td class="element">닉네임</td>
								<td colspan="2" class="element"><input id="user_nickname"
									name="user_nickname" type="text" placeholder="닉네임"
									value="${user.user_nickname }" maxlength="20"
									class="form-control"></td>
							</tr>
							<tr>
								<td class="element">e-mail</td>
								<td colspan="2" class="element"><input type="email"
									class="form-control" placeholder="e-mail" name="user_email"
									maxlength="20" value="${user.user_email }"></td>
							</tr>
							<tr>
								<td class="element">전화번호</td>
								<td colspan="2" class="element"><select name="user_phone1">
										<option>010</option>
										<option>02</option>
										<option>031</option>
										<option>070</option>
								</select> - <input type="text" name="user_phone2" size="5" value="${fn:substring(user.user_phone,3,7) }"> - <input
									type="text" name="user_phone3" size="5" value="${fn:substring(user.user_phone,7,11) }"></td>
							</tr>
							
							<tr>
								<td colspan="3"><input class="button" type="button"
									id="update" value="회원 정보 수정"></td>
							<td><a class="bottom"
								href="${pageContext.request.contextPath }/secession.do">회원탈퇴</a></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<table>
				<thead>
					<tr>
						<th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
	</div>
	<div class="row"></div>
	</div>
	<!-- footer -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
<script type="text/javascript">
   $(document).ready(function(e){
      $('#update').click(function(){
         if($.trim($('#user_pw').val()) == ''){
            alert("패스워드를 입력해 주세요.");
            $('#user_pw').focus();
            return;
         }
         //패스워드 확인
         if($('#user_pw').val() != $('#passwdCheck').val()){
            alert('패스워드가 다릅니다.');
            $('#user_pw').focus();
            return;
         }else{
            $('#updateFrm').submit();
         }
      });
   });
</script>
</html>