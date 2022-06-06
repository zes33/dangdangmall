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

#signFrm{
	background-color: #F3F3F3;
	padding: 20px;
	text-align: center;
}

.join{
	float: right;
}

.element{
	padding: 10px;
	padding-left: 100px;
}

.ajax{
	padding-top: 0px;
	padding-left: 80px;
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
   <form id="signFrm" name="signFrm" action="joinAction.do" method="post">
   <table>
      <tbody>
            <tr>
               <td class="element">아이디</td>
               <td class="element"><input type="text" id="user_id" name="user_id" placeholder="아이디"
                ></td>
               <td class="element"><input type="button" id="check" value="중복체크"></td>
            </tr>
            <tr>
               <td colspan=3 id="idCheck" class="ajax"></td>
            </tr>
            <tr>
               <td class="element">패스워드</td>
               <td colspan="2" class="element"><input id="user_pw" name="user_pw" type="password" placeholder="비밀번호"
               maxlength="20" class="form-control"></td>
            </tr>
            <tr>
               <td class="element">패스워드 확인</td>
               <td colspan="2" class="element"><input id="passwdCheck" name="passwdCheck" type="password" placeholder="비밀번호 확인"
               maxlength="20" class="form-control"></td>
            </tr>
            <tr>
               <td class="element">이름 </td>
               <td colspan="2" class="element"><input id="user_name" name="user_name" type="text" placeholder="이름"
               maxlength="20" class="form-control"></td>
            </tr>
            <tr>
               <td class="element">닉네임</td>
               <td colspan="2" class="element"><input id="user_nickname" name="user_nickname" type="text" placeholder="닉네임"
               maxlength="20" class="form-control"></td>
            </tr>
            <tr>
               <td class="element">e-mail</td>
               <td colspan="2" class="element"><input type="email" class="form-control" placeholder="e-mail"
                     name="user_email" maxlength="20"></td>
            </tr>
            <tr>
               <td class="element">전화번호</td>
               <td colspan="2" class="element"><select name="user_phone1">
                  <option>010</option>
                  <option>02</option>
                  <option>031</option>
                  <option>070</option>
               </select> -
               <input type="text" name="user_phone2" size="5"> -
               <input type="text" name="user_phone3" size="5"></td>
            </tr>
            <tr>
               <td colspan="3"><input class="join" type="button" id="signUp" value="회원가입"></td>
            </tr>
         </tbody>
      </table>
   </form>
   </div>
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="js/bootstrap.js"></script>
   <footer>
   <jsp:include page="../common/footer.jsp"></jsp:include>
   </footer>
 </div>
</body>
<script type="text/javascript">
   $(document).ready(function(e){
      
      var idx = false;
      
      $('#signUp').click(function(){
         if($.trim($('#user_id').val()) == ''){
            alert("아이디를 입력해 주세요.");
            $('#user_id').focus();
            return;
         }else if($.trim($('#user_pw').val()) == ''){
            alert("패스워드를 입력해 주세요.");
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