<html>

<head>
<link rel="stylesheet" href="mystyle2.css">

<title>Student Meeting Recorder</title>
</head>

<body>


	Set Calendar Dates:<input type="date" id="dateInput" onChange=setCalendarDates()><br>
	<button onclick="startFunction()" id="startButton">start button</button>
	
	<button onclick="loadStudentTable2()" id="testButton">loadStudentTable2</button>
	<button onclick="loadCalendarTable2()" id="testButton">loadCalendarTable2</button>
	loadCalendarTable2

	<div id="result"></div>
	<button onclick="memoryFunction()" id="addButton">Add Student</button>
	<div id="memSpace"></div>
	

<input type="file" id="files" name="files[]" multiple />
<output id="list"></output>

<p id="demo6"></p>

<h2>Student Data</h2>
<div class="table_outer">
	<table id="student-table" class="fixed_header" style="width: 100%" border='1'>
  </div>
	
	</table>
	<form id="studentInputForm" onSubmit="addStudent(); return false;" hidden>
		Name : <input type="text" name="name" id="inputName" value="ted"/><br>
		ID : <input type="text" name="id" id="inputId" value="4"/><br>
		DOB : <input type="text" name="dob" id="inputDOB" value="02/26/1964"/><br>
		STATUS : <input type="text" name="status" id="inputStatus" value="enrolled"/><br>
		GRADE : <input type="text" name="grade" id="inputGrade" value="9"/><br>
		<input type="submit" value="Add Student"/>
		<input type="button" value="Cancel" onClick="cancelAdd()"/>
	</form>
	
<button onclick="addStudentFunction()" id="addStudentButton">Add Student</button>
<button onclick="deleteStudentFunction()" id="deleteStudentButton">Delete Student</button>

<h2>Meeting Data</h2>
	<table id="meeting-table" class="gr" style="width: 100%" border='1'>
	</table>
	<form id="meetingInputForm" onSubmit="addMeeting(); return false;" hidden>
		Date : <input type="text" name="date" id="inputDate" value="01/01/2021"/><br>
		Notes : <input type="text" name="notes" id="inputNotes" value="We chatted"/><br>
		Time : <input type="text" name="notes" id="inputTime" value="9:00"/><br>
		
		<input type="submit" value="Add Meeting"/>
		<input type="button" value="Cancel" onClick="cancelAddMeeting()"/>
	</form>
<button onclick="addMeetingFunction()" id="addMeetingButton">Add Meeting</button>
<button onclick="deleteMeetingFunction()" id="deleteMeetingButton">Delete Meeting</button>

<table class="student_fixed_header" id="student-table2" width="100%">
	<caption id="HeadersRow">Students with fixed Column Header Row</caption>
	<thead>
    	<tr>
      		<th class="FirstNameCol">First Name</th>
      		<th class="LastNameCol">Last Name</th>
			<th class="DOBCol">DOB</th>
      		<th class="GradeCol">Grade</th>
      		<th class="StatusCol">Status</th>
      		<th class="StudentIdCol">ID</th>
      		<th class="FuntionCol">Function</th>
    	</tr>
  	</thead>
  	<tbody>
  	</tbody>
</table>

<table class="gt" id="calendar-table2" width="100%">
	<caption id="HeadersRow">Meetings with fixed Column Header Row</caption>
	<thead>
    	<tr>
    		<th></th>
      		<th>Monday</th>
			<th>Tuesday</th>
			<th>Wednesday</th>
      		<th>Thursday</th>
      		<th>Friday</th>
      		<th></th>
    	</tr>
    	<tr>
    		<th>Time</th>
      		<th id = "WD1">TBD</th>
			<th id = "WD2">TBD</th>
			<th id = "WD3">TBD</th>
      		<th id = "WD4">TBD</th>
      		<th id = "WD5">TBD</th>
      		<th>Function</th>
    	</tr>
    	
  	</thead>
  	<tbody>
  	</tbody>
</table>

<h2>Calendar Data</h2>
	<table id="calendar-table" class="table-layout" style="width: 100%" border='1'>
	<tr>
    <th>Monday</th>
    <th>Tuesday</th>
    <th>Wednesday</th>
    <th>Thursday</th>
    <th>Friday</th>
  </tr>
  <tr>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>4</td>
    <td>5</td>
  </tr>
	</table>


<script>
	var studentDataObject;
	var selectedStudentId, selectedMessageId;
	var studentKeys = [];

	//This is a test space for any and everything
	function testFunction()
	{
		console.log("test function");
		loadStudentTable2();
		//console.log("test function studentDataObject:" + studentDataObject);
		//console.log("test function selectedStudentObject:" + selectedStudentId);
		//console.log('Students loaded:' + studentsLoaded() );
		//console.log('Student selected:' + studentSelected() );
		//console.log('Student meetings:' + currentStudentHasMeetings() );
		//console.log('Student meetings:' + JSON.stringify( studentDataObject ) );
		//var week_number = 0 | new Date().getDate() / 7;
		//console.log('Week number:' + week_number );
		//console.log('Week number:' + new Date().getDate() );
		//console.log('Week number:' + new Date().getDate() /7 );
		
		//var currentDate = new Date();
		//var firstDayOfMonth = new Date( currentDate.getFullYear(), currentDate.getMonth(), 1 );
		//var firstWeekday = firstDayOfMonth.getDay();
		//console.log('Week number1:' + currentDate );
		//console.log('Week number2:' + firstDayOfMonth );
		//console.log('Week number3:' + firstWeekday );
		//console.log('Week getDate:' + currentDate.getDate() );
		//console.log('Week getDay:' + currentDate.getDay() );
		//var d = new Date(2021, 0, 17);
		//console.log('Week getDate Object:' + d );
		//console.log('Week getDate:' + d.getDate() );
		//console.log('Week getDay:' + d.getDay() );
		//console.log('Week getDay:' + dateFormatter(new Date()) );
		//console.log('COMP:' + compareTimes( "9:30 AM", "9:30 PM") );
		//console.log('COMP:' + compareTimes( "9:30 PM", "9:30 AM") );
		//console.log('COMP:' + compareTimes( "9:00 AM", "9:30 AM") );
	}

	startFunction();
	function startFunction() {
		console.log("Start function:");
		console.log("parsed json file:" + name);
		studentDataObject = JSON.parse(JSON.stringify(${dataJson}));
		console.log("parsed json file:" + studentDataObject.students.length);
		loadStudentTable2();
		loadCalendarTable2()
	}
	
	function loadStudentTable2() {
		if ( !studentsLoaded()) {
			console.log('No students!' + studentDataObject);
			alert("Must add student(s)");
			return false;
		}
		console.log("Load student table:" + studentDataObject.students.length);

		var tbodyRef = document.getElementById("student-table2").getElementsByTagName('tbody')[0];
		for( var x = 0; x < studentDataObject.students.length; x++)
		{
			var y = tbodyRef.insertRow();
			y.insertCell(0).innerHTML = studentDataObject.students[x].firstName;
			y.insertCell(1).innerHTML = studentDataObject.students[x].lastName;
			y.insertCell(2).innerHTML = studentDataObject.students[x].dob;
			y.insertCell(3).innerHTML = studentDataObject.students[x].grade;
			y.insertCell(4).innerHTML = studentDataObject.students[x].status;
			y.insertCell(5).innerHTML = studentDataObject.students[x].id;
			var id = studentDataObject.students[x].id;
			var btnTxt = "<button value=\"Delete\" id=\"removeFrom\" onclick=\"deleteRow(" + id + ");\" >Delete</button>"
			btnTxt += "<button value=\"Update\" id=\"updateTo\" onclick=\"updateRow(" + id + ");\" >Update</button>";
			btnTxt += "<button value=\"Review\" id=\"reviewStudent\" onclick=\"reviewStudent(" + id + ");\" >Review</button>";
			y.insertCell(6).innerHTML = btnTxt;
		}
	}

	
	
	function getDate() 
	{
		  var today = new Date();
		  console.log("DF:" + dateFormatter(today) );
		  document.getElementById("dateInput").value = dateFormatter(today);
	}
	window.onload = function() 
	{
		var today = new Date();
		var mnth = today.getMonth() + 1;
		var dVal = today.getDate();
		if( dVal < 10)
			dVal = '0' + dVal;
		var mVal = today.getMonth() + 1;
		if( mVal < 10)
			mVal = '0' + mVal;
		document.getElementById("dateInput").value = today.getFullYear() + "-" + mVal + "-" + dVal;
		setCalendarDates();
	}
	function studentsLoaded()
	{
		if (typeof studentDataObject !== "undefined" )
			return true;
		return false;

	}
	function studentSelected()
	{
		if (studentsLoaded() && typeof selectedStudentId !== "undefined" && selectedStudentId > -1 )
			return true;
		return false;
	}
	function currentStudentHasMeetings()
	{
		if ( studentSelected() && studentDataObject.students[selectedStudentId].meetings !== undefined)
			return true;
		return false;
	}
	function aStudentHasMeetings()
	{
		var aStudent = arguments[0];
		if ( aStudent.meetings !== undefined)
			return true;
		return false;
	}
	

	function dateFormatter()
	{
		var dateStr = "p";
		var dt = arguments[0];
		//console.log('Format Date:' + dt.toDateString());
		var mnth = dt.getMonth() + 1;
		var dVal = dt.getDate();
		if( dVal < 10)
			dVal = '0' + dVal;
		var mVal = dt.getMonth() + 1;
		if( mVal < 10)
			mVal = '0' + mVal;
		dateStr = mVal + "/" + dVal + "/" + dt.getFullYear();
		console.log('dateStr:' + dateStr);
		return dateStr;
	}

	function setCalendarDates()
	{
		//var dateIn = document.getElementById('dateInput').value;
		//console.log('dateIn:' + document.getElementById('dateInput').value );
		var tmpDate = new Date(document.getElementById('dateInput').value);
		var dateObject = new Date ( tmpDate.getTime() - tmpDate.getTimezoneOffset() * -60000 );
		var dateDiff = dateObject.getDate() - dateObject.getDay() + (dateObject.getDay() === 0 ? -6 : 1);
		var nd1 = new Date(dateObject.setDate(dateDiff));
		var myTable = document.getElementById('calendar-table');
		document.getElementById('WD1').innerHTML = dateFormatter(nd1);
		myTable.rows[1].cells[0].innerHTML = dateFormatter(nd1);//.toDateString();
		nd1.setDate(nd1.getDate() + 1);
		document.getElementById('WD2').innerHTML = dateFormatter(nd1);
		myTable.rows[1].cells[1].innerHTML = dateFormatter(nd1);
		nd1.setDate(nd1.getDate() + 1); 
		document.getElementById('WD3').innerHTML = dateFormatter(nd1);
		myTable.rows[1].cells[2].innerHTML = dateFormatter(nd1);
		nd1.setDate(nd1.getDate() + 1);
		document.getElementById('WD4').innerHTML = dateFormatter(nd1);
		myTable.rows[1].cells[3].innerHTML = dateFormatter(nd1);
		nd1.setDate(nd1.getDate() + 1);
		document.getElementById('WD5').innerHTML = dateFormatter(nd1);
		myTable.rows[1].cells[4].innerHTML = dateFormatter(nd1);
		if( studentsLoaded() )
			loadCalendarTable2();
	}
	function equalDates()
	{
		//console.log('CompareDates:' + arguments[0] + ":" + arguments[1] );
		var startDt = arguments[0];
		var endDt = arguments[1];
		if( arguments.length == 2 )
		{
			if( new Date(startDt).getTime() == new Date(endDt).getTime() )
				return true;
		}
		return false;
		
	}

	function compareDates()
	{
		//console.log('CompareDates:' + arguments[0] + ":" + arguments[1] );
		var startDt = arguments[0];
		var endDt = arguments[1];
		if( arguments.length == 2 )
		{
			if( new Date(startDt).getTime() <= new Date(testDt).getTime() )
				return true;
			return false;
		}
		var testDt = arguments[2];
		if( ( new Date(startDt).getTime() <= new Date(testDt).getTime() ) &&
				( new Date(testDt).getTime() <= new Date(endDt).getTime() ) )
	    {
	    	return true;
	    }
	    return false;
		
	}
	function loadCalendarTable2()
	{
		var calendarTable = document.getElementById('calendar-table2');
		var startDate = calendarTable.rows.item(1).cells.item(1).innerHTML;
		var endDate = calendarTable.rows.item(1).cells.item(5).innerHTML;
		console.log("Dates:" + startDate + ":" + endDate );
		var d0 = calendarTable.rows.item(1).cells.item(1).innerHTML;
		var d1 = calendarTable.rows.item(1).cells.item(2).innerHTML;
		var d2 = calendarTable.rows.item(1).cells.item(3).innerHTML;
		var d3 = calendarTable.rows.item(1).cells.item(4).innerHTML;
		var d4 = calendarTable.rows.item(1).cells.item(5).innerHTML;
		
		var weeksMeetings = JSON.stringify({
			meetings : []
		});
		var weeksMeetingObject = JSON.parse( weeksMeetings );

		var dateStrings = JSON.stringify({
			dates : []
		});
		var dateStringsObject = JSON.parse( dateStrings );
		for( var x = 0; x < 5; x++)
		{
			dateStringsObject.dates.push(calendarTable.rows.item(1).cells.item(x +1).innerHTML);
		}
		
		var dateStrings = [
			calendarTable.rows.item(1).cells.item(1).innerHTML,
			calendarTable.rows.item(1).cells.item(2).innerHTML,
			calendarTable.rows.item(1).cells.item(3).innerHTML,
			calendarTable.rows.item(1).cells.item(4).innerHTML,
			calendarTable.rows.item(1).cells.item(5).innerHTML];
		

		console.log("Student meetings:" + studentDataObject.meetings.length);

		//alert("Stop");
		//Now get the meetings that apply to the date range
		for (i in studentDataObject.meetings) {
			{
				date = studentDataObject.meetings[i].date
				time = studentDataObject.meetings[i].time
				//Check the date before adding
				if(compareDates( startDate, endDate, date))
				{
					console.log("Adding:" + date + ":" + time + ":" + weeksMeetingObject.meetings.length);
					weeksMeetingObject.meetings.push(studentDataObject.meetings[i]);
				}
			}
		}
		console.log("weeksMeetings:" + weeksMeetingObject.meetings.length);
		//Need to add rows to table
		var currentLength = document.getElementById("calendar-table2").rows.length;
		console.log("currentLength:" + currentLength );
		for ( x = currentLength; x > 2; x-- ) 
		{
			console.log("Delete row:" + (x - 1) );
			calendarTable.deleteRow( x - 1);
		}
		
		currentLength = document.getElementById("calendar-table2").rows.length;
		console.log("currentLength:" + currentLength );
		//return;
		//Need to go from 8 to 16
		var timeSlots = 38;
		for( var x = 8; x < 17; x++ )
		{
			var amVal = " AM";
			var pmVal = " PM";
			var timeText = "09:00 AM";
			var hrVal = x;
			if( hrVal > 12 )
				hrVal = x - 12;
			if( hrVal < 10 )
				hrVal = "0" + hrVal;
			//console.log("Adding row:" + x + ":" + hrVal);
			var hrSegs = [ "00", "15", "30", "45"];
			for( var y = 0; y < hrSegs.length; y++ )
			{
				var tVal = "";
				if( x >= 12 )
					timeValueMatch = hrVal + ":" + hrSegs[y] + pmVal;
				else
					timeValueMatch = hrVal + ":" + hrSegs[y] + amVal;
				//console.log("Adding row:" + x + ":" + timeValueMatch);
				var newRow = calendarTable.insertRow(-1);//Add row
				var newCell = newRow.insertCell(0);//Add cell for time 
				newCell.innerHTML = timeValueMatch;
				//Now add cells for the rest of columns 
				for( var z = 1; z < 6; z++)
					var newCell = newRow.insertCell(z);
					
				var id = weeksMeetingObject.meetings.find( record => record.time === timeValueMatch);
				while (typeof id !== "undefined")
				{	
					//Load row
					{
						id.studentIDs.length
						

						var dtIndex = dateStrings.indexOf(id.date) + 1;
						var studentNameStr = id.code + ":";
						for(var z = 0; z < id.studentIDs.length; z++)
						{
							var studentMatch = studentDataObject.students.find( record => record.id === Number(id.studentIDs[z]));
							studentNameStr += studentMatch.lastName + ":";
						}
						for(var z = 0; z < id.adminList.length; z++)
						{
							studentNameStr += id.adminList[z];
						}

						console.log('Match?' + id.time + ":" + id.date + ":" + timeValueMatch + ":" + dtIndex + ":" + studentNameStr + ":" + id.studentIDs.length);
						//calendarTable.rows[2].cells[1].rowSpan=2;
						newRow.cells[dtIndex].rowSpan=id.timePeriods;
						newRow.cells[dtIndex].innerHTML = studentNameStr;

					}
					removeNode( weeksMeetingObject, id.id);
					id = weeksMeetingObject.meetings.find( record => record.time === timeValueMatch);
				}
			}//For each 15 minute period
		}//For each hour
		console.log("weeksMeetings:" + weeksMeetingObject.meetings.length);
		highlight_calendar_row()
		return;
	}
	
	function highlight_calendar_row() {
		var table = document.getElementById('calendar-table2');
		var cells = table.getElementsByTagName('td');
		for (var i = 0; i < cells.length; i++) {
			// Take each cell
			var cell = cells[i];
			// do something on onclick event for cell
			cell.onclick = function() {
				// Get the row id where the cell exists
				var rowId = this.parentNode.rowIndex;
				var cellId = this.cellIndex;
				console.log('Selected rowId: ' + rowId + ":" + cellId);
				if (rowId == 0) {
					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 0; row < rowsNotSelected.length; row++) {
						console.log('clean1');
						rowsNotSelected[row].style.backgroundColor = "";
						rowsNotSelected[row].classList.remove('selected');
					}
				} else {
					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 0; row < rowsNotSelected.length; row++) {
						console.log('clean2');
						var cellLength = table.rows[row].cells.length;
						for (var cell = 0; cell < cellLength; cell++) {
							var cellNotSelected = table.rows.item(row).cells.item(cell);
							cellNotSelected.style.backgroundColor = "";
							cellNotSelected.classList.remove('selected');
						}
					}
					//calendarTable.rows.item(1).cells.item(5).innerHTML];
					var cellSelected = table.rows.item(rowId).cells.item(cellId);
					cellSelected.style.backgroundColor = "yellow";
					cellSelected.className += " selected";
					//loadMeetingTable();
				}
			}
		}
	}


	//Returns true is t1 is less than t2
	function compareTimes()
	{
		//9:30 AM
		console.log("COMP:" + arguments[0] + ":" + arguments[1] );
		var t1 = arguments[0].split(" ");
		var t2 = arguments[1].split(" ");
		var res1 = t1[0].split(":");
		var res2 = t2[0].split(":");
		var n1 = parseInt(res1[0])*100 + parseInt(res1[1]);
		var n2 = parseInt(res2[0])*100 + parseInt(res2[1]);
		var string1 = "PM";
		if( string1.localeCompare(t1[1]) == 0 )
			n1 += 1200;
		if( string1.localeCompare(t2[1]) == 0 )
			n2 += 1200;
		if( n1 < n2 )
			return true;
		return false;
	}

	//Returns true is t1 is less than t2
	function calculateTime()
	{
		//9:30 AM
		console.log("CALC:" + arguments[0] );
		var t1 = arguments[0].split(" ");
		var res1 = t1[0].split(":");
		var n1 = parseInt(res1[0])*100 + parseInt(res1[1]);
		var string1 = "PM";
		if( string1.localeCompare(t1[1]) == 0 )
			n1 += 1200;
		return n1;
	}

	
	//Need column index
	//Meetings object
	//Calendar Table
	function insertCalendarCells()
	{
		var cellIndex = arguments[0];
		var aMeetingObject = arguments[1];
		var calendarTable = arguments[2];
		var dateMatchValue = arguments[3];
		var rowCount = calendarTable.rows.length;
		console.log('Table Ct:' + rowCount);
		for( var x = 2; x < rowCount; x++ )
		{
			//console.log('Table Ct:' + x);
			var timeValueMatch = calendarTable.rows[x].cells[0].innerHTML
			//console.log('Table Ct:' + timeValueMatch + ":" + dateMatchValue)
			var id = aMeetingObject.meetings.find( record => record.time === timeValueMatch);
			if (typeof id !== "undefined")
			{	
				//console.log('Match?' + id.date + ":" + dateMatchValue);
				
				if( id.date == dateMatchValue)
					console.log('Match!!!' + id.time + ":" + id.date + ":" + id.id + ":" + id.studentId);
				var studentMatch = studentDataObject.students.find( record => record.id === Number(id.studentId));
				if (typeof studentMatch !== "undefined")
				{
					removeNode( aMeetingObject, id.id);
					var newText = studentMatch.lastName + "|" + id.code;
					var cell = calendarTable.rows[x].cells[cellIndex];
					cell.rowSpan = "2";
					cell.innerHTML = newText;
					console.log('SPAN!!!' + cell.rowSpan );
					//document.getElementById("myTd").rowSpan = "1";
				}
			}

			//console.log('Meetings:' + aMeetingObject.meetings.length);
			//var newText = aMeetingObject[objectIndex].time + ":" + aMeetingObject[objectIndex].studentName;

		}
	}
	function removeNode( data, id){
		data.meetings.forEach(function(e, index){
	    if(id == e.id){
	    	data.meetings.splice(index, 1);
	    }
	  })
	}
	function insertCalendarCells2()
	{//insertCalendarCells( meetingObject[d0], 0, calendarTable, currentLength, timeSlots);
	//		insertCalendarCells2( meetingObject[d0], 0, calendarTable, currentLength, timeSlots);

		var aMeetingObject = arguments[0];
		var columnIndex = arguments[1];
		var calendarTable = arguments[2];
		var currentLength = arguments[3];
		var timeSlots = arguments[4];
		console.log("Insert Meeting data for row:" + columnIndex + ":" + aMeetingObject.length );
		for( var x = currentLength; x < timeSlots; x++ )
		{
			//First what is the time slot
			var slotVal = calendarTable.rows[x].cells[0].innerHTML;
			//console.log("Slot:" + ":" + slotVal);
			var id = aMeetingObject.find( record => record.time === slotVal);
			if (typeof id !== "undefined")
			{
				console.log("Found Slot:" + ":" + id.time);
				console.log("Found Slot:" + ":" + id.studentId);
				var studentM = studentDataObject.students.find( record => record.id === Number(id.studentId));
				console.log("Found Student:" + ":" + studentM.lastName);
				calendarTable.rows[x].cells[columnIndex].innerHTML = studentM.lastName;
			}
				

			
			
			//for( var y = 0; y < aMeetingObject.length; y++ )
			//{
			//	var meeting = aMeetingObject[y];
			//	var newText = aMeetingObject[y].date + ":" + aMeetingObject[y].time;
			//	var slotVal = calendarTable.rows[x].cells[0].innerHTML;
			//	var tVal = aMeetingObject[y].time;
			//	console.log("Slot val!!!:" + slotVal + ":" + tVal + ":" + slotVal.localeCompare(tVal) );
			//	if( slotVal.localeCompare(tVal) == 0 )
			//	{
			//		console.log("Slot val!!!:" + slotVal + ":" + tVal + ":");
			//		calendarTable.rows[x].cells[columnIndex].innerHTML = "filled";
			//	}
			//	console.log("Slotted");
			//}
			
		}
	}

	
	function handleFileSelect(evt) {
		console.log("handle a file");
		var files = evt.target.files; // FileList object
		// Loop through the FileList and read as text
		for (var i = 0, f; f = files[i]; i++) {
			console.log("handle file:" + i + ":" + f.type);
			var fr = new FileReader();
			fr.onload = function() {
				console.log("fr.result:" + fr.result);
				//parseJSONFile(fr.result);
				studentDataObject = JSON.parse(fr.result);
				console.log("parsed json file:");
				//loadStudentTable();
			}
			fr.readAsText(f);
		}
	}
	document.getElementById('files').addEventListener('change',
			handleFileSelect, false);

	function loadStudentTable() {
		console.log("Load student table:" + studentDataObject.students.length);
		document.getElementById("student-table").innerHTML = "";
		//First set headers
		//Get keys for headers
		for ( var key in studentDataObject.students[0]) {
			if (Array.isArray(studentDataObject.students[0][key])) {
				console.log("key array!!!!!!!!" + key);
				continue;
			}
			if (studentKeys.indexOf(key) === -1) {
				console.log("push:" + key);
				studentKeys.push(key);
			}
		}
		//Finished getting headers
		console.log("Headers length:" + studentKeys.length);
		console.log("Add headers:" + studentKeys.length);
		var table = document.getElementById("student-table");
		var header = table.createTHead();
		var row = header.insertRow(0);
		for (var i = 0; i < studentKeys.length; i++) {
			var cell = row.insertCell(i);
			cell.innerHTML = studentKeys[i].toUpperCase();
		}
		console.log("Added headers:" + studentKeys.length);
		//Now add students
		console.log("studentDataObject.students.length:"
				+ studentDataObject.students.length);
		for (var r = 0; r < studentDataObject.students.length; r++) {
			var x = document.getElementById('student-table').insertRow(r + 1);//Need to add offset for header
			for (var c = 0; c < studentKeys.length; c++) {
				var y = x.insertCell(c);
				y.innerHTML = studentDataObject.students[r][studentKeys[c]];
			}
		}
		highlight_student_row();
	}

	function highlight_student_row() {
		var table = document.getElementById('student-table');
		var cells = table.getElementsByTagName('td');
		for (var i = 0; i < cells.length; i++) {
			// Take each cell
			var cell = cells[i];
			// do something on onclick event for cell
			cell.onclick = function() {
				// Get the row id where the cell exists
				var rowId = this.parentNode.rowIndex;
				if (rowId == 0) {
					console.log('Selected rowId: ' + rowId);
					selectedStudentId = -1;
					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 0; row < rowsNotSelected.length; row++) {
						rowsNotSelected[row].style.backgroundColor = "";
						rowsNotSelected[row].classList.remove('selected');
					}
				} else {
					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 0; row < rowsNotSelected.length; row++) {
						rowsNotSelected[row].style.backgroundColor = "";
						rowsNotSelected[row].classList.remove('selected');
					}
					var rowSelected = table.getElementsByTagName('tr')[rowId];
					rowSelected.style.backgroundColor = "yellow";
					rowSelected.className += " selected";
					selectedStudentId = rowId - 1;//Decrement 1 for header row
					//loadMeetingTable();
				}
				loadMeetingTable();
			}
		}
	}

	function highlight_meeting_row() {
		var table = document.getElementById('meeting-table');
		var cells = table.getElementsByTagName('td');
		for (var i = 0; i < cells.length; i++) {
			// Take each cell
			var cell = cells[i];
			// do something on onclick event for cell
			cell.onclick = function() {
				// Get the row id where the cell exists
				var rowId = this.parentNode.rowIndex;
				if (rowId == 0) {
					console.log('Selected rowId: ' + rowId);
					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 0; row < rowsNotSelected.length; row++) {
						rowsNotSelected[row].style.backgroundColor = "";
						rowsNotSelected[row].classList.remove('selected');
					}
				} else {
					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 0; row < rowsNotSelected.length; row++) {
						rowsNotSelected[row].style.backgroundColor = "";
						rowsNotSelected[row].classList.remove('selected');
					}
					var rowSelected = table.getElementsByTagName('tr')[rowId];
					rowSelected.style.backgroundColor = "yellow";
					rowSelected.className += " selected";
					selectedMessageId = rowId - 1;//Decrement 1 for header row
					console.log('The id of the selected meeting is: ' + rowId);
				}
			}
		}
	}

	function clearMeetingTable() {
		document.getElementById("meeting-table").innerHTML = "";
	}
	function loadMeetingTable() {
		console.log('Update the meeting table: ' + studentSelected() );
		clearMeetingTable();
		if ( !studentSelected() ) {
			console.log('Cannot Update the meeting table as there is no student selected: ');
			return false;
		}
		if ( !currentStudentHasMeetings() ) {
			console.log('Cannot Update the meeting table as there are no meetings: ');
			return false;
		}

		console.log('Update the meeting table meetings: ' + studentDataObject.students[selectedStudentId].meetings.length);
		if (typeof selectedStudentId === "undefined"
				|| selectedStudentId === null) {
			console.log('Cant find the student: ' + selectedStudentId);
		} else {

			//Get keys for headers
			var col = [];
			for ( var key in studentDataObject.students[selectedStudentId]["meetings"][0]) {
				if (Array
						.isArray(studentDataObject.students[selectedStudentId]["meetings"][key])) {
					console.log("key array!!!!!!!!" + key);
					continue;
				}
				if (col.indexOf(key) === -1) {
					col.push(key);
				}
			}
			console.log("keys:" + col.length);
			//Now populate student table
			//First set headers
			//Add headers
			console.log("Add headers:" + col.length);
			var table = document.getElementById("meeting-table");
			var header = table.createTHead();
			var row = header.insertRow(0);
			for (var i = 0; i < col.length; i++) {

				var cell = row.insertCell(i);
				cell.innerHTML = col[i].toUpperCase();
			}
			//Now add meetings
			for (var r = 0; r < studentDataObject.students[selectedStudentId].meetings.length; r++) {
				var x = document.getElementById('meeting-table').insertRow(
						r + 1);//Need to add offset for header
				for (var c = 0; c < col.length; c++) {
					var y = x.insertCell(c);
					y.innerHTML = studentDataObject.students[selectedStudentId].meetings[r][col[c]];
				}
			}
			highlight_meeting_row();
		}
	}

	function deleteStudentFunction() {
		console.log('Delete a student: ' + selectedStudentId);
		if (typeof selectedStudentId === "undefined"
				|| selectedStudentId === null) {
			console.log('Cant Delete a student: ' + selectedStudentId);
		} else {
			console.log('Delete a student: ' + selectedStudentId);
			console.log('Delete a student: '
					+ studentDataObject.students.length);
			studentDataObject.students.splice(selectedStudentId, 1);
			console.log('Delete a student: '
					+ studentDataObject.students.length);
			selectedStudentId = null;
			loadStudentTable();
			clearMeetingTable();
		}
	}
	function deleteMeetingFunction() {
		console.log('Delete a student\'s meeting: ' + selectedStudentId);
		if ((typeof selectedStudentId === "undefined" || selectedStudentId === null)
				|| (typeof selectedMessageId === "undefined" || selectedMessageId === null)) {
			console.log('Cant Delete a student\'s meeting: '
					+ selectedStudentId);
		} else {
			console.log('Delete meeting from a student: ' + selectedStudentId);
			console.log('Delete this meeting student: ' + selectedMessageId);
			console
					.log('student meetings: '
							+ studentDataObject.students[selectedStudentId].meetings.length);
			studentDataObject.students[selectedStudentId].meetings.splice(
					selectedMessageId, 1);
			console
					.log('student meetings: '
							+ studentDataObject.students[selectedStudentId].meetings.length);
			selectedMessageId = null;
			loadStudentTable();
			loadMeetingTable();
		}
	}
	function addStudentFunction() {
		console.log('Add a student:');
		document.getElementById('studentInputForm').hidden = false;
		document.getElementById('addStudentButton').hidden = true;
		document.getElementById('deleteStudentButton').hidden = true;
	}
	function cancelAdd()
	{
		document.getElementById('studentInputForm').reset;
		document.getElementById('studentInputForm').hidden = true;
		document.getElementById('addStudentButton').hidden = false;
		document.getElementById('deleteStudentButton').hidden = false;
	}
	function addStudent() {
		console.log('Adding a student:' + arguments[0]);

		//Check to see if the JSON object has been created
		if ( !studentsLoaded() ) {
			//if ( true	) {
			console.log('No student!' + studentDataObject);
			studentDataObject = JSON.parse(JSON.stringify({
				"student" : []
			}));
		}
		//Now we can add the student
		var name = document.getElementById('studentInputForm').elements['inputName'].value;
		var id = document.getElementById('studentInputForm').elements['inputId'].value;
		var dob = document.getElementById('studentInputForm').elements['inputDOB'].value;
		var status = document.getElementById('studentInputForm').elements['inputStatus'].value;
		var grade = document.getElementById('studentInputForm').elements['inputGrade'].value;
		//Validate we do not have a duplicate ID
		for (i in studentDataObject.students) {
			console.log("The ID:" + studentDataObject.students[i].id + ":" + i);
			if( id == studentDataObject.students[i].id)
			{
				alert("This student ID is a duplicate and cannot be added:" + id);
				return false;
			}
		}
		var tmpStudent = JSON.stringify({
			"name" : name,
			"id" : id,
			"dob" : dob,
			"status" : status,
			"grade" : grade
		});
		console.log("JSON:" + tmpStudent);
		studentDataObject.students.push(JSON.parse(tmpStudent));
		console.log("JSON2:" + studentDataObject.students.length);
		console.log('Now students!!!!'
				+ JSON.stringify(studentDataObject, null, 1));
		loadStudentTable();
		cancelAdd();
	}
	function cancelAddMeeting()
	{
		document.getElementById('meetingInputForm').reset;
		document.getElementById('meetingInputForm').hidden = true;
		document.getElementById('addMeetingButton').hidden = false;
		document.getElementById('deleteMeetingButton').hidden = false;
	}

	function addMeetingFunction() {
		console.log('Add a Meeting:');
		//First confirm that there are students and one has been selected
		if ( !studentsLoaded() || !studentSelected()) {
			console.log('No student!' + studentDataObject);
			alert("Must add student(s) and select one prior to adding meetings");
		}
		else
		{
			document.getElementById('meetingInputForm').hidden = false;
			document.getElementById('addMeetingButton').hidden = true;
			document.getElementById('deleteMeetingButton').hidden = true;
		}
	}
	function addMeeting() {
		console.log('Adding a meeting:' + arguments[0]);
		console.log('Adding a meeting?' + currentStudentHasMeetings());
		//Check to see if the student has any meetings
		if ( !currentStudentHasMeetings() ) {
			console.log('No student meetings!');
			studentDataObject.students[selectedStudentId]['meetings'] = [];
		}
		console.log('Adding a meeting?' + currentStudentHasMeetings());
		//console.log('Adding a meeting?' + studentDataObject.students[selectedStudentId].meetings.length);

		//Now we can add the student
		var date = document.getElementById('meetingInputForm').elements['inputDate'].value;
		var notes = document.getElementById('meetingInputForm').elements['inputNotes'].value;
		var time = document.getElementById('meetingInputForm').elements['inputTime'].value;

		var tmpMeeting = JSON.stringify({
			"date" : date,
			"time" : time,
			"notes" : notes
		});
		console.log("JSON:" + tmpMeeting);
		studentDataObject.students[selectedStudentId].meetings.push(JSON.parse(tmpMeeting));
		console.log("meetings length:" + studentDataObject.students[selectedStudentId].meetings.length);
		//alert("Stop");
		loadMeetingTable();
		cancelAddMeeting();
	}
</script>
<script>
</script>
	<script>
	if (window.File && window.FileReader && window.FileList && window.Blob) {
		  // Great success! All the File APIs are supported.
		  //alert("Good to go!!!");
		} else {
		  alert('The File APIs are not fully supported in this browser.');
		}
	</script>
</body>
</html>