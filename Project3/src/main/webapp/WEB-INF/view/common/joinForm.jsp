<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 헤더 관련 링크는 아래 4개 -->
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
<!-- 여기까지 헤더링크 -->
<style>

html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}

#body-wrapper {
    min-height: 100%;
    position: relative;
}

#body-content {
    margin-top: 100px;
    padding-bottom: 170px; /* footer의 높이 */
    padding-left: 200px;
    padding-right: 200px;
}

footer {
    width: 100%;
    height: 160px; /* footer의 높이 */
    position: absolute;  
    bottom: 0;
    left: 0;
}

.form-group{
	padding: 15px;
}
</style>
</head>
<body>
<!-- header -->
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>
<div id="body-wrapper">
	  <div id="body-content" class="container">
	  <br/></br/>
   <h2>회원가입</h2>
   <form action="joinAction.do" method="post">
      아이디 <input type="text" class="form-control" placeholder="영문 소문자/숫자 포함 4~16자"
                     name="user_id" maxlength="20"><br/>

      비밀번호 <input type="text" class="form-control" placeholder="비밀번호"
                     name="user_pw" maxlength="20"><br/>
   비밀번호 확인 <input type="text" class="form-control" placeholder="비밀번호 확인"
                      maxlength="20"><br/>
      이름 <input type="text" class="form-control" placeholder="이름"
                     name="user_name" maxlength="20"><br/>
    닉네임  <input type="text" class="form-control" placeholder="닉네임"
                     name="user_nickname" maxlength="20"><br/>
  e-mail <input type="text" class="form-control" placeholder="e-mail"
                     name="user_email" maxlength="20"><br/>
      전화번호
      <select name="user_phone1">
         <option>010</option>
         <option>02</option>
         <option>031</option>
         <option>051</option>
      </select>
      - <input type="text" name="user_phone2" size="5">
      - <input type="text" name="user_phone3" size="5">
      <br/><br/><br/>
      <input type="submit" class="btn btn-sm btn-outline-secondary"
                  value="회원가입">
	<br/><br/>
      
   </form>
   </div>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
	<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
 </div>
</body>
</html>