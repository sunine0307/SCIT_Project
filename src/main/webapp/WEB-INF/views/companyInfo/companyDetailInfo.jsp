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
    <title>Company Information</title>
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="/resources/css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="/resources/css/feather.css">
    <link rel="stylesheet" href="/resources/css/select2.css">
    <link rel="stylesheet" href="/resources/css/dropzone.css">
    <link rel="stylesheet" href="/resources/css/uppy.min.css">
    <link rel="stylesheet" href="/resources/css/jquery.steps.css">
    <link rel="stylesheet" href="/resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="/resources/css/quill.snow.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="/resources/css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="/resources/css/app-light.css" id="lightTheme">
    <link rel="stylesheet" href="/resources/css/app-dark.css" id="darkTheme" disabled>
      <!-- Custom fonts for this template-->
  <link href="/resources/table/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources/table/css/sb-admin-2.min.css" rel="stylesheet">
  
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&callback=initMap&libraries=&v=weekly"
      defer
    ></script>
    <style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        width: 500px;
            height: 500px;
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    <script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
    <script>
      "use strict";

      // This example adds a marker to indicate the position of Bondi Beach in Sydney,
      // Australia.
      
      /* var c = document.getElementById("company_latitude").value; */
     // var a = 37.55358968871123
      //var b = 126.96979116137695
       
      function initMap() {
          var a = document.getElementById("company_latitude").value;
          var b = document.getElementById("company_longitud").value;
          a = Number(a);
          b = Number(b);
         // var a = 37.55358968871123
         // var b = 126.96979116137695
           const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 15,
          center: {
            lat: a,
            lng: b
          }
        });
        const image =
          "http://drive.google.com/uc?export=view&id=1tZgPtboj4mwBYT6cZlcY36kYaQDR2bRM";
        const beachMarker = new google.maps.Marker({
             position: {
                lat: a,
                 lng: b
          },
          map,
          icon: image
        });
      }
      function updateForm(){
          var company_no = document.getElementById("company_no").value;
         location.href="http://localhost:8888/companyInfo/updateForm?company_no="+company_no;
          }

      /*
      function deleteCompany(){
         var company_no = document.getElementById("company_no").value;
         location.href="/companyInfo/deleteCompany?company_no="+company_no;
         window.close();
          }
      */

   $(document).ready(function(){
      $("#deleteCompany").click(function(){
         $.ajax({
            url: "/companyInfo/deleteCompany",
            data:{
               company_no : $('#company_no').val()
            },
            success : function(res){
               if(res == "1"){
                  window.close();
                  // location.reload();
               }else{
                  alert("삭제실패");
               }
            },
            error: function(e){
                     alert("company does not exist");
                     console.log(e);
                  }
         });

      });

   });
      
    </script>

  
  </head>
  <body class="vertical  light  ">
  
     
  
        <button type="button" class="btn mb-2 btn-primary btn-lg btn-block" onclick="window.open('${company.company_link}'); return false">${company.company_name } </button>
       <!--  <button type="button" id="deleteCompany" class="btn mb-2 btn-success" onclick="deleteCompany()">Delete</button> -->
         
        <button type="button" id="deleteCompany" class="btn mb-2 btn-success">Delete</button>
        <span><button type="button" class="btn mb-2 btn-success" onclick="updateForm();">Update</button></span>
        
                  <br> <!-- 지도가 들어갈 자리 -->
                 <center> <div id="map"></div>
                  <input type = "hidden" id = "company_longitud" value = "${company.company_longitud }">
             <input type = "hidden" id = "company_latitude" value = "${company.company_latitude }">
             <input type="hidden" id= "company_no" value="${company.company_no}" name= "company_no">
                  </center>
  <br>
  <br>
  
        <div class="container-fluid">
                  <div class="card shadow mb-4">
                    <div class="card-header">
                      <strong class="card-title">Comments</strong>
                    </div>
                    <div class="card-body">
                    
                   <!--  댓글이 들어갈 자리 -->
                  
                      <div id="commentlist"> </div>
                   <!-- 댓글이 들어갈 자리 -->   
                    
                      <hr class="my-4">
                      <h6 class="mb-3">Response</h6>
                      <form action="/companyInfo/addComment" method="post">   <!-- comment를 쓰는 form, text area에 댓글이 적힘 -->
                        <div class="form-group">
                          <label for="exampleFormControlTextarea1" class="sr-only">Your Comment</label>
                          <textarea class="form-control bg-light" id="exampleFormControlTextarea1" rows="2" name="comment_content"></textarea>
                        </div>
                        <input type="hidden" id= "company_no" value="${company.company_no}" name="company_no"> 
                        <div class="d-flex justify-content-between align-items-center">
                          <button type="submit" class="btn btn-primary">Add</button>
                          
                        </div>
                      </form>
                    </div> <!-- .card-body -->
                  </div> <!-- .card -->
          
    </div>
    
     <!-- .wrapper -->
    <script src="/resources/js/jquery.min.js"></script>
    <script type="text/javascript">
   $(function(){
      console.log("readReply시작전");
      readReply();
      });
   function readReply(){
      console.log("readreply시작");
   $.ajax({
      url: "/companyInfo/fetchComment",
      type: "post",
      data:{
         company_no: ${company.company_no}
         },
      success: function(data){
            console.log(data);
            output(data);
            
         },
      error: function(e){alert("통신 실패...");console.log(e);}

         });
         
      }
   function output(data){
         var str="";
      $.each(data,function(index,item){
         str +='<div class="row align-items-center mb-4">';
         str +='  <div class="col-auto">';
         str +='<div class="avatar avatar-sm mb-3 mx-4">';
         str +='<img src="/member2/download" alt="..." class="avatar-img rounded-circle">';
         str +='</div>';
         str +=' </div>';
         str +='<div class="col">';
         str +=' <strong>';
         str += " " +item.member_id; 
         str +='</strong>';
         str +=' <div class="mb-2">';
         str +=" " + item.comment_content;
         str +='</div>';
         str +='<small class="text-muted">';
         str +="" + item.comment_indate;
         str +='</small>';
         str +='</div>';
         str +='</div>';
      
         });
      $("#commentlist").html(str);
      }
    
  
      
        
      
   
    
     
      

    </script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/moment.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/simplebar.min.js"></script>
    <script src='/resources/js/daterangepicker.js'></script>
    <script src='/resources/js/jquery.stickOnScroll.js'></script>
    <script src="/resources/js/tinycolor-min.js"></script>
    <script src='/resources/js/jquery.mask.min.js'></script>
    <script src='/resources/js/select2.min.js'></script>
    <script src='/resources/js/jquery.steps.min.js'></script>
    <script src='/resources/js/jquery.validate.min.js'></script>
    <script src='/resources/js/jquery.timepicker.js'></script>
    <script src='/resources/js/dropzone.min.js'></script>
    <script src='/resources/js/uppy.min.js'></script>
    <script src='/resources/js/quill.min.js'></script>
    <script>
    
      $('.select2').select2(
      {
        theme: 'bootstrap4',
      });
      $('.select2-multi').select2(
      {
        multiple: true,
        theme: 'bootstrap4',
      });
      $('.drgpicker').daterangepicker(
      {
        singleDatePicker: true,
        timePicker: false,
        showDropdowns: true,
        locale:
        {
          format: 'MM/DD/YYYY'
        }
      });
      $('.time-input').timepicker(
      {
        'scrollDefault': 'now',
        'zindex': '9999' /* fix modal open */
      });
      /** date range picker */
      if ($('.datetimes').length)
      {
        $('.datetimes').daterangepicker(
        {
          timePicker: true,
          startDate: moment().startOf('hour'),
          endDate: moment().startOf('hour').add(32, 'hour'),
          locale:
          {
            format: 'M/DD hh:mm A'
          }
        });
      }
      var start = moment().subtract(29, 'days');
      var end = moment();

      function cb(start, end)
      {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }
      $('#reportrange').daterangepicker(
      {
        startDate: start,
        endDate: end,
        ranges:
        {
          'Today': [moment(), moment()],
          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month': [moment().startOf('month'), moment().endOf('month')],
          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
      }, cb);
      cb(start, end);
      $('.input-placeholder').mask("00/00/0000",
      {
        placeholder: "__/__/____"
      });
      $('.input-zip').mask('00000-000',
      {
        placeholder: "____-___"
      });
      $('.input-money').mask("#.##0,00",
      {
        reverse: true
      });
      $('.input-phoneus').mask('(000) 000-0000');
      $('.input-mixed').mask('AAA 000-S0S');
      $('.input-ip').mask('0ZZ.0ZZ.0ZZ.0ZZ',
      {
        translation:
        {
          'Z':
          {
            pattern: /[0-9]/,
            optional: true
          }
        },
        placeholder: "___.___.___.___"
      });
      // editor
      var editor = document.getElementById('editor');
      if (editor)
      {
        var toolbarOptions = [
          [
          {
            'font': []
          }],
          [
          {
            'header': [1, 2, 3, 4, 5, 6, false]
          }],
          ['bold', 'italic', 'underline', 'strike'],
          ['blockquote', 'code-block'],
          [
          {
            'header': 1
          },
          {
            'header': 2
          }],
          [
          {
            'list': 'ordered'
          },
          {
            'list': 'bullet'
          }],
          [
          {
            'script': 'sub'
          },
          {
            'script': 'super'
          }],
          [
          {
            'indent': '-1'
          },
          {
            'indent': '+1'
          }], // outdent/indent
          [
          {
            'direction': 'rtl'
          }], // text direction
          [
          {
            'color': []
          },
          {
            'background': []
          }], // dropdown with defaults from theme
          [
          {
            'align': []
          }],
          ['clean'] // remove formatting button
        ];
        var quill = new Quill(editor,
        {
          modules:
          {
            toolbar: toolbarOptions
          },
          theme: 'snow'
        });
      }
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function()
      {
        'use strict';
        window.addEventListener('load', function()
        {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form)
          {
            form.addEventListener('submit', function(event)
            {
              if (form.checkValidity() === false)
              {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
    <script>
      var uptarg = document.getElementById('drag-drop-area');
      if (uptarg)
      {
        var uppy = Uppy.Core().use(Uppy.Dashboard,
        {
          inline: true,
          target: uptarg,
          proudlyDisplayPoweredByUppy: false,
          theme: 'dark',
          width: 770,
          height: 210,
          plugins: ['Webcam']
        }).use(Uppy.Tus,
        {
          endpoint: 'https://master.tus.io/files/'
        });
        uppy.on('complete', (result) =>
        {
          console.log('Upload complete! We’ve uploaded these files:', result.successful)
        });
      }
    </script>
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
    
      <!-- Bootstrap core JavaScript-->
  <script src="/resources/table/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/table/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/table/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/table/js/sb-admin-2.min.js"></script>

 
  </body>
</html>
