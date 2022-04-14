<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>toastgrid.jsp</title>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
		
		$(function(){
		const Grid = tui.Grid;
		const instance = new Grid({
			  el: document.getElementById('grid'), // Container element
			  columns: [
			    {
			      header: '번호',
			      name: 'employee_id',			      
			    },
			    {
			      header: '이름',
			      name: 'first_name',
			      editor: 'text'
			    },
			    {
			      header: '급여',
			      name: 'salary',
			      editor: 'text'
			    },
			    {
				  header: '담당',
				  name: 'job_id',
				  editor: {
					  type: 'select',
					  options: {
						  listItems: [
							  { text: 'President', value : 'AD_PRES'},
							  { text: 'Administration', value : 'Assistant'},
							  { text: 'Sales Manager', value : 'SA_MAN'}
						  ]
					  }
				  }
			    },
			    {
			      header: '입사일',
			      name: 'hire_date',
			      editor: 'datePicker'
			    }
			  ],
			  data: {
				  	api: { 
				  		readData: { url: '/readEmp', method: 'GET'},
				  		modifyData : { url: '/modifyEmp', method: 'POST'},
				  		deleteData: { url: '/modifyEmp', method: 'POST' }
					}
				},
				contentType : 'application/json',
			});
			
			//ajax로 데이터 가져와서 resetData 안에 넣어주기..
			//비동기로 할거면 async 삭제, resetData를 done 안에 넣어주고 값을 그대로 담아주면됨..
/*			let jsonData;
			$.ajax({
				url : '../empSelect',
				async : false
			}).done(function(response){
				jsonData = [];
				for(rsp of response){
					jsonData = response		
				}
				console.log(response)
			})
			instance.resetData(jsonData); // Call API of instance's public method*/

			Grid.applyTheme('striped'); // Call API of static method
			
			$('#insertBtn').on("click", function(){
				instance.appendRow();
			})
			$('#deleteBtn').on("click", function(){		
				console.log(instance.getFocusedCell().rowKey);
				instance.removeRow(instance.getFocusedCell().rowKey); //getfocusCell
				instance.request('deleteData');
			})
			$('#modifyBtn').on("click", function(){
				instance.request('modifyData');
			})
	})
</script>
</head>
<body>
<button id="insertBtn">등록</button>
<button id="deleteBtn">삭제</button>
<button id="modifyBtn">저장</button>
<div id="grid"></div>
</body>
</html>