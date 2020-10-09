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
      <div class="row align-items-center h-100">
        <form class="col-lg-6 col-md-8 col-10 mx-auto"> <!-- 폼이 시작되는 지점, input 에 name 속성 잘 지정해서 등록 하도록 해주세요 !  -->
          <div class="mx-auto text-center my-4">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="https://www.softsociety.net/">
            <svg version="1.1" id="logo" class="navbar-brand-img brand-md" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 120 120" xml:space="preserve">
              <img src="/resources/assets/images/sesoc.png" width="400px" height="200px"> <!-- 로고 클릭하면 자동으로 sesoc 웹사이트로 이동 -->
            </svg>
          </a>
            <h2 class="my-3">Register</h2>
          </div>
          <div class="form-group">
            <label for="inputEmail4">Email</label>
            <input type="email" class="form-control" id="inputEmail4"> 
          </div>
           <button type="button" class="btn mb-2 btn-primary">Check your email</button> <!-- 중복검사 버튼 -->
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="name">Name</label>
              <input type="text" id="name" class="form-control">
            </div>
            <div class="form-group col-md-6">
              <label for="mobile">Mobile</label>
              <input type="text" id="Mobile" class="form-control">
            </div>
          </div>
          <hr class="my-4">
          <div class="row mb-4">
            <div class="col-md-6">
              <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password">
              </div>
              <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword">
              </div>
               <button type="button" class="btn mb-2 btn-primary">Check your pw</button> <!-- 중복검사 버튼 -->
            </div>
             <div class="col-md-6">
              <div class="form-group">
                <label for="inputPassword5">Course</label>
                <input type="text" class="form-control" id="course">
              </div>
              <div class="form-group">
                <label for="inputPassword6">Address</label>
                <input type="text" class="form-control" id="address">
              </div>
            </div>
          </div>
          <div>사진 파일 업로드할 창 하나 추가하고 사진파일 업로드 받게 해주세요</div>
          <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
          <p class="mt-5 mb-3 text-muted text-center">© 2020</p>
        </form>
      </div>
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