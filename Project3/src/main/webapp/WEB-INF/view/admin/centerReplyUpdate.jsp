<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 문의 답글 수정 페이지</title>
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
	border: 1px solid black;
	position:relative;
	left: 0px;
	top: 48px;
	width: 1145px;
	height: 800px;
}
</style>
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

<script>
	//답변 수정
	function go_updateReply(QnaId) {
		var reply = $("#reply_content").val().trim();
		if (reply == "") {
			alert("답글내용을 입력하세요.");
			document.updateCenterReply.reply_content.focus();
		} else {
			$("#updateCenterReply").submit();
		}
	}
	
	//답변 삭제
	function go_deleteReply(QnaId, ReplyId) {
		var real = confirm("답글을 정말로 삭제하시겠습니까?");
		if (real) {
			location.href = "${pageContext.request.contextPath }/admin/adminReplyDelete.do?center_qna_id=" + QnaId;
		}
	}
	
	//문의 삭제
	function go_deleteCenter(QnaId, ReplyId) {
		if (ReplyId != undefined) {
			var con = confirm("해당 문의에 대한 답글이 존재합니다. 문의글을 삭제하면 답글도 함께 삭제됩니다. 그래도 삭제하시겠습니까?");
			if (con) {
				location.href = "${pageContext.request.contextPath }/admin/adminCenterdelete.do?center_qna_id=" + QnaId;
			}
		} else {
			var real = confirm("문의글을 정말로 삭제하시겠습니까?");
			if (real) {
				location.href = "${pageContext.request.contextPath }/admin/adminCenterdelete.do?center_qna_id=" + QnaId;
			}
		}
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
   		<strong style="font-size:3vw">&lt; 고객 문의 조회 &gt;</strong>
   	</div>
   
   <div class="contents">
   
	<div id="container">
		<br><br>
		<form id="updateCenterReply" action="adminReplyUpdate.do" method="post">
   		<input type="hidden" id="center_qna_id" name="center_qna_id" value="${getCenter.CENTER_QNA_ID }">
		<table class="table table-hover">
			<tr>
				<th style="text-align: center; vertical-align: middle;">NO.</th>
				<td>${getCenter.CENTER_QNA_ID }</td>
			</tr>
			<tr>
				<th style="text-align: center; vertical-align: middle;">문의제목</th>
				<td>${getCenter.CENTER_QNA_TITLE }</td>
			</tr>
			<tr>
				<th style="text-align: center; vertical-align: middle;">ID</th>
				<td>${getCenter.USER_ID }</td>
			</tr>
			<tr>
				<th style="text-align: center; vertical-align: middle;">닉네임</th>
				<td>${getCenter.USER_NICKNAME }</td>
			</tr>
			<tr>
				<th style="text-align: center; vertical-align: middle;">문의날짜</th>
				<td><fmt:formatDate value="${getCenter.CENTER_QNA_DATE}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th style="text-align: center; vertical-align: middle;">문의내용</th>
				<td>
					<textarea name="content" rows="10" cols="40" disabled="disabled">${getCenter.CENTER_QNA_CONTENT }</textarea>
				</td>
			</tr>
				<tr>
					<th style="text-align: center; vertical-align: middle;">답변내용</th>
					<td>
						<textarea name="reply_content" rows="10" cols="40" id="reply_content">${getCenter.REPLY_CONTENT }</textarea>
					</td>
				</tr>
				<tr>
					<th style="text-align: center; vertical-align: middle;">답변날짜</th>
					<td><fmt:formatDate value="${getCenter.CENTER_REPLY_DATE }" pattern="yyyy-MM-dd"/></td>
				</tr>
		</table>
		
		<div style="float:right;">
			<button type="button" class="btn btn-outline-primary" style="border: 1px solid #0D5EFD;" onclick="go_updateReply(${getCenter.CENTER_QNA_ID });">답변 수정</button>
			</div>
		</form>	
		
		<div style="float:left;">
			<button type="button" class="btn btn-outline-primary" style="border: 1px solid #0D5EFD;" onclick="location.href='centerList.do'">목록으로</button>
			<button type="reset" class="btn btn-outline-primary" style="border: 1px solid #0D5EFD;">초기화</button>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br>
   
   
   </div>
   </div>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>