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
<style>
	.active { background-color : green; color : white }
</style>
<body>
	<input id="book">
	<ul>
		<li data-isbn="102"><span>스프링</span></li>
		<li data-isbn="103"><span>자바</span></li>
		<li data-isbn="104"><span>스프링</span></li>
	</ul>
	<script>
		$("#book").on("keypress", function(){
			if(event.keyCode == 13){
//				$li = $("<li>");
//				$li.html($("#book").val());
//				$("ul").append($li);
//				$("#book").val("");
				$("<li>").append($("<span>").html($("#book").val() ))
						 .data("isbn", "101")
						 .appendTo($("ul"))
				$("#book").val("")
			}
		})
		//그룹이벤트(부모에게 위임) : 동적으로 추가될 태그에도 이벤트가 적용됨.
		$("ul").on("mouseover mouseout", "span", function(){
			//$(event.target).css('background-color', 'blue') //$(this)
			$(this).toggleClass('active');
			console.log($(this).parent().data("isbn"));
		})
		
	</script>
</body>
</html>