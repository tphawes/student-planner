<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.taskManager.web.model.Student"%>
<html>

<head>
<link rel="stylesheet" href="mystyle.css">

<title>Test Page</title>
</head>

	<br>
	<table id="display-table" class="table-layout" style="width: 100%">
		<tr>
			<th>Name</th>
			<th>ID</th>
			<th>DOB</th>
			<th>Status</th>
			<th>Grade</th>
		</tr>
		<c:forEach items="${studentList}" var="student">
			<tr>
				<td>${student.name}</td>
				<td>${student.id}</td>
				<td>${student.dateOfBirth}</td>
				<td>${student.status}</td>
				<td>${student.grade}</td>
			</tr>
		</c:forEach>
	</table>

<body>
	<div class="btn-group" style="width: 100%">
		<button style="width: 33.3%" onclick="addFunction()" id="addButton">Add Student</button>
		<button style="width: 33.3%" onclick="updateFunction()" id="updateButton" disabled>Update Student</button>
		<button style="width: 33.3%" onclick="removeFunction()" id="removeButton" disabled>Remove Student</button>
	</div>
	<form method="post" hidden>
		Name : <input type="text" name="name" /> Password : <input
			type="password" name="password" /> <input type="submit" value="Three"/>
	</form>

	<form action="test" method="get" target="tst" hidden>
		Name : <input type="text" name="name" /> Password : <input
			type="password" name="password" /> <input type="submit" value="Four">
	</form>

	<form action="test" method="delete" hidden>
		Name : <input type="text" name="name" /> Password : <input
			type="password" name="password" /> <input type="submit" value="Five">
	</form>

	<form id="student_add_form" method="post" hidden>
		Name : <input type="text" name="name" id="name" /> <br> 
		DOB : <input type="text" name="dob" id="dob"><br> 
		Status : <input	type="text" name="status" id="status" /><br> 
		Grade : <input type="text" name="grade" id="grade" /><br>
			<input type="hidden" id="addStudentIndicator" name="addStudent"/>
			<input type="submit" id="addFormButton" value="Add Student" disabled />
			<input type="button" id="cancelFormButton" onclick="resetFunction(); resetWindow()" value="Cancel">
	</form>
</body>
<script>


var form = document.getElementById("student_add_form");
form.addEventListener("input", function () {
	//alert("change");
	document.getElementById("addFormButton").disabled = false;

});

function addFunction() {
	document.getElementById("updateButton").disabled = true;
	document.getElementById("removeButton").disabled = true;
	document.getElementById("student_add_form").hidden = false;
	document.getElementById("addStudentIndicator").value = 0;

}
function updateFunction() {
	//alert("update");
	document.getElementById("addButton").disabled = true;
	document.getElementById("removeButton").disabled = true;
	document.getElementById("student_add_form").hidden = false;
	document.getElementById("addStudentIndicator").value = 1;

}
function removeFunction() {
	
	var table = document.getElementById('display-table');
	var row = 0;
	var rowsNotSelected = table.getElementsByTagName('tr');
	for ( row = 0; row < rowsNotSelected.length; row++) {
		var str2 = "selected";
		var n = str2.localeCompare(rowsNotSelected[row].classList.value.trim());
		if( n == 0)
		{
			//alert("rows2:" + n + ":" + row);
			break;
		}
	}
	--row;//Need to decrement as the header is position 0 in the list
	//alert("remove:" + row);
	
	const Http = new XMLHttpRequest();
	Http.onreadystatechange = function() {
		console.log("readyState:" + this.readyState + ":" + this.status);
	    if (this.readyState == 4 && this.status == 200) {
	      //document.getElementById("demo").innerHTML = this.responseText;
	      console.log("Something");
	    }
	};

	const url='http://localhost:8080/testDelete';
	Http.open("POST", url);
	Http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	Http.send("deleteIndex=0");

	Http.onreadystatechange = (e) => {
	  console.log("Resp:" + Http.responseText);
	  console.log("End Resp");
	}
	//alert("removed:" + row);

	//document.getElementById("addButton").disabled = true;
	//document.getElementById("updateButton").disabled = true;
	document.getElementById("addButton").disabled = false;

}
function resetFunction() {
	document.getElementById("student_add_form").reset();
	document.getElementById("addFormButton").disabled = true;
}
//Reset the window clear and hide the forms
function resetWindow() {
	document.getElementById("student_add_form").reset();
	document.getElementById("student_add_form").hidden = true;
	document.getElementById("updateButton").disabled = true;
	document.getElementById("removeButton").disabled = true;
}
function addFormFunction() {
	document.getElementById("student_add_form").reset();
	document.getElementById("addFormButton").disabled = true;
	document.getElementById("student_add_form").hidden = true;
}
//Highlight the selected row
highlight_row();
function highlight_row() {
	var table = document.getElementById('display-table');
	var cells = table.getElementsByTagName('td');
	for (var i = 0; i < cells.length; i++) {
		// Take each cell
		var cell = cells[i];
		// do something on onclick event for cell
		cell.onclick = function() {
			document.getElementById("updateButton").disabled = false;
			document.getElementById("removeButton").disabled = false;
			document.getElementById("addButton").disabled = true;
			// Get the row id where the cell exists
			var rowId = this.parentNode.rowIndex;

			var rowsNotSelected = table.getElementsByTagName('tr');
			for (var row = 0; row < rowsNotSelected.length; row++) {
				rowsNotSelected[row].style.backgroundColor = "";
				rowsNotSelected[row].classList.remove('selected');
			}
			var rowSelected = table.getElementsByTagName('tr')[rowId];
			document.getElementById("name").value = rowSelected.cells[0].innerHTML;
			document.getElementById("dob").value = rowSelected.cells[2].innerHTML;
			document.getElementById("status").value = rowSelected.cells[3].innerHTML;
			document.getElementById("grade").value = rowSelected.cells[4].innerHTML;

			rowSelected.style.backgroundColor = "yellow";
			rowSelected.className += " selected";
		}
	}
}
function unhighlight_row() {
	document.getElementById("updateButton").disabled = true;
	document.getElementById("removeButton").disabled = true;
	document.getElementById("addButton").disabled = false;
	var table = document.getElementById('display-table');
	var cells = table.getElementsByTagName('td');
	for (var i = 0; i < cells.length; i++) {
		var rowsNotSelected = table.getElementsByTagName('tr');
		for (var row = 0; row < rowsNotSelected.length; row++) {
			rowsNotSelected[row].style.backgroundColor = "";
			rowsNotSelected[row].classList.remove('selected');
		}
	}
}
</script>

</html>