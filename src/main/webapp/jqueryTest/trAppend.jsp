<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
  integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
  crossorigin="anonymous"></script>
</head>
<body>
	<input id="userid">
	<input id="username">
	<input id="sal">
	<button type="button" id="btn">등록</button>
	<table>
		<thead>
			<tr><td>이름</td><td>급여</td></tr>
		</thead>
		<tbody>
			<tr data-userid="101"><td>홍길동</td><td>1000</td></tr>
		</tbody>
	</table>
	<script>
		//버튼 클릭 이벤트
		$("#btn").on("click", function(){			
			var $tr = $("<tr>");
			$tr.data("userid", $('#userid').val())
			var $td = $("<td>").html($('#username').val());
			var $td2 = $("<td>").html($('#sal').val());
			var $tbody = $("tbody");
			$tbody.append($tr);
			$tr.append($td);
			$tr.append($td2);
		})
		
		
	</script>
</body>
</html>