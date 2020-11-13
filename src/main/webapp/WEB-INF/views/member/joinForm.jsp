<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/favicon.ico">
    <title>joinPage</title>
    <script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="/resources/css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="/resources/css/feather.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="/resources/css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="/resources/css/app-light.css" id="lightTheme">
    <link rel="stylesheet" href="/resources/css/app-dark.css" id="darkTheme" disabled>
    <script type="text/javascript">
       function formCheck(){
         var id = document.getElementById("member_id");
         var pw = document.getElementById("member_pw1");
         var pw2 = document.getElementById("member_pw2");
         var name = document.getElementById("member_name");
         
   
         if(id.value.length<3 || id.value.length>10 ){
            alert("아이디는 3글자에서 10글자 사이로 입력");
            return false;
            }
         if(pw.value == ""){
            alert("비밀번호를 입력해주세요");
            return false;
            }
         if(pw.value != pw2.value){
            alert("비밀번호를 정확하게 입력")
            return false;
            }
         if(name.value == ""){
            alert("이름을 입력해주세요");
            return false;
            }
   

      
         return true;
      }

       function idCheck() {
   		$.ajax({
   			url:"/member2/idCheck",
   			data:{
   				member_id: $("#member_id").val()
   					//컨트롤러의 매개변수랑 이름이 같아야함
   				},
   			success: function(data){
   //data는 컨트롤러에서 전송한 result
   				$("#idChecked").text(data);
   				},
   			error: function(e){
   				alert("통신실패");
   				console.log(e);
   				} 
   			});		

   		
   	}
    </script>
  </head>
  <body class="light ">
    <main role="main" class="main-content">
    <div class="wrapper vh-100">
<form class="col-lg-6 col-md-8 col-10 mx-auto" action="/member2/join" enctype="multipart/form-data" onsubmit="return formCheck();" method="post">          <div class="mx-auto text-center my-4">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="https://www.softsociety.net/">
            <svg version="1.1" id="logo" class="navbar-brand-img brand-md" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 120 120" xml:space="preserve">
              <img src="/resources/assets/images/sesoc.png" width="400px" height="200px"> <!-- 로고 클릭하면 자동으로 sesoc 웹사이트로 이동 -->
            </svg>
          </a>
          </div>
          <div class="form-row">
           <div class="form-group">
            <label for="member_id">ID</label>
            <c:if test="${not empty sessionScope.kakao_id }">   <!-- kakao로 로그인 한 경우 -->
               <input type="text" class="form-control" id="member_id" name="member_id" value="${sessionScope.kakao_id }" readonly="readonly">
            </c:if>
            <c:if test="${empty sessionScope.kakao_id }">      <!-- kakao 로그인 아닌 경우 -->
               <input type="text" class="form-control" id="member_id" name="member_id">
            </c:if>
          </div>
          </div>
           <span><button type="button" class="btn mb-2 btn-primary" onclick="idCheck();">Check Your ID</button>
            </span>
            <span><h1 id="idChecked" ></h1></span>
             <br>
             <br>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="pw1">PASSWORD</label>
              <input type="password" id="member_pw1" class="form-control" name="member_pw">
            </div>
            <div class="form-group col-md-6">
              <label for="pw2">CONFIRM PASSWORD</label>
              <input type="password" id="member_pw2" class="form-control">
            </div>
           </div>
            <span><button type="button" class="btn mb-2 btn-primary">Check Your PW</button> </span>
          
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="member_name">name</label>
                 <input type="text" id="member_name" name="member_name" class="form-control">
            </div>

            <div class="form-group col-md-6">
              <label for="">Mobile</label>
              <input type="text" id="mobile" class="form-control" name="member_mobile">
            </div>
          </div>
          
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="email">E-Mail</label>
              <input type="text" id="email" class="form-control" name="member_email">
            </div>
            <div class="form-group col-md-6">
              <label for="Course">Course</label>
              <input type="text" id="course" class="form-control" name= "member_course">
            </div>
          </div>
          
          
		  <div class="form-row">
            <div class="form-group col-md-6">
              <label for="Company">Company</label>
              <input type="text" id="company" class="form-control" name="member_company">
            </div>
            <div class="form-group col-md-6">
              <label for="Position">Position</label>
              <input type="text" id="position" class="form-control" name="member_position">
            </div>
          
          </div>
        <hr class="my-4">
          <div class="form-row">
             <div class="form-group col-md-6">
              <label for="image">Profile Upload</label>
                 <input type="file" name="upload" id="gdsImg">
                 
                 <div class = "select_img"><img src=""></div>   <!-- 업로드할 이미지 미리보기 -->
         
             <script>   
                 $("#gdsImg").change(function(){
                  if(this.files && this.files[0]) {
                   var reader = new FileReader;
                   reader.onload = function(data) {
                    $(".select_img img").attr("src", data.target.result).width(300);        
                   }
                   reader.readAsDataURL(this.files[0]);
                  }
                 });
             </script>   
            </div>
          </div>
          <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
        </form>
      </div>
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/moment.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/simplebar.min.js"></script>
    <script src='/resources/js/daterangepicker.js'></script>
    <script src='/resources/js/jquery.stickOnScroll.js'></script>
    <script src="/resources/js/tinycolor-min.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];

      function gtag()
      {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      gtag('config', 'UA-56159088-1');
    </script>
    </main>
  </body>
</html>
</body>
</html>