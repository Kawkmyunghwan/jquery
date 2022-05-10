<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>목록</h3>
${users[0] }<br>
${users[1] }<br>
page : ${param.page } <br>
keyword : ${param.keyword } <br>
<script>
if('${msg}' != ''){
	alert('${msg}')
}
</script>
</body>
</html>