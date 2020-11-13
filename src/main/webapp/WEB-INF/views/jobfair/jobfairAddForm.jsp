<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
    <link rel="icon" href="/resources/favicon.ico">
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

<meta charset="UTF-8">
  <!-- Custom fonts for this template -->
<!--  <link href="/resources/table/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
<!--  <link href="" rel="stylesheet"> -->

  <!-- Custom styles for this template -->
<!--  <link href="/resources/table/css/sb-admin-2.min.css" rel="stylesheet"> -->

  <!-- Custom styles for this page -->
  <link href="/resources/table/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<title>Job Fair Add Form</title>
<script type="text/javascript">
      // 유효성검사
      function addCompany(){
         var name = document.getElementById("name").value;
         var office = document.getElementById("office").value;
         var job_description = document.getElementById("job_description").value;
         var requirements = document.getElementById("requirements").value;
         var business = document.getElementsByName("jobfair_business");

         if(name == "" || name.length == 0){
            alert("회사명을 입력하세요");
            return false;
         }

         if(office == "" || office.length == 0){
            alert("office를 입력하세요");
            return false;
         }

         if(job_description == "" || job_description.length == 0){
            alert("job_description를 입력하세요");
            return false;
         }

         if(requirements == "" || requirements.length == 0){
            alert("requirements를 입력하세요");
            return false;
         }

         
         for(var i = 0; i < business.length ; i++){
            if(business[i].value == ""){
               alert("business를 작성하세요");
               return false;
            }
         }

         return true;
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
              <a href="/member2/mypage"  > <!-- 여기에 마이페이지 호출주소 넣어주면 됨 -->
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
<div class="card shadow mb-4">
                  <div class="card-header">
                    <strong class="card-title">Add a company </strong>
                  </div>
                  <div class="card-body">
                    <form action="/jobFair/addJobFair" method="post" onsubmit="return addCompany();">
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-3 col-form-label">Name</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" id="name"  name="jobfair_companyName">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputOffice" class="col-sm-3 col-form-label">Office</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" id="office" name="jobfair_office">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputJobDescription" class="col-sm-3 col-form-label">Job description</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" id="job_description"  name="jobfair_jobDescription">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputJobDescription" class="col-sm-3 col-form-label">Requirements</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" id="requirements" name="jobfair_requirements">
                        </div>
                      </div>     
                      <fieldset class="form-group">
                        <div class="row">
                          <label class="col-form-label col-sm-3 pt-0">Type</label>
                          <div class="col-sm-9">
                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="jobfair_type" id="gridRadios1" value="tokyo" checked>
                              <label class="form-check-label" for="gridRadios1"> TOKYO FAIR </label>
                            </div>
                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="jobfair_type" id="gridRadios2" value="seoul">
                              <label class="form-check-label" for="gridRadios2"> SEOUL FAIR </label>
                            </div>
                            <div class="form-check disabled">
                              <input class="form-check-input" type="radio" name="jobfair_type" id="gridRadios3" value="special">
                              <label class="form-check-label" for="gridRadios3"> SPECIAL FAIR </label>
                            </div>
                          </div>
                        </div>
                      </fieldset>
                      
                      <div class="form-group row">
                        <label class="col-sm-3" for="exampleFormControlTextarea1">Business</label>
                        <div class="col-sm-9">
                          <textarea class="form-control" name="jobfair_business" id="exampleFormControlTextarea1" rows="2"></textarea>
                        </div>
                      </div>
                      <div class="form-group mb-2">
                        <button type="submit" class="btn btn-primary">Upload</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div> <!-- / .card-desk-->
   </main>

 <!-- Bootstrap core JavaScript-->
  <script src="/resources/table/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/table/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/table/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/table/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/resources/table/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/resources/table/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/resources/table/js/demo/datatables-demo.js"></script>
  
  <!-- .wrapper -->
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/moment.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/simplebar.min.js"></script>
    <script src='/resources/js/daterangepicker.js'></script>
    <script src='/resources/js/jquery.stickOnScroll.js'></script>
    <script src="/resources/js/tinycolor-min.js"></script>
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