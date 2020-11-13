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
    
   <title>MY RESERVATION</title>
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
     
   <script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
   <script src="/resources/js/bootstrap.min.js"></script>
    
   <script>
   /* $(document).ready(function() {
      // 퇴실 클릭시
      $(".btnOut").click(function() {
         location.href = "/roomBook/roomEnd2?seat_aloc_sq=" + $(this).attr("id");
         $(this).attr("disabled", "true");
      });
   }); */

   // 스터디룸 예약페이지로 이동
   $(document).ready(function(){
      $(".btn-outline-info").click(function(){
         location.href= "/roomBook/moveBook";
      });
   });
   
   
   $(document).ready(function(){            // 퇴실버튼
      $(".btn-outline-primary").click(function(){
         $.ajax({
            url : "/roomBook/roomEnd2",
            type: "post",
            data : {
               seat_aloc_sq : $(this).attr("id"),
               seat_aloc_strt_tm : $('#seat_aloc_strt_tm').val(),
               seat_sq : $('#seat_sq').val()
            },
            success: function(res){
               $('#end_tm').html(res);
               $('#end_tm2').html(res);
               $('.btn-outline-primary').attr("disabled", true); // 퇴실버튼 비활성화하기
               $('.btn-outline-warning').attr("disabled", true); // 예약취소버튼 비활성화하기
               $('.btn-outline-success').attr("disabled", true);// 예약수정버튼 비활성화하기

               alert('Check Out');
            },
            error: function(e){
               alert("Reservation does not exist");
               console.log(e);
            }
         });
      });
   });

   
   $(document).ready(function(){         // 예약취소버튼
      $(".btn-outline-warning").click(function(){
         
         $.ajax({
            url:"/roomBook/roomDel",
            type:"post",
            data:{
               seat_aloc_sq : $(this).attr("id"), // 예약취소에 필요한 값
               seat_aloc_strt_tm : $('#seat_aloc_strt_tm').val(), // 예약취소시 타임라인 업데이트에 필요한 값
               seat_sq : $('#seat_sq').val() // 예약취소시 타임라인 업데이트에 필요한 값
            },
            dataType:"text",
            success: function(res){
               // alert(예약취소성공);
               if(res == 'delete'){
                  alert('Cancel reservation');
                  //location.reload();   // 페이지새로고침
                  $("#changeOneList").load("/roomBook/roomCheck #changeOneList");   // 테이블 부분만 로드하게 바꿈, 페이지깜빡임 x
                  $("#changeTable").load("/roomBook/roomCheck #changeTable");   // 전체리스트 테이블 부분만 로드하게 바꿈, 페이지깜빡임 x
                  
               }
   
            },
            error: function(e){
               alert("Reservation does not exist");
               console.log(e);
            }
         });
      });
   });
   

   </script>
   
   <script type="text/javascript">
      // modal창
      
      function timeList(){      // 스터디룸별 예약가능시간 보여주기
         $.ajax({
            type:"post",
            url: "/roomBook/selectTime",
            data: {
               seat_sq : $('#up_seat_sq').val()
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
               alert("Not Available");
               console.log(e);
            }
         });
      }

      
      // 예약수정
      $(document).ready(function(){
         $("#changeTime").click(function(){

            $.ajax({
               url:"/roomBook/updateBook",
               type:"post",
               data:{
                  seat_aloc_sq : $('#be_seat_aloc_sq').val(),   // 업데이트할 예약목록번호
                  seat_sq : $('#up_seat_sq').val(),      // 예약변경할 스터디룸
                  seat_aloc_strt_tm : $('#up_seat_aloc_strt_tm').val(),   // 예약변경할 시간
                  be_seat_aloc_strt_tm : $('#be_seat_aloc_strt_tm').val(),   // 예약변경 전 시간
                  be_seat_sq : $('#be_seat_sq').val()     // 예약변경 전 룸 sq 번호
               },
               dataType:"text",
               success: function(res){
                  if(res == '1'){
                     alert("예약을 변경하였습니다.");
                     //location.reload();   // 페이지새로고침
                     // $("#eventModal").hide();
                     
                     $("#changeOneList").load("/roomBook/roomCheck #changeOneList");   // 테이블 부분만 로드하게 바꿈, 페이지깜빡임 x
                     $("#changeTable").load("/roomBook/roomCheck #changeTable");   // 전체리스트 테이블 부분만 로드하게 바꿈, 페이지깜빡임 x
                  }else{
                     alert("예약 변경실패하였습니다.");
                  }
               },
               error: function(e){
                  alert("예약 변경 실패");
                  console.log(e);
               }
      
            });

         });

      });
      

      $(document).ready(function(){
         $("#modalBtm").click(function(){
            $("#eventModal").show();
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
      
      

   <!-- 디자인 적용 -->
   <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <h2 class="page-title">MY RESERVATION</h2>

                        <div class="col-md-12">
                        <p>Please check notice before book your reservation</p>
                           <div class="accordion w-100" id="accordion1">
                             <div class="card shadow">
                               <div class="card-header" id="heading1">
                                 <a role="button" href="#collapse1" data-toggle="collapse" data-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
                                   <strong>Notice</strong>
                                 </a>
                               </div>
                               <div id="collapse1" class="collapse show" aria-labelledby="heading1" data-parent="#accordion1">
                                 <div class="card-body"> 
                                       Study room is available between 9AM and 11PM. The reservation is restricted to on the day. After using study room, please check out your reservation. 
                                       <span><button type="button" class="btn mb-2 btn-outline-primary" disabled="disabled">CHECK OUT</button></span>
                                       button to check out your reservation. If you do not check out yours reservation, you cannot book anoter reservation.
                                 </div>
                               </div>
                             </div>
                             
                             <div class="card shadow">
                               <div class="card-header" id="heading1">
                                 <a role="button" href="#collapse2" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                                   <strong>Make a reservation</strong>
                                 </a>
                               </div>
                               <div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordion1">
                                 <div class="card-body"> 
                                  Booking is available on <span><button type="button" id="moveRoomCheck" class="btn mb-2 btn-outline-info">MAKE A RESERVATION</button></span> 
                                 </div>
                               </div>
                             </div>
                             
                             <div class="card shadow">
                               <div class="card-header" id="heading1">
                                 <a role="button" href="#collapse3" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                                   <strong>Notice</strong>
                                 </a>
                               </div>
                               <div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#accordion1">
                                 <div class="card-body"> Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. </div>
                               </div>
                             </div>
                           </div>
                         </div>
                  
             <br>
             <br>
              
            <!-- 당일 예약목록 -->
             <div class="col-md-12">
                  <div class="card shadow">
                    <div class="card-body">
                   
                    <h3 class="card-title">Reservation List</h3>
                       <p class="card-text">Your reservation</p>
                    <!-- table -->
                       <div id="changeOneList">
                       <table border="1" id="listTable" class="table table-bordered">
                          <tr>
                        <td>STUDYROOM NO.</td>
                        <td>${listOne.seat_nm }</td>
                     </tr>
                     <tr>
                        <td>USERID</td>
                        <td>${listOne.member_id }</td>
                     </tr>
                     <tr>
                        <td>RESERVATION DATE</td>
                        <td>${listOne.seat_aloc_dd }</td>
                     </tr>
                     <tr>
                        <td>START TIME</td>
                        <td>${listOne.seat_aloc_strt_tm }</td>
                     </tr>
                     <tr>
                        <td>END TIME</td>
                        <td id="end_tm2">${listOne.seat_aloc_end_tm }</td>
                     </tr>
                     <tr>
                        <td>CHECK OUT</td>
                        <td id="end_tm2">
                           <input type="hidden" id="OneSeat_aloc_sq" value="${listOne.seat_aloc_sq }">
                           <input type="hidden" id="seat_aloc_strt_tm" name="seat_aloc_strt_tm" value="${listOne.seat_aloc_strt_tm }">
                           <input type="hidden" id="seat_sq" name="seat_sq" value="${listOne.seat_sq }">
                           
                           <c:if test="${not empty sessionScope.loginId }">      
                              <!--<button class="btnOut" id="${listOne.seat_aloc_sq }">퇴실 ${listOne.seat_aloc_sq }</button>-->
                              <button type="button" class="btn mb-2 btn-outline-primary" id="${listOne.seat_aloc_sq }">CHECK OUT</button>
                           </c:if>
                        </td>
                     </tr>
                     <tr>
                        <td>RESERVATION UPDATE</td>
                        <td>
                           <c:if test="${not empty sessionScope.loginId }">
                              <button type="button" class="btn mb-2 btn-outline-success" data-toggle="modal" data-target="#eventModal">UPDATE</button>
                           </c:if>
                        </td>
                     </tr>
                     <tr>
                        <td>RESERVATION CANCEL</td>
                        <td>
                           <c:if test="${not empty sessionScope.loginId }">
                              <!--<button class="btnDel" id="${listOne.seat_aloc_sq }">예약취소 ${listOne.seat_aloc_sq }</button>-->
                              <button type="button" class="btn mb-2 btn-outline-warning" id="${listOne.seat_aloc_sq }">CANCEL</button>
                           </c:if>
                        </td>
                     </tr>
                       </table>
                       </div>
                     </div>
                  </div>
                 </div>
                 
   <!-- 예약 수정할 수 있게 스터디룸, 시간 보여주기 -->
   <!-- new event modal --> 
              <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="varyModalLabel">스터디룸 예약 수정</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body p-4">
                      <form>
                        
                        <div class="form-row">
                          <div class="form-group col-md-6">
                            <label for="date-input1">member_id</label>
                            <div class="input-group">
                              
                              <input type="text" class="form-control drgpicker" value="${listOne.member_id }" readonly="readonly">
                            </div>
                          </div>
                          <div class="form-group col-md-6">
                            <label for="startDate">StudyRoom</label>
                            <div class="input-group">
                              
                              <input type="text" class="form-control time-input" value="${listOne.seat_nm }" readonly="readonly">
                            </div>
                          </div>
                        </div>
                        
                        <div class="form-row">
                          <div class="form-group col-md-6">
                            <label for="date-input1">예약일</label>
                            <div class="input-group">
                              
                              <input type="text" class="form-control drgpicker" value="${listOne.seat_aloc_dd }" readonly="readonly">
                            </div>
                          </div>
                          <div class="form-group col-md-6">
                            <label for="startDate">시작시간</label>
                            <div class="input-group">
                              
                              <input type="text" class="form-control time-input" value="${listOne.seat_aloc_strt_tm }" id="be_seat_aloc_strt_tm" readonly="readonly">
                            </div>
                          </div>
                        </div>
                        
                        <div class="form-row">
                          <div class="form-group col-md-8">
                            <label for="eventType">예약수정사항</label>
                          </div>
                        </div>
                        
                        <div class="form-row">
                          <div class="form-group col-md-8">
                            <label for="eventType">스터디룸</label>
                            <select name="seat_sq" id="up_seat_sq" class="form-control select2" onchange="timeList();">
                        <option value="">스터디룸 선택</option>
                     <c:forEach var="vo" items="${upList }">
                        <option value="${vo.seat_sq }">${vo.seat_nm }</option>
                     </c:forEach>
                     </select>
                          </div>
                        </div>
                        
                        <div class="form-row">
                          <div class="form-group col-md-8">
                            <label for="eventType">시간</label>
                            <select name="seat_aloc_strt_tm" id="up_seat_aloc_strt_tm" class="form-control select2">
                              <option value="">시간 선택</option>
                            </select>
                          </div>
                        </div>
                        
                      </form>
                    </div>
                    <div class="modal-footer d-flex justify-content-between">
                      <input type="hidden" id="be_seat_aloc_sq" name="seat_aloc_sq" value="${listOne.seat_aloc_sq }">
                      <input type="hidden" id="be_seat_sq" name="seat_sq" value="${listOne.seat_sq }">
                      <button type="button" class="btn mb-2 btn-primary" data-dismiss="modal">close</button>
                      <c:if test="${not empty sessionScope.loginId }">
                         <button type="button" id="changeTime" class="btn mb-2 btn-primary" data-dismiss="modal">Save Update</button>
                      </c:if>
                    </div>
                  </div>
                </div>
              </div> 
              
              
              
              <!-- onclick="closeModal();" -->
              
      <!-- new event modal -->
            
            <br>
            <br>
            
            <!-- 전체 예약목록  -->
                <div class="col-md-12">
                  <div class="card shadow">
                    <div class="card-body">
                    <h3 class="card-title">TOTAL RESERVATION LIST</h3>
                      <p class="card-text">${sessionScope.loginId }'s current reservation : ${navi.totalRecordsCount }</p>
                      <!-- table -->
                      <div id="changeTable">
                  <table border="1" id="listTable" class="table table-bordered">
                     <tr>
                        <td>NO.</td>
                        <td>STUDYROOM NO.</td>
                        <td>USERID</td>
                        <td>RESERVATION DATE</td>
                        <td>START TIME</td>
                        <td>END TIME</td>
                     </tr>
                     <c:forEach var="seatList2" items="${seatList2 }" varStatus="status">
                        <tbody id="list_tbody">
                        <tr>
                           <td>
                              ${status.count }
                              <input type="hidden" id="tableSeat_aloc_sq" value="${seatList2.seat_aloc_sq }">
                           </td>
                           <td id="roomNum">${seatList2.seat_nm }</td>
                           <td>${seatList2.member_id }</td>
                           <td>${seatList2.seat_aloc_dd }</td>
                           <td id="start_tm">${seatList2.seat_aloc_strt_tm }</td>
                           <td id="end_tm">${seatList2.seat_aloc_end_tm }</td>
                        </tr>
                        </tbody>
                     </c:forEach>   
                  </table>
                  </div>
                  <!-- 페이징 디자인 적용 테스트 -->
                     <nav aria-label="Table Paging" class="mb-0 text-muted">
                         <ul class="pagination justify-content-end mb-0">   
                            <li class="page-item"><a class="page-link" href="/roomBook/roomCheck?page=${navi.currentPage - navi.pagePerGroup }">◁◁</a></li>
                          <li class="page-item"><a class="page-link" href="/roomBook/roomCheck?page=${navi.currentPage - 1 }">Previous</a></li>
                          
                          
                          <c:forEach var="counter" begin="${navi.startPageGroup }" end="${navi.endPageGroup }">
                        <c:if test="${counter == navi.currentPage }"></c:if>
                           <li class="page-item"><a class="page-link" href="/roomBook/roomCheck?page=${counter }">${counter }</a></li>
                        <c:if test="${counter == navi.currentPage }"></c:if>
                        </c:forEach>
                          
                          <li class="page-item"><a class="page-link" href="/roomBook/roomCheck?page=${navi.currentPage + 1 }">Next</a></li>
                          <li class="page-item"><a class="page-link" href="/roomBook/roomCheck?page=${navi.currentPage + navi.pagePerGroup }">▷▷</a></li>
                       </ul>
                      </nav>
                  
               </div>
              </div>
            </div> <!-- small talbe end -->
            
         </div>   
       </div> <!-- content-center end -->
      </div>
   </main><!-- 디자인적용끝 -->
   
   </div> <!-- wrapper -->

</body>
</html>