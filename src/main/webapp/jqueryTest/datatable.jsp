<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="//cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="//cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script>
$(function(){
	 //데이터테이블
	 var datatable = $('#table_id').DataTable({
		 ajax : { url : '../empSelect',
			 	  dataSrc: ''},
		 columns : [
			 			{ data: 'employee_id' },
			 			{ data: 'first_name' },
			 			{ data: 'salary' }
		 		   ]
			 	  
	 });
	 
	 //등록버튼 클릭
	 $('#btn').on("click", function(){
		 datatable.row.add({
			 "employee_id": "001",
			 "first_name": "김철수",
			 "salary": "5000"
		 }).draw();
	 })
	 
	 //과제 : 행(row)을 선택하면 삭제(테이블에 그룹이벤트)
	 
}) // 페이지 로드 펑션 끝
</script>
</head>

<body>
<button id="btn">등록</button>
<table id="table_id" class="display">
    <thead>
        <tr>
            <th>사원번호</th>
            <th>이름</th>
            <th>급여</th>
        </tr>
    </thead>
    <tbody>
        
    </tbody>
</table>
</body>
</html>