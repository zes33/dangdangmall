<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의 답변하기</title>
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
<body>
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>
	
	<div class="col-sm-9">
		<table class="col-sm-9">
			<tr>
				<th>작성자</th>
				<td>qq</td>
				<th>작성일</th>
				<td>2022-06-03</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>콩고기</td>
				<th>상품번호</th>
				<td>37</td>
			</tr>
			<tr>
				<td class="qnaCon" colspan="4">
					<div class="qnaConBaby">[상품문의]</div>
					<div class="qnaConBaby fat">언제나 맛있나요?</div>
				</td>
			</tr>
			
		</table>
	</div>

	<%-- <div>
	<form action="${pageContext.request.contextPath }/submitAdminProductQna.do" method="post">
		<table>
			<tr>
				<th>작성자</th>
				<td>${productQna.user_id }</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${productQna.product_qna_date }</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>${productQna.product_name }</td>
			</tr>
			<tr>
				<th>상품id</th>
				<td>${productQna.product_id }</td>
			</tr>
			<tr>
				<th>문의내용</th>
				<td>${productQna.qna_content }</td>
			</tr>
			<tr>
				<th>답변상태</th>
				<td>${productQna.product_qna_state}</td>
			</tr>
			<tr>
				<th>답변</th>
				<td>
					<textarea rows="7" cols="30" name="qna_content"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="등록" >
		<input type="hidden" name="qna_id" value="${productQna.qna_id  }">
		</form>
	</div>
 --%>



</body>
</html>