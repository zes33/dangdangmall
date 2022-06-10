<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 문의 하나 조회</title>
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
	height: 600px;
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
	//답변 등록
	function go_insertReply(QnaId, ReplyId) {
		location.href = "${pageContext.request.contextPath }/admin/adminReplyInsert.do?center_qna_id=" + QnaId;
	}
	
	//답변 수정
	function go_updateReply(QnaId, ReplyId) {
		location.href = "${pageContext.request.contextPath }/admin/adminReplyUpdate.do?center_qna_id=" + QnaId;
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
			<c:choose>
				<c:when test="${empty getCenter.REPLY_CONTENT }">
					<tr>
						<th colspan="2" style="text-align: center; vertical-align: middle;">등록된 답변이 없습니다.</th>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th style="text-align: center; vertical-align: middle;">답변내용</th>
						<td>
							<textarea name="content" rows="10" cols="40" disabled="disabled">${getCenter.REPLY_CONTENT }</textarea>
						</td>
					</tr>
					<tr>
						<th style="text-align: center; vertical-align: middle;">답변날짜</th>
						<td><fmt:formatDate value="${getCenter.CENTER_REPLY_DATE }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:otherwise>
			</c:choose>
			
		</table>
		
		<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='centerList.do'">목록으로</button>
		<div style="float:right;">
			<c:choose>
				<c:when test="${empty getCenter.REPLY_CONTENT }">
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_insertReply(${getCenter.CENTER_QNA_ID },${getCenter.CENTER_REPLY_ID });">답변 등록</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_deleteCenter(${getCenter.CENTER_QNA_ID },${getCenter.CENTER_REPLY_ID });">문의 삭제</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_updateReply(${getCenter.CENTER_QNA_ID },${getCenter.CENTER_REPLY_ID });">답변 수정</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_deleteReply(${getCenter.CENTER_QNA_ID },${getCenter.CENTER_REPLY_ID });">답변 삭제</button>
					<button type="button" class="btn btn-outline-secondary btn-sm" onclick="go_deleteCenter(${getCenter.CENTER_QNA_ID },${getCenter.CENTER_REPLY_ID });">문의 삭제</button>
				</c:otherwise>
			</c:choose>
			
		</div>
		<br>
   
   
   </div>
   </div>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>