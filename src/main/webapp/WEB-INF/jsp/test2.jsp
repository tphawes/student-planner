<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.taskManager.web.model.Student"%>
<html>

<head>
<link rel="stylesheet" href="mystyleGrid.css">

<title>Test Page</title>
</head>

	<br>

<body>

<h1>Grid Lines</h1>
<button class="tablinks" onclick="testF()">Calendar</button>

<div class="grid-container" id="grid1">
  <div class="item1">1</div>
  <div class="item2">2</div>
  <div class="item3">3</div>  
  <div class="item4">4</div>
  <div class="item5">5</div>
  <div class="item6">6</div>
  <div class="item7">7</div>
  <div class="item8">8</div>  
</div>

<p>You can refer to line numbers when placing grid items.</p>



</body>
<script>
function testF() {
	var container = document.getElementById("grid1");
	
	//var elements = document.getElementById("grid1");
	console.log("close form:" + container);
	//for (i = 0; i < elements.length; i++) {
	//	console.log("close form");
	//}
}
</script>

</html>