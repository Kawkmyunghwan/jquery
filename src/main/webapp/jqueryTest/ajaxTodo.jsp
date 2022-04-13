<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
</head>
<body>
<h3>todo list</h3>
<input id="title">
<button id="btn">등록</button>
<div id="list">
	<div data-id="1">test1</div>
</div>
<script>
	const url = "https://jsonplaceholder.typicode.com/todos"
	
	//등록
	$('#btn').on('click', function(){
		$.ajax( {
			url : url,
			method : 'POST',
			data : JSON.stringify({ title: $('#title').val(), userId : "kim", completed: false}),
			contentType : "application/json"
		}).done(function(response){
			console.log(response)
		});
	})
	
	//조회
	$.ajax(url)
	.done(function(data){
		for(d of data){
			let div = $('<div>')
			$('#list').append(div.data('id', d.id)
					  .html(d.title + " " + d.completed))
					  
			if(d.completed){
				div.css('color', 'blue');
			}		  
		}
	})
</script>
</body>
</html>