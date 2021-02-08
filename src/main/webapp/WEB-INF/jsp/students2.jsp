<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.taskManager.web.model.Student"%>
<head>
<link rel="stylesheet" href="mystyle.css">
<title>Students</title>
</head>

<body>
	<p id="log"></p>
	<font color="red">${errorMessage}</font>
	    <!-- Request Five -->
	<form id="student_form" method="post">
		Name : <input type="text" name="name" id="name" /> <br> DOB : 
			<input
			type="text" name="dob" id="dob"><br> Status : <input
			type="text" name="status" id="status" /><br> Grade : <input
			type="text" name="grade" id="grade" /><br> 
			<input type="button" id="resetButton" onclick="resetFunction()" value="Reset form" disabled> 
			<input type="submit" id="updateButton" value="Add" disabled />
			<input type="submit" id="deleteButton" value="five" />
	</form>

	<p>Students2</p> Len ${fn:length(studentList)}

	<c:forEach begin="0" end="${fn:length(studentList) - 1}" var="index">
		<tr>
			<td><c:out value="${studentList[index]}" /></td>
		</tr>
	</c:forEach>

	<p>Students6</p>

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

	<script>
	//const input = document.querySelector('input');
	//const log = document.getElementById('log');
	//input.addEventListener('change', updateValue);
	//function updateValue(e) {
	//	alert(e.target.value);
	  //log.textContent = e.target.value;
	//}
	
	var form = document.getElementById("student_form");

	form.addEventListener("input", function () {
		//alert("change");
		document.getElementById("updateButton").disabled = false;
	});
	
		highlight_row();
		function highlight_row() {
			var table = document.getElementById('display-table');
			var cells = table.getElementsByTagName('td');
			for (var i = 0; i < cells.length; i++) {
				// Take each cell
				var cell = cells[i];
				// do something on onclick event for cell
				cell.onclick = function() {
					// Get the row id where the cell exists
					var rowId = this.parentNode.rowIndex;

					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 0; row < rowsNotSelected.length; row++) {
						rowsNotSelected[row].style.backgroundColor = "";
						rowsNotSelected[row].classList.remove('selected');
					}
					var rowSelected = table.getElementsByTagName('tr')[rowId];
					rowSelected.style.backgroundColor = "yellow";
					rowSelected.className += " selected";
					document.getElementById("name").value = rowSelected.cells[0].innerHTML;
					document.getElementById("dob").value = rowSelected.cells[2].innerHTML;
					document.getElementById("status").value = rowSelected.cells[3].innerHTML;
					document.getElementById("grade").value = rowSelected.cells[4].innerHTML;
					document.getElementById("updateButton").value = "Update";
					document.getElementById("updateButton").disabled = true;

					document.getElementById("resetButton").disabled = false;

					msg = 'The name of the student is: '
							+ rowSelected.cells[0].innerHTML;
					msg += '\nThe dob of the company is: '
							+ rowSelected.cells[2].innerHTML;
					msg += '\nThe cell value is: ' + this.innerHTML;
					//alert(msg);
				}
			}

		}
		function resetFunction() {
			//document.getElementById("name").value = "";
			//document.getElementById("dob").value = "";
			//document.getElementById("status").value = "";
			//document.getElementById("grade").value = "";
			document.getElementById("student_form").reset();
			document.getElementById("updateButton").value = "Add/Update";
			document.getElementById("resetButton").disabled = true;
		}
	</script>
</body>

</html>