<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의</title>
<script>
	//로그인한 회원이 문의삭제 버튼을 누르면 활성화되는 함수
	function go_delete(centerQnaId, userId, centerUserId, centerUserPw) {
		alert("go_delete 버튼 작동");
		if(centerUserId != userId) {
			alert("작성자가 아니므로 삭제할 수 없습니다.");
		} else {
			var pwdCheck = prompt("비밀번호 확인이 필요합니다. 비밀번호를 입력해 주세요.");
			if (pwdCheck == centerUserPw) {
				var con = confirm("해당 문의에 대한 답글이 존재합니다. 문의글을 삭제하면 답글도 함께 삭제됩니다. 그래도 삭제하시겠습니까?");
				if (con) {
					location.href = "${pageContext.request.contextPath }/user/deleteCenterQna.do?center_qna_id=" + centerQnaId;
				}
				
			} else {
				alert("비밀번호가 틀렸습니다.");
			}
		}
	}
	
	//로그인한 회원이 문의수정 버튼을 누르면 활성화되는 함수
	function go_update(centerQnaId, userId, centerUserId, centerUserPw) {
		alert("go_update 버튼 작동");
		if(centerUserId != userId) {
			alert("작성자가 아니므로 수정할 수 없습니다.");
		} else {
			var pwdCheck = prompt("비밀번호 확인이 필요합니다. 비밀번호를 입력해 주세요.");
			if (pwdCheck == centerUserPw) {
					location.href = "${pageContext.request.contextPath }/user/updateCenterQna.do?center_qna_id=" + centerQnaId;
			} else {
				alert("비밀번호가 틀렸습니다.");
			}
		}
	}
	
	//비회원 유저가 문의수정/문의삭제 버튼을 누르면 활성화되는 go_login() 함수
	function go_login() {
		var con = confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?");
		if(con) {
			location.href = "${pageContext.request.contextPath }/login.do";
		}
	}	
	
	
	//문의글의 제목을 누르면 글의 내용과 답변이 한눈에 보이는 상세페이지로 이동하는 함수
	function go_getCenter(center_qna_id) {
		alert(center_qna_id);
		location.href = "getCenterQna.do?center_qna_id="+center_qna_id;
	}	
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
	#container { width: 700px; margin: auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	.center { text-align: center; }
	
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
<div id="container">
	<table class="table table-hover">
		<!-- 고객문의 상세페이지인뎅 정보가 많아서 예쁘게 정리하고싶은데 잘 안돼서ㅠㅠ 세트로 묶인것만 둘게요 -->
		<tr>
			<th class="center">NO.</th>
			<td>${getCenter.CENTER_QNA_ID }</td>
		</tr>
		<tr>
			<th class="center">문의제목</th>
			<td>${getCenter.CENTER_QNA_TITLE }</td>
		</tr>
		<tr>
			<th class="center">ID</th>
			<td>${getCenter.USER_ID }</td>
		</tr>
		<tr>
			<th class="center">닉네임</th>
			<td>${getCenter.USER_NICKNAME }</td>
		</tr>
		<tr>
			<th class="center">문의날짜</th>
			<td><fmt:formatDate value="${getCenter.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
			<th class="center">문의내용</th>
			<td>
				<textarea name="content" rows="10" cols="40" disabled="disabled">${getCenter.CENTER_QNA_CONTENT }</textarea>
			</td>
		</tr>
		<c:choose>
			<c:when test="${empty getCenter.REPLY_CONTENT }">
				<tr><td>등록된 답변이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th class="center">답변내용</th>
					<td>
						<textarea name="content" rows="10" cols="40" disabled="disabled">${getCenter.REPLY_CONTENT }</textarea>
					</td>
				</tr>
				<tr>
					<th class="center">답변날짜</th>
					<td><fmt:formatDate value="${getCenter.CENTER_REPLY_DATE }" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</table>
	
	<button type="button" class="btn btn-outline-secondary btn-sm" href="getCenterList.do">목록으로</button>
	\${centerUser } : ${centerUser }
	
	<!-- 답변이 달리면 수정 불가, 분기처리는 function에서 하겠음 -->
	<!-- 로그인세션에 있는 유저가 null이면 go_login()함수 버튼 활성화, 아니라면 go_delete()함수 버튼 활성화 -->
	<div style="float:right;">
	<c:choose>
	<c:when test="${centerUser.user_id eq null}">
		<!-- 
		<a class="btn btn-sm btn-outline-secondary" href="javascript:void(0);">a태그 문의수정</a>
		<a class="btn btn-sm btn-outline-secondary" href="javascript:void(0);" onclick="go_login();">a태그 문의 삭제</a>
		-->
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_login();">문의 수정</button>
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_login();">문의 삭제</button>
	</c:when>
	<c:otherwise>
		<button type="button" class="btn btn-outline-secondary btn-sm" href="#">문의 수정</button>
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_delete(${getCenter.CENTER_QNA_ID },${getCenter.USER_ID },${centerUser.user_id },${centerUser.user_pw });">문의 삭제</button>
	</c:otherwise>
	</c:choose>
	</div>
	
	<br>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</div>	
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>






