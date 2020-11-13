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
    <title>mypage</title>
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
    
    <script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
    
    <script type="text/javascript">

      function moveEditPage(){   // 회원정보 수정페이지 이동 전 확인

         if(confirm("회원정보를 수정하시겠습니까?") == true){
            location.href="/member2/moveEditPage";   // 회원정보 수정페이지로 이동
         }else{
            return false;
         }
      }

      
      function deleteMemberCheck(){   // 회원정보 삭제 전 확인

         if(confirm("회원정보를 삭제하시겠습니까?") == true){
            document.memberInfo.submit();
         }else{
            return false;
         }
      }

    </script>
    
    
  </head>
  <body class="vertical  light  ">
     
      <aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
        <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
          <i class="fe fe-x"><span class="sr-only"></span></i>
        </a>
        <nav class="vertnav navbar navbar-light">
          <!-- nav bar -->
          <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="https://www.softsociety.net/">
              <img src="/resources/assets/images/sesoc.png" width="100px" height="50px"> <!-- 로고 클릭하면 자동으로 sesoc 웹사이트로 이동 -->
            </a>
          </div>
          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item dropdown">
              <a href="/mypage"  > <!-- 여기에 마이페이지 호출주소 넣어주면 됨 -->
                <i class="fe fe-user fe-16"></i>
                <span class="ml-3 item-text">MY PAGE</span>
              </a>
            </li>
          </ul>
          <p class="text-muted nav-heading mt-4 mb-1">
          </p>
          <ul class="navbar-nav flex-fill w-100 mb-2">
             <li class="nav-item dropdown">
              <a href="/menu/member"  > <!-- 여기에 회원정보 호출주소 넣어주면 됨 -->
                <i class="fe fe-book fe-16"></i>
                <span class="ml-3 item-text">MEMBER</span>
              </a>
            </li>    
           </ul>
          
           
          <p class="text-muted nav-heading mt-4 mb-1">
            <span>Applications</span>
          </p>
          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item w-100">
              <a class="nav-link" href="/event/calendar"> <!-- 여기에 캘린더 호출주소 넣어주면 됨 -->
                <i class="fe fe-calendar fe-16"></i>
                <span class="ml-3 item-text">CALENDAR</span>
              </a>
            </li>
            <li class="nav-item w-100">
              <a class="nav-link" href="/menu/chatbot"> <!-- 챗봇 호출주소 넣어주면 됨 -->
                <i class="fe fe-compass fe-16"></i>
                <span class="ml-3 item-text">CHATBOT</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="#contact" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-layers fe-16"></i>
                <span class="ml-3 item-text">STUDYROOM</span>
              </a>
              <ul class="collapse list-unstyled pl-4 w-100" id="contact">
                <a class="nav-link pl-3" href="/roomBook/moveBook"><span class="ml-1">MAKE A RESERVATION</span></a>  <!-- 예약 호출주소 넣어주면 됩니다.-->
                <a class="nav-link pl-3" href="/roomBook/roomCheck"><span class="ml-1">MY RESERVATION</span></a> <!-- 예약현황 호출주소 넣어주면 됩니다.-->
              </ul>
            </li>
            
          </ul>
          <p class="text-muted nav-heading mt-4 mb-1">
            <span>INFORMATION</span>
          </p>
          <ul class="navbar-nav flex-fill w-100 mb-2">
           <li class="nav-item w-100">
              <a class="nav-link" href="/companyInfo/companylist"> <!-- 여기에 현지기업 호출주소 넣어주면 됨 -->
                <i class="fe fe-grid fe-16"></i>
                <span class="ml-3 item-text">COMPANY OVERVIEW</span>
              </a>
            </li>
             <li class="nav-item w-100">
              <a class="nav-link" href="/notice/noticeList"> <!-- 여기에 현지기업 호출주소 넣어주면 됨 -->
                <i class="fe fe-file fe-16"></i>
                <span class="ml-3 item-text">NOTICE</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="#pages" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-box fe-16"></i>
                <span class="ml-3 item-text">JOB FAIR</span>
              </a>
              <ul class="collapse list-unstyled pl-4 w-100" id="pages">
                <a class="nav-link pl-3" href="/jobFair/jobfairSeoul"><span class="ml-1">SEOUL</span></a>  <!-- 도쿄 잡페어-->
                <a class="nav-link pl-3" href="/jobFair/jobfairTokyo"><span class="ml-1">TOKYO</span></a> <!-- 서울 잡페어-->
                <a class="nav-link pl-3" href="/jobFair/jobfairSpecial"><span class="ml-1">SPECIAL</span></a> <!-- 스페셜 잡페어-->
              </ul>
            </li>
           
          </ul>
          
          <div class="btn-box w-100 mt-4 mb-1">
            <a href="/member2/logout" class="btn mb-2 btn-primary btn-lg btn-block"> <!-- 로그아웃 호출 주소 넣으면 됨 -->
              <i class="fe fe-shield fe-16"></i><span class="small"> LOG OUT </span>
            </a>
          </div>     
        </nav>
      </aside>

     <main role="main" class="main-content">
           <div id="socketAlert" class="alert alert-success" role="alert" style="display:none;"></div>       
    <div class="wrapper vh-100">
      <div class="row align-items-center h-100">
       <div class="col-lg-6 col-md-8 col-10 mx-auto">
        <form action="/member2/deleteMemberInfo" name="memberInfo" method="get"> <!-- 폼이 시작되는 지점 -->
          <div class="mx-auto text-center my-4">
            <div class="w-100 mb-4 d-flex">
            <div class="navbar-brand mx-auto mt-2 flex-fill text-center">
             <c:if test="${not empty memberInfo.savedfile }">
               <img src="/member2/download" class="avatar-img rounded-circle" height="250" width="200">
               
             </c:if>
            <c:if test="${empty memberInfo.savedfile }">
                     첨부된 이미지가 없습니다.
            </c:if>
            </div>
          </div>
                      <h2 class="my-3">${memberInfo.member_no}</h2>
                     
          </div> 
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="name">Name</label>
              <input type="text" id="name" placeholder="${memberInfo.member_name}" class="form-control" readonly="readonly">
            </div>
            <div class="form-group col-md-6">
              <label for="course">Course</label>
              <input type="text" id="course" placeholder="${memberInfo.member_course}" class="form-control" readonly="readonly">
            </div>
          </div>
           <div class="form-row">
            <div class="form-group col-md-6">
              <label for="name">Company</label>
              <input type="text" id="company" placeholder="${memberInfo.member_company}" class="form-control" readonly="readonly">
            </div>
            <div class="form-group col-md-6">
              <label for="mobile">Position</label>
              <input type="text" id="position"  placeholder="${memberInfo.member_position}" class="form-control" readonly="readonly">
            </div>
          </div>
         <div class="form-row">
            <div class="form-group col-md-6">
              <label for="mobile">Mobile</label>
              <input type="text" id="mobile" placeholder="${memberInfo.member_mobile}" class="form-control" readonly="readonly">
            </div>
            <div class="form-group col-md-6">
              <label for="email">E-mail</label>
              <input type="text" id="email" placeholder="${memberInfo.member_email}" class="form-control" readonly="readonly">
            </div>
          </div>   
          
             <div class="form-row">
            <div class="form-group col-md-6">
              <label for="it_sc">IT_Score</label>
              <input type="text" id="it_sc" placeholder="${memberInfo.member_sc_it}" class="form-control" readonly="readonly">
            </div>
            <div class="form-group col-md-6">
              <label for="jp_sc">JP_Score</label>
              <input type="text" id="jp_sc" placeholder="${memberInfo.member_sc_j}" class="form-control" readonly="readonly">
            </div>
          </div>          
      
           <input type="hidden" name="savedfile" value="${memberInfo.savedfile }">
          <input type="hidden" name="originalfile" value="${memberInfo.originalfile }">
          <input type="hidden" name="member_no" value="${memberInfo.member_no}">
          <input type="hidden" name="member_id" value="${memberInfo.member_id}">
          <br>
          </form>
             <button class="btn btn-lg btn-primary btn-block" onclick="deleteMemberCheck()">Delete</button> <!-- 삭제하기 -->
             <button class="btn btn-lg btn-primary btn-block" onclick="moveEditPage()">Edit</button> <!-- 수정하기 -->
          </div>
          <br>
      </div>
    </div>
</main>
    
    <!-- .wrapper -->
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
   
  </body>
</html>