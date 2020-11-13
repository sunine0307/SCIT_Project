<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
   <title>RESERVATEION</title>
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
   <!-- bootstrap4 -->
   
   <link rel="stylesheet" href="/resources/css/dataTables.bootstrap4.css">
   <script src="/resources/js/bootstrap.min.js"></script>
   
   <script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
   <script src="/resources/js/bootstrap.min.js"></script>   <!-- 위치변경  -->
   
   <script type="text/javascript">
   
      // 개인예약확인페이지로 이동
      $(document).ready(function(){
         $(".btn-outline-success").click(function(){
            location.href= "/roomBook/roomCheck";
         });
      });
      
   
      // 스터디룸별 예약가능시간 보여주기
      function timeList(){
         $.ajax({
            type:"post",
            url: "/roomBook/selectTime",
            data: {
               seat_sq : $('#seat_sq').val()
            },
            dataType: "json",
            success: function(res){
   
               var target = $('select[name="seat_aloc_strt_tm"]'); // 서브카테고리
               target.find('option').remove(); // 기존리스트 삭제

               $.each(res, function(index, item){
                  $('select[name="seat_aloc_strt_tm"]').append('<option value="' +item.timeLine+ '">' + item.timeLine + '</option>');
               });
               
            },
            error: function(e){
               alert("통신 실패");
               console.log(e);
            }
         });
      }

      
      // submit 버튼으로 form체크
      function timeCheck(){
         // select 유효성검사
         if($('#seat_sq').val() == ""){
            alert("please select studyroom");
            return false;
         }

         if($('#seat_aloc_strt_tm').val() == ""){
            alert("Please select start time");
            return false;
         }

         return true;
      }

      //button으로 예약가능 확인하기(중복예약체크) --> 예약가능 확인 후 submit으로 예약하기
      $(document).ready(function(){
         $("#doubleCheck").click(function(){
            $.ajax({
               url: "/roomBook/check",
               data: {
                  member_id : $("#user_id").val()
               },
               // dataType:"text",
               async: false,            // 비동기방식을 동기로 사용해서 true false 반환하기
               success: function(res){
                  if(res == "1"){
                     alert("Already occupied");
                      $('input[type="submit"]').attr("disabled", true);
                  }
                  else{
                     alert("Available");
                     $('input[type="submit"]').attr("disabled", false);
                  }
               },
               error: function(e){
                  alert("통신 실패");
                  console.log(e);
               }
      
               });
      
         });
      });

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
            <!-- error -->
            
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


   <!-- 예약안내사항 -->
   <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <h2 class="page-title">MAKE A RESERVATION</h2>
              <p> Please check notice before making a reservation</p>
                   
                       <div class="row">
                         <!--<div class="col-md-6 mb-4">-->
                        <div class="col-md-12">
                           <div class="accordion w-100" id="accordion1">
                             <div class="card shadow">
                               <div class="card-header" id="heading1">
                                 <a role="button" href="#collapse1" data-toggle="collapse" data-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
                                   <strong>Notice</strong>
                                 </a>
                               </div>
                               <div id="collapse1" class="collapse show" aria-labelledby="heading1" data-parent="#accordion1">
                                 <div class="card-body"> 
                                       Study room is available between 9AM and 11PM. The reservation is restricted to on the day. To check out or cancel your reservation, 
                                       press <span><button type="button" id="moveRoomCheck" class="btn mb-2 btn-outline-success">My reservation</button></span> 
                                 </div>
                               </div>
                             </div>
                             
                             <div class="card shadow">
                               <div class="card-header" id="heading1">
                                 <a role="button" href="#collapse3" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                                 </a>
                               </div>
                               
                             </div>
                           </div>
                         </div>
                         
                        
                     </div> <!-- end section -->   
             <br>
             <br>
             
            <!-- 예약폼 div 시작-->
            <div class="row">
            
            <!-- 스터디룸 위치 이미지 넣기-->
            <!--<div class="col-md-6 my-4">-->
            <div class="col-md-12">
                <div class="card shadow">
                    <div class="card-body">
                      <h5 class="card-title">ROOM LOCATION</h5>
                      <div class="card-title">
                         <!-- 이미지 동적으로 크기 변환 찾아보기 -->
                          <center>
                            <img src="/resources/assets/images/roomLocationSample.png" width="800px" height="600px">
                         </center>
                      </div>
                      
                    </div>
                </div>
            </div> <!-- 이미지 마지막 -->
            </div>
            
            <br>
            <br>
            
            <!-- 예약폼 -->
            <form action="/roomBook/seatbook" method="post" onsubmit="return timeCheck()">
            <div class="row">
            
                  <!--<div class="col-md-6 mb-4">-->
                  <div class="col-md-12">
                      <div class="accordion accordion-boxed" id="accordion2">
                          <div class="card shadow">
                          
                          <div class="card-header" id="headingOne">
                                 <a role="button" href="#collapseOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                   <strong>RESERVATION</strong>
                                 </a>
                          </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion2">
                           <div class="card-body">      
                         <div class="form-row">
                              <div class="form-group col-md-4">
                                <label for="inputState5">STUDYROOM</label>
                                <select name="seat_sq" id="seat_sq" class="form-control" onchange="timeList();">
                                  <option value="">SELECT ROOM NUMBER</option>
                                  <c:forEach var="vo" items="${roomList }">
                              <option value="${vo.seat_sq }">${vo.seat_nm }</option>
                           </c:forEach>
                                </select>
                              </div>
                              <div class="form-group col-md-4">
                                <label for="inputLang">START TIME</label>
                                <select name="seat_aloc_strt_tm" id="seat_aloc_strt_tm" class="form-control">
                                  <option value="">SELECT TIME</option>
                                </select>
                              </div>
                          </div>
                 
                        <div>
                           <input type="hidden" id="user_id" name="member_id" value="${sessionScope.loginId }">
                           <input type="button" class="btn mb-2 btn-outline-primary" id="doubleCheck" value="Check availble time">
                           <input type="submit" class="btn mb-2 btn-outline-warning" disabled="disabled" value="Make a reservation" >
                        </div>
                        
                        </div> <!-- card-body 끝 -->
                     </div> <!-- 아코디언1 끝 -->
                     
                     </div> <!-- card shadow 끝 -->
                  </div>
               </div>
               
            </div>   <!-- end row -->
            </form>
         </div>
      </div>
    </div>
   </main>
   
   </div> <!-- wraper end -->

</body>
</html>