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
 /* 
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
    padding-bottom: 170px; /* footer의 높이 *
    padding-left: 200px;
    padding-right: 200px;
}

footer {
    width: 100%;
    height: 160px; /* footer의 높이 *
    position: absolute;  
    bottom: 0;
    left: 0;
}

.form-group{
   padding: 15px;
} */

/* 여기까지가 배낀거 */
.bg-light {
   height: 1053px;
   padding-top: 55px;
   padding-bottom: 75px;
}

.flex-fill.mx-xl-5.mb-2 {
   margin: 0 auto;
   width: 700px;
   padding-right: 7rem;
   padding-left: 7rem;
}

.container.py-4 {
   margin: 0 auto;
   width: 503px;
}

.d-grid.gap-2 {
   padding-top: 30px;
}
/* 여기까지 */
</style>
</head>
<body>
<!-- header -->
<header>
   <jsp:include page="../common/header.jsp"></jsp:include>
</header>
    <section class="bg-light">
       <div class="container py-4">
          <div class="row align-items-center justify-content-between">
                <span class="text-dark h4"><strong>회원가입</strong></span>
          </div>
          <form id="signFrm" name="signFrm" action="joinAction.do" method="post">
             <div class="form-group">
                   <label for="exampleInputEmail1" class="form-label mt-4">아이디</label>
               <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 입력해주세요." aria-describedby="emailHelp" aria-describedby="button-addon2">
                   </div>      
                         <div class="form-group has-success">
                            <label class="form-label mt-4" for="inputValid">비밀번호</label>
                            <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호를 입력해주세요.">
                            <div class="valid-feedback"></div>
                         </div>
                         
                         <div class="form-group has-danger">
                            <label class="form-label mt-4" for="inputInvalid">비밀번호 재확인</label>
                            <input type="password" class="form-control" id="passwdCheck" name="passwdCheck" placeholder="비밀번호 확인">
                         </div>
          <div class="form-group">
                <label for="exampleInputEmail1" class="form-label mt-4">이름</label>
             <input type="text" class="form-control" id="user_name" name="user_name"><!--  aria-describedby="emailHelp" -->
          </div>
          
          <div class="form-group">
                <label for="exampleInputEmail1" class="form-label mt-4">닉네임</label>
             <input type="text" class="form-control" id="user_nickname" name="user_nickname" placeholder="닉네임을 입력해주세요."><!--  aria-describedby="emailHelp" -->
          </div>
          
          <div class="form-group">
                <label for="exampleInputEmail1" class="form-label mt-4">이메일</label>
             <input type="email" class="form-control" name="user_email"> <!-- aria-describedby="emailHelp"  -->
          </div>
          
          <div class="form-group">
                <label for="exampleInputEmail1" class="form-label mt-4">전화번호</label>
             <table>
                <tr>
                   <td>
                   <select name="user_phone1" class="form-control text-center">
                      <option>010</option>
                      <option>02</option>
                      <option>031</option>
                      <option>051</option>
                   </select> -
                      <input type="text" class="form-control" name="user_phone2" size="5">
                      <input type="text" class="form-control" name="user_phone3" size="5"></td>
                <tr>
             </table>
          </div>
          
                <div class="d-grid gap-2">
                   <button class="btn btn-success btn-lg" type="button" id="signUp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가입하기</font></font></button>
                </div>
          </form>
       </div>
    </section>
    
    
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="js/bootstrap.js"></script>
   <footer>
   <jsp:include page="../common/footer.jsp"></jsp:include>
   </footer>
 <!-- </div>  -->
</body>
<script type="text/javascript">
   $(document).ready(function(e){
      
      var idx = false;
      
      $('#signUp').click(function(){
         if($.trim($('#user_id').val()) == ''){
            alert("아이디 입력.");
            $('#user_id').focus();
            return;
         }else if($.trim($('#user_pw').val()) == ''){
            alert("패스워드 입력.");
            $('#user_pw').focus();
            return;
         }
         //패스워드 확인
         else if($('#user_pw').val() != $('#passwdCheck').val()){
            alert('패스워드가 다릅니다.');
            $('#user_pw').focus();
            return;
         }
         
         if(idx==false){
            alert("아이디 중복체크를 해주세요.");
            return;
         }else{
            $('#signFrm').submit();
         }
      });
      
      $('#check').click(function(){
         $.ajax({
            url: "${pageContext.request.contextPath}/idCheck.do",
            type: "GET",
            data:{
               "user_id":$('#user_id').val()
            },
            success: function(data){
               if(data == 0 && $.trim($('#user_id').val()) != '' ){
                  idx=true;
                  $('#user_id').attr("readonly",true);
                  var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
                  $('#idCheck').empty();
                  $('#idCheck').append(html);
               }else{

                  var html="<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
                  $('#idCheck').empty();
                  $('#idCheck').append(html);
               }
            },
            error: function(){
               alert("서버에러");
            }
         });
      });
   });
</script>
</html>