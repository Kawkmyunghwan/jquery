<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>등록</h3>
user : ${user.id }
<hr>
userVO : ${userVO.id }
<hr>
param : ${param.id }
<br>
profile : ${profile.id }
<form method="post" action="insert">
	<button>등록</button>
</form>
</body>
</html>