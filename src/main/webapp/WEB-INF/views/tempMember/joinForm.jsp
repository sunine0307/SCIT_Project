<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function formCheck(){
			var id = document.getElementById("member_id");
			var pw = document.getElementById("member_pw");
			var pw2 = document.getElementById("member_pw2");
			var name = document.getElementById("member_name");

			if(id.value.length<3 || id.value.length>10 ){
				alert("아이디는 3글자에서 10글자 사이로 입력");
				return false;
				}
			if(pw.value != pw2.value){
				alert("비밀번호를 정확하게 입력")
				return false;
				}
			if(name.value == ""){
				alert("이름을 입력");
				return false;
				}
			return true;
		}

</script>

</head>
<body>

<form action="/member/join" onsubmit="return formCheck();" method="post">
아이디: <input type="text" id="member_id" name="member_id"><br>
<div id= "idCheck"></div><br>

패스워드: <input type="password" id="member_pw" name="member_pw"><br>
패스워드 확인: <input type="password" id="member_pw2"><br>
이름:<input type="text" id="member_name" name="member_name"><br>

<input type="submit" value="전송">
<input type="reset" value="초기화"> 
</form>

</body>
</html>