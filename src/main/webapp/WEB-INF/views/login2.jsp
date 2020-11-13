<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<script type="text/javascript">
  	function moveJoin(){
  	     location.href = "/member2/joinForm";
  	}
  	</script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/favicon.ico">
    <title>로그인</title>
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
    
  </head>
  <body class="light ">
    <div class="wrapper vh-100">
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
        <form class="col-lg-3 col-md-4 col-10 mx-auto text-center" action="/member2/login" method="post">
          <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="https://www.softsociety.net/">
            <svg version="1.1" id="logo" class="navbar-brand-img brand-md" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 120 120" xml:space="preserve">
              <img src="/resources/assets/images/sesoc.png" width="400px" height="200px"> <!-- 로고 클릭하면 자동으로 sesoc 웹사이트로 이동 -->
            </svg>
          </a>
          <div class="form-group">
            <label for="inputEmail" class="sr-only">ID</label>
            <input type="text" id="member_id" name="member_id" class="form-control form-control-lg" placeholder="id" >
          </div>
          <div class="form-group">
            <label for="inputPassword" class="sr-only">PASSWORD</label>
            <input type="password" id="member_pw" name="member_pw" class="form-control form-control-lg" placeholder="Password">
          </div>
      	<!-- 이쯤에 카카오, 네이버 로그인 버튼 추가하시면 됩니다 -->	    
           <br>
           <!-- 버튼 활성화해서 로그인 처리 해주시면 됩니다 -->
          <button class="btn btn-lg btn-primary btn-block" type="submit" value="LOGIN">LOGIN</button> <!-- 버튼 활성화해서 로그인 처리 해주시면 됩니다 -->
         
        <br>
        <!-- 네이버 로그인 창으로 이동 -->
		
           <input type= "button" class="btn btn-lg btn-primary btn-block" value="JOIN" onclick="moveJoin();">
		<!-- 카카오 로그인 창으로 이동 -->
		        <br>
		
		        <br>
		
		        <br>
		
		<div id="kakao_id_login" style="text-align:center"><a href="https://kauth.kakao.com/oauth/authorize?client_id=2e62014ff97c19cd48b281cffbf358a6&redirect_uri=http://localhost:8888/oauth&response_type=code">
		<img width="223" src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png"/></a></div>
		<br>
          

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
    <script src="/resources/js/config.js"></script>
    <script src="/resources/js/apps.js"></script>
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
  </body>
</html>
</body>
</html>
