<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보 </title>
</head>
<body>
	<h1>shipping</h1>
	${map } ${user }

	<h1>결제정보 입력 </h1>
	
	
	<h3 style="font-weight: bold; font-size: 20px;">
	금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.allSum}" />원 <br> 
	배송비 <fmt:formatNumber value="${map.fee }" pattern="###,###,###" />원<br>
	</h3>
	<h5 style="font-weight: bold; font-size: 30px;">
		총금액
	<fmt:formatNumber value="${map.allSum }" pattern="###,###,###" />
		원
	</h5>
	
	

</body>
</html>