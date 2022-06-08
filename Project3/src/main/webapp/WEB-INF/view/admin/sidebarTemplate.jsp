<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록페이지(관리자)</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">  
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
#accordion {
	width: 180px;
	height: 50px;
}
#acd {
	position: absolute;
	top: 184px;
	left: -200px;
	padding: 10px;
	width: 190px;
	height: 300px;
}
</style>

<body>
<div id="acd" class="container-fluid">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		<div class="panel panel-default">
			<div class="panel-heading text-center" role="tab" ><a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false" class="text-center text-muted text-decoration-none lead"><strong>상품관리</strong></a></div>
			<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>상품 목록</strong></a></div>
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>상품 등록</strong></a></div>
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>상품 삭제</strong></a></div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading text-center" role="tab"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" class="text-center text-muted text-decoration-none lead"><strong>회원관리</strong></a></div>
			<div id="collapse2" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>회원정보 조회</strong></a></div>
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>회원 삭제</strong></a></div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading text-center" role="tab"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false" class="text-center text-muted text-decoration-none lead"><strong>고객센터</strong></a></div>
			<div id="collapse3" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>고객 문의 목록</strong></a></div>
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>고객 문의 삭제</strong></a></div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading text-center" role="tab"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="false" class="text-center text-muted text-decoration-none lead"><strong>상품 후기관리</strong></a></div>
			<div id="collapse4" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>후기 조회</strong></a></div>
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>후기 삭제</strong></a></div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading text-center" role="tab"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="false" class="text-center text-muted text-decoration-none lead"><strong>주문관리</strong></a></div>
			<div id="collapse5" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>판매내역 조회</strong></a></div>
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>배송상태 변경</strong></a></div>
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>환불 요청 목록</strong></a></div>
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>환불 승인</strong></a></div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading text-center" role="tab"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse6" aria-expanded="false" class="text-center text-muted text-decoration-none lead"><strong>매출관리</strong></a></div>
			<div id="collapse6" class="panel-collapse collapse" role="tabpanel">
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>월별 매출 조회</strong></a></div>
				<div class="panel-body text-center"><a class="text-muted text-decoration-none" href="#"><strong>일별 매출 조회</strong></a></div>
			</div>
		</div>
	</div>
</div>
</script>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>