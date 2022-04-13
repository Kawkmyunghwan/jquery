<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
    <link rel="icon" href="./images/favicon.png" />
	<title>Document</title>
	<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
</head>
<body>
	<div class="container">
		<form id="form1" class="form-horizontal">
			<h2>사용자 등록 및 수정</h2>
			<div class="form-group">
				<label>아이디:</label> <input type="text" class="form-control"
					name="id">
			</div>
			<div class="form-group">
				<label>이름:</label> <input type="text" class="form-control"
					name="name">
			</div>
			<div class="form-group">
				<label>패스워드:</label> <input type="text" class="form-control"
					name="password">
			</div>
			<div class="form-group">
				<label>역할:</label> <select class="form-control" name="role">
					<option value="Admin">관리자</option>
					<option value="User">사용자</option>
				</select>
			</div>
			<div class="btn-group">
				<input type="button" class="btn btn-primary" value="등록" id="btnInsert" /> 
				<input type="button" class="btn btn-primary" value="수정" id="btnUpdate" /> 
				<input type="button" class="btn btn-primary" value="초기화" id="btnInit" />
			</div>
		</form>
	</div>
	<hr />
	<div class="container">
		<h2>사용자 목록</h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">아이디</th>
					<th class="text-center">패스워드</th>
					<th class="text-center">이름</th>
					<th class="text-center"></th>
					<th class="text-center"></th>
				</tr>
			</thead>
			
		 <tbody>
			<!--<tr>
					<td class="text-center">user</td>
					<td class="text-center">1111</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">User</td>
					<td class="text-center">
						<button class="btnUpd">조회</button>
						<button class="btnDel">삭제</button>
					</td>
				</tr>-->
		</tbody> 
		</table>
	</div>
	<script src='template/js/json.min.js'></script>
	<script>
		
		//등록버튼 이벤트
		$('#btnInsert').on('click', userInsert)
		//수정버튼 이벤트
		$('#btnUpdate').on('click', userUpdate)
		//등록버튼 : 직접이벤트
		function userInsert() {
			const url = "http://localhost/myserver/users";

			$.ajax({
				url : url,
				method : 'POST',
				data : JSON.stringify($('#form1').serializeObject()),
				contentType : "application/json"
			}).done(function(response){
				console.log(response)
				$('tbody').prepend(makeTr(response));
			})
		}
		
		//수정버튼 : 직접이벤트
		function userUpdate(){
			//버튼 클릭이벤트 -> ajax
			const url = "http://localhost/myserver/users";

			$.ajax({
				url : url,
				method : 'PUT',
				data : JSON.stringify($('#form1').serializeObject()),
				contentType : "application/json"
			}).done(function(response){
				var id = response.id;
				
				let newTr = makeTr(response);
				let oldTr = $('#'+ id);
				console.log(oldTr);
				oldTr.replaceWith(newTr);
			})
		}
		
		//조회버튼 : 그룹이벤트
		function userSelect(){
			$('table').on('click', '.btnUpd', function(){
				const userid = $(this).closest('tr').attr('id')
				const url = "http://localhost/myserver/users/" + userid;
				$.ajax(url)
				.done(function(data){
					form1.id.value = data.id;
					form1.password.value = data.password;
					form1.name.value = data.name;
					form1.role.value = data.role;
				})
			
			})
		}
		
		//삭제버튼 : 그룹이벤트
		function userDelete(){
			$('table').on('click', '.btnDel', function(){
				var tr = $(this).closest('tr')
				const userid = $(this).closest('tr').attr('id')
				const url = "http://localhost/myserver/users/" + userid;
				$.ajax({
					url : url,
					method : 'DELETE'
				}).done(function(){
					tr.remove();
				})
			})
		}					
		
		//목록조회
	    function list() {
	    	//전체조회하는 ajax
	    	const url = "http://localhost/myserver/users";
	    	$.ajax(url)
	    	.done(function(datas){
	    		for(data of datas){
	    			$('tbody').append(makeTr(data))
	    		}
	    	})
	    }
	    						
		function makeTr(user){
			let tr = $(`<tr id="\${user.id}">`)
			tr.html(`<td class="text-center">\${user.id}</td>
			<td class="text-center">\${user.name}</td>
			<td class="text-center">\${user.password}</td>
			<td class="text-center">\${user.role}</td>
			<td class="text-center">
				<button class="btnUpd">조회</button>
				<button class="btnDel">삭제</button>
			</td>`)
			
			return tr;
		}
		
		$(function(){
			userInsert();
			userUpdate();
			userSelect();
			userDelete();
			list();
		})
	</script>

</body>
</html>