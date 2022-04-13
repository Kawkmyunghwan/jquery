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
<script>
const url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20220412";
$.ajax(url)
 .done(function(data){
	 console.log(data);
	 console.log(data.boxOfficeResult.dailyBoxOfficeList[0].movieNm);
	 console.log(data.boxOfficeResult.dailyBoxOfficeList[0].movieCd);
	 console.log(typeof data);
 })
 const url2 =  "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=20204431";
 $.ajax(url2)
  .done(function(data){
	  console.log(data);
	  console.log(data.movieInfoResult.movieInfo.directors[0].peopleNm);
  })
</script>
</body>
</html>