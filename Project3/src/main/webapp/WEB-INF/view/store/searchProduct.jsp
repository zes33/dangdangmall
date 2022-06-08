<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>searchProduct.jsp</h1>
<!-- 검색을 위한 폼 -->
	<form action="getProductList.do" method="get">
	<table class="border-none">
		<tr>
			<td>
				 
				<select name="searchCondition">
					<option value="TITLE">제목</option>
					<option value="CONTENT">내용</option>
				</select>
				
				<select name="searchCondition">
				 <%-- <c:forEach var="option" items="${ conditionMap }">
					<option value="${option.value }">${option.key}</option>
				</c:forEach>  --%>
				</select>
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
	

</body>
</html>