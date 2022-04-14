<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script>
  $( function() {
	//아코디언
	$( "#accordion" ).accordion();  
	
	//탭
    $( "#tabs" ).tabs({
    	active: 0,
    	activate: function( event, ui ) {
    		console.log(ui.newTab.text());
    	}
    });
	
	//데이트피커
	$('.dt').datepicker({
		dateFormat : 'yy-mm-dd'
		
	})
	
	//팝업
	let dialog = $('#empReg').dialog({
		autoOpen : false,
		modal : true
	});
	
	$('#btn').on('click', function(){
		dialog.dialog( "open" )
	})
	//모달 오픈버튼 클릭 이벤트
  });
  </script>
</head>
<body>
 
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Nunc tincidunt</a></li>
    <li><a href="chart.jsp">차트</a></li>
    <li><a href="trAppend.jsp">Aenean lacinia</a></li>
  </ul>
  <div id="tabs-1">
  <!-- 아코디언 시작 -->
    <div id="accordion">
  <!-- 아코디언 패널1 시작 -->
  <h3>Section 1</h3>
  <div>
    <input id="birth" name="birth" class="dt">
    <button id="btn">사원등록팝업열기</button>  
    <div id="empReg" title="사원등록">
    	<h3>사원등록</h3>
    	<input id="birth" name="birth" class="dt"> 
    </div>
  </div>
  <h3>Section 2</h3>
  <div>
  <!-- 아코디언 패널1 끝 -->
    <p>
    Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
    purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
    velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
    suscipit faucibus urna.
    </p>
  </div>
  <h3>Section 3</h3>
  <div>
    <p>
    Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
    Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
    ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
    lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
    </p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Section 4</h3>
  <div>
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
    <p>
    Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
    inceptos himenaeos.
    </p>
  </div>
<!-- 아코디언 끝 -->
</div>
</div>
</div>
 
 
</body>
</html>