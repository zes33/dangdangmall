<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 고객문의 1개조회</title>
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
	#container { width: 700px; margin: auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	.ct>th .ct td {
		border: 1px solid black;
		margin: 0 auto;
		height: 20px;
	}
	/* table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	} */
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>
<style>
	.col-xs-12 {
		border-top: 4px solid #CACACA;
		border-bottom: 4px solid #CACACA;
		background-color: #E8E8E8;
	}
	table {text-align: center;}
	td {
		height: 40px;
		font-size: 20px;
	}
	.rowMan{
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
	.colMan > div{
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
		text-align: center;
		
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		
		width: 200px;
	}
	
	b > a {
		text-decoration: none;
		color: black;
	}

	
</style>
<script>
	//문의삭제 버튼을 누르면 활성화되는 함수
	function go_delete(centerUserId,centerUserPw,getCenterUserId,getCenterQnaId,getCenterReplyId) {
		if(centerUserId == null) {
			var con = confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?");
			if(con) {
				location.href = "${pageContext.request.contextPath }/login.do";
			}
		} else {
			if(centerUserId != getCenterUserId) {
				alert("작성자가 아니므로 삭제할 수 없습니다.");
			} else {
				var pwdCheck = prompt("비밀번호 확인이 필요합니다. 비밀번호를 입력해 주세요.");
				if (pwdCheck != centerUserPw) {
					alert("비밀번호가 틀렸습니다.");
				} else {
					if (getCenterReplyId != undefined) {
						var con = confirm("해당 문의에 대한 답글이 존재합니다. 문의글을 삭제하면 답글도 함께 삭제됩니다. 그래도 삭제하시겠습니까?");
						if (con) {
							location.href = "${pageContext.request.contextPath }/user/deleteCenterQna.do?center_qna_id=" + getCenterQnaId;
						}
					} else {
						var real = confirm("정말로 삭제하시겠습니까?");
						if (real) {
							location.href = "${pageContext.request.contextPath }/user/deleteCenterQna.do?center_qna_id=" + getCenterQnaId;
						}
					}
				} 
			}
		}
	}
	
	//문의수정 버튼을 누르면 활성화되는 함
	function go_update(centerUserId,centerUserPw,getCenterUserId,getCenterQnaId,getCenterReplyId) {
		if(centerUserId == null) {
			var con = confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?");
			if(con) {
				location.href = "${pageContext.request.contextPath }/login.do";
			}
		} else {
			if(centerUserId != getCenterUserId) {
				alert("작성자가 아니므로 수정할 수 없습니다.");
			} else {
				if (getCenterReplyId != undefined) {
					alert("답변완료 상태인 문의글은 수정이 불가능합니다.");
				} else {
					var pwdCheck = prompt("비밀번호 확인이 필요합니다. 비밀번호를 입력해 주세요.");
					if (pwdCheck != centerUserPw) {
						alert("비밀번호가 틀렸습니다.");
					} else {
						location.href = "${pageContext.request.contextPath }/user/updateCenterQna.do?center_qna_id=" + getCenterQnaId;
					}
				}
			}
		}
	}
	
</script>
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
			<colgroup>  <!--컬럼에 관한 속성-->
	            <col width="300px">   <!--1번째 컬럼 너비 조정-->
	            <col width="330px" >
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
		        <div><p><b><a href="${pageContext.request.contextPath }/myinfo.do">주문내역</a></b></p></div>
		        <div><p><b><a href="${pageContext.request.contextPath }/myprivateinfo.do">나의 정보</a></b></p></div>
		        <div><p><b><a href="cart/list.do">장바구니</a></b></p></div>
		        <div><p><b><a href="${pageContext.request.contextPath }/goMyPrdQna.do">상품 문의내역</a></b></p></div>
		        <div><p><b><a href="${pageContext.request.contextPath }/user/myCenterQna.do">기타 문의내역</a></b></p></div>
		        <div><p><b><a href="${pageContext.request.contextPath }/goMyReview.do">후기내역</a></b></p></div>
	        </div>
	        <div class="col-md-10 whoru">
	        
				<h3>
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;[ 기타 문의내역]</h3>
				<!-- 데이터 표시 영역 -->		
				<div id="container">
					<table class="table table-hover ct">
						<!-- 고객문의 상세페이지인뎅 정보가 많아서 예쁘게 정리하고싶은데 잘 안돼서ㅠㅠ 세트로 묶인것만 둘게요 -->
						<tr>
							<th style="font-size: 20px;" class="center">NO.</th>
							<td>${myCenter.CENTER_QNA_ID }</td>
						</tr>
						<tr>
							<th style="font-size: 20px;" class="center">문의제목</th>
							<td>${myCenter.CENTER_QNA_TITLE }</td>
						</tr>
						<tr>
							<th style="font-size: 20px;" class="center">ID</th>
							<td>${myCenter.USER_ID }</td>
						</tr>
						<tr>
							<th style="font-size: 20px;" class="center">닉네임</th>
							<td>${myCenter.USER_NICKNAME }</td>
						</tr>
						<tr>
							<th style="font-size: 20px;" class="center">문의날짜</th>
							<td><fmt:formatDate value="${myCenter.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<th style="font-size: 20px;" class="center">문의내용</th>
							<td>
								<textarea name="content" rows="10" cols="40" disabled="disabled">${myCenter.CENTER_QNA_CONTENT }</textarea>
							</td>
						</tr>
						<c:choose>
							<c:when test="${empty myCenter.REPLY_CONTENT }">
								<tr>
									<th colspan="2" class="center">등록된 답변이 없습니다.</th>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th style="font-size: 20px;" class="center">답변내용</th>
									<td>
										<textarea name="content" rows="10" cols="40" disabled="disabled">${myCenter.REPLY_CONTENT }</textarea>
									</td>
								</tr>
								<tr>
									<th style="font-size: 20px;" class="center">답변날짜</th>
									<td><fmt:formatDate value="${myCenter.CENTER_REPLY_DATE }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:otherwise>
						</c:choose>
						
					</table>
					
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath }/user/myCenterQna.do'">목록으로</button>
					<div style="float:right;">
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_update('${centerUser.user_id}','${centerUser.user_pw}','${myCenter.USER_ID}',${myCenter.CENTER_QNA_ID },${myCenter.CENTER_REPLY_ID });">문의 수정</button>
						<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_delete('${centerUser.user_id}','${centerUser.user_pw}','${myCenter.USER_ID}',${myCenter.CENTER_QNA_ID },${myCenter.CENTER_REPLY_ID });">문의 삭제</button>
					</div>
					<br>
		
				
				</h3>
			</div>
	    </div>
	    <!-- <div class="row wru">
	    	<h3>넌 머야</h3>
	    </div> -->
	</div>

<!-- footer -->
	<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>