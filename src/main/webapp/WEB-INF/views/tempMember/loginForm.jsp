<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	  
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<div id="socketAlert" class="alert alert-success" role="alert" style="display:none;"></div>

<form action="/member/login" method="post">
아이디: <input type="text" id="member_id" name="member_id"><br>
비밀번호: <input type="password" id="member_pw" name="member_pw"><br>
<input type="submit" value="로그인">
</form>

</body>
</html>