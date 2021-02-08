<html>

<head>
<link rel="stylesheet" href="mystyle.css">

<title>Student Meeting Recorder</title>
</head>

<body>


	Set Calendar Dates:<input type="date" id="dateInput" onChange=setCalendarDates()><br>
	<button onclick="testFunction()" id="testButton">test button</button>

	<div id="result"></div>
	<button onclick="memoryFunction()" id="addButton">Add Student</button>
	<div id="memSpace"></div>
	

<input type="file" id="files" name="files[]" multiple />
<output id="list"></output>

<p id="demo6"></p>

<h2>Student Data</h2>
	<table id="student-table" class="table-layout" style="width: 100%" border='1'>
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
	<table id="meeting-table" class="table-layout" style="width: 100%" border='1'>
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
		if ( studentSelected() && studentDataObject.student[selectedStudentId].meetings !== undefined)
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
	

	//This is a test space for any and everything
	function testFunction()
	{
		console.log("test function");
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
		//loadCalendarTable();
		console.log('COMP:' + compareTimes( "9:30 AM", "9:30 PM") );
		console.log('COMP:' + compareTimes( "9:30 PM", "9:30 AM") );
		console.log('COMP:' + compareTimes( "9:00 AM", "9:30 AM") );

		//dar();

		//for (i in studentDataObject.student) {
		//	console.log("The ID:" + studentDataObject.student[i].id + ":" + i);
		//}

		//console.log('The id of the student is: ' + studentDataObject.student[1].name );


	}
	function dateFormatter()
	{
		var dateStr = "p";
		var dt = arguments[0];
		console.log('Format Date:' + dt.toDateString());
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
		console.log('dateIn:' + document.getElementById('dateInput').value );
		var tmpDate = new Date(document.getElementById('dateInput').value);
		var dateObject = new Date ( tmpDate.getTime() - tmpDate.getTimezoneOffset() * -60000 );
		var dateDiff = dateObject.getDate() - dateObject.getDay() + (dateObject.getDay() === 0 ? -6 : 1);
		var nd1 = new Date(dateObject.setDate(dateDiff));
		var myTable = document.getElementById('calendar-table');
		myTable.rows[1].cells[0].innerHTML = dateFormatter(nd1);//.toDateString();
		nd1.setDate(nd1.getDate() + 1);
		myTable.rows[1].cells[1].innerHTML = dateFormatter(nd1);
		nd1.setDate(nd1.getDate() + 1); 
		myTable.rows[1].cells[2].innerHTML = dateFormatter(nd1);
		nd1.setDate(nd1.getDate() + 1); 
		myTable.rows[1].cells[3].innerHTML = dateFormatter(nd1);
		nd1.setDate(nd1.getDate() + 1); 
		myTable.rows[1].cells[4].innerHTML = dateFormatter(nd1);
		if( studentsLoaded() )
			loadCalendarTable();
	}
	function compareDates()
	{
		//console.log('CompareDates:' + arguments.length);
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
	function loadCalendarTable()
	{
		var calendarTable = document.getElementById('calendar-table');
		var startDate = calendarTable.rows.item(1).cells.item(0).innerHTML;
		var endDate = calendarTable.rows.item(1).cells.item(4).innerHTML;
		console.log("Dates:" + startDate + ":" + endDate );
		var d0 = calendarTable.rows.item(1).cells.item(0).innerHTML;
		var d1 = calendarTable.rows.item(1).cells.item(1).innerHTML;
		var d2 = calendarTable.rows.item(1).cells.item(2).innerHTML;
		var d3 = calendarTable.rows.item(1).cells.item(3).innerHTML;
		var d4 = calendarTable.rows.item(1).cells.item(4).innerHTML;
		var tmpMtgs = JSON.stringify({
			[d0] : [],
			[d1] : [],
			[d2] : [],
			[d3] : [],
			[d4] : []
		});
		console.log("tmpMtgs:!!!" + tmpMtgs );
		var meetingObject = JSON.parse( tmpMtgs );
		console.log("meetingObject:" + meetingObject);
		console.log("meetingObject:" + meetingObject[d0].length);
		//alert("Stop");

		for (i in studentDataObject.student) {
			//console.log("The ID:" + studentDataObject.student[i].id + ":" + i);
			//console.log("Has Meeetings:" + aStudentHasMeetings(studentDataObject.student[i]) );
			if( aStudentHasMeetings(studentDataObject.student[i]) )
			{
				var date, name, time;
				for (var r = 0; r < studentDataObject.student[i].meetings.length; r++) 
				{
					name = studentDataObject.student[i].name;
					date = studentDataObject.student[i].meetings[r].date
					time = studentDataObject.student[i].meetings[r].time
					//Check the date before adding
					if(compareDates( startDate, endDate, date))
					{
						var tmpMeeting = JSON.stringify({
							"date" : date,
							"studentName" : name,
							"time" : time,
						});
						console.log("JSON:" + tmpMeeting);
						meetingObject[date].push(JSON.parse(tmpMeeting));
					}
				}
			}
		}
		console.log("meetingObject0:" + meetingObject[d0].length);
		console.log("meetingObject1:" + meetingObject[d1].length);
		console.log("meetingObject2:" + meetingObject[d2].length);
		console.log("meetingObject3:" + meetingObject[d3].length);
		console.log("meetingObject4:" + meetingObject[d4].length);
		
		//alert("Stop2");
		var maxCt = Math.max( meetingObject[d0].length, meetingObject[d1].length, meetingObject[d2].length, 
				meetingObject[d3].length, meetingObject[d4].length );
		console.log("maxCt:" + maxCt);
		//Need to add rows to table
		var currentLength = document.getElementById("calendar-table").rows.length;
		console.log("currentLength:" + currentLength );
		for ( x = currentLength; x > 2; x-- ) 
		{
			console.log("Delete row:" + (x - 1) );
			calendarTable.deleteRow( x - 1);
		}
		currentLength = document.getElementById("calendar-table").rows.length;
		//alert("Stop3");
		sortMeetingObject(meetingObject[d0]);
		for( var x = currentLength; x < maxCt + currentLength; x++ )
		{
			console.log("Adding row:" + x );
			var newRow = calendarTable.insertRow(x);
			for( var z = 0; z < 5; z++)
			{
				newRow.insertCell(z);
			}
			insertCalendarCells( x, meetingObject[d0], 0, calendarTable, currentLength);
			insertCalendarCells( x, meetingObject[d1], 1, calendarTable, currentLength);
			insertCalendarCells( x, meetingObject[d2], 2, calendarTable, currentLength);
			insertCalendarCells( x, meetingObject[d3], 3, calendarTable, currentLength);
			insertCalendarCells( x, meetingObject[d4], 4, calendarTable, currentLength);
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

	function sortMeetingObject()
	{
		var aMeetingObject = arguments[0];
		var activities = [];
		for( var x = 0; x < aMeetingObject.length; x++ )
		{
			console.log("Sort LEN:" + aMeetingObject.length );
			console.log('aMeetingObject:' + JSON.stringify( aMeetingObject ) );
			console.log('aMeetingObject:' + aMeetingObject[x].time );
			activities.push([calculateTime(aMeetingObject[x].time), aMeetingObject[x].time, aMeetingObject[x].date, aMeetingObject[x].studentName]);
		}
		console.log('activities:::::::' + activities.length );
		console.log('activities:::::::' + activities[0] );
		activities = bubbleSort(activities);
		console.log('activities:::::::' + activities.length );
		for( var x = 0; x < activities.length; x++ )
		{
			console.log("Sorted -----:" + activities[x][0] );
		}
		console.log("Sort LEN:" + aMeetingObject.length );
		while(aMeetingObject.length > 0)
		{
			aMeetingObject.pop();
		}
		for( var x = 0; x < activities.length; x++ )
		{
			var tmpMeeting = JSON.stringify({
				"date" : activities[x][2],
				"studentName" : activities[x][3],
				"time" : activities[x][1],
			});
			console.log("JSON:" + tmpMeeting);
			aMeetingObject.push(JSON.parse(tmpMeeting));
		}
		console.log("Sort LEN:" + aMeetingObject.length );
	}
	function bubbleSort()
	{
		var meetingArray = arguments[0];
		if( meetingArray.length == 1)
			return meetingArray;
		var sortComplete = 1;
		while( sortComplete >= 1 )
		{
			console.log('Begin:' + meetingArray.length)
			sortComplete = 0;
			for( var x = 0; x < meetingArray.length; x++ )
			{
				if( x >= meetingArray.length - 1)
				{
					console.log('BREAK');
					continue;
				}
				console.log('BBL:::::::' + meetingArray[x][0] + ":" + meetingArray[x + 1][0]);
				if( meetingArray[x][0] > meetingArray[x + 1][0])
				{
					var obj1 = meetingArray[x];
					var obj2 = meetingArray[x + 1];
					meetingArray[x] = obj2;
					meetingArray[x+1] = obj1;
					console.log('SWAP:::::::' + meetingArray[x][0] + ":" + meetingArray[x + 1][0] );
					sortComplete = 1;
				}
			}
			console.log('BBL2:' + sortComplete);
		}//End while
		console.log('BBL3:' + sortComplete);
		return meetingArray;
	}
	function insertCalendarCells()
	{
		var rowIndex = arguments[0];
		var aMeetingObject = arguments[1];
		var cellIndex = arguments[2];
		var calendarTable = arguments[3];
		var objectIndex = rowIndex - arguments[4];
		console.log("Insert Meeting data for row:" + rowIndex + ":" + cellIndex + ":" + aMeetingObject.length );
		if( aMeetingObject.length > objectIndex)
		{
			//console.log("Insert Meeting data for row:" + rowIndex + ":" + cellIndex + ":" + aMeetingObject.length );
			//console.log('aMeetingObject:' + JSON.stringify( aMeetingObject ) );

			//alert("Stop4");
			var newText = aMeetingObject[objectIndex].time + ":" + aMeetingObject[objectIndex].studentName;
			//alert("Stop5" + newText);
			//newRow.insertCell(cellIndex -1);
			//var y = newRow.insertCell(cellIndex);
			//alert("Stop6");
			calendarTable.rows[rowIndex].cells[cellIndex].innerHTML = newText;
			//cell.innerHTML = newText;
			//alert("Stop7");

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
				loadStudentTable();
			}
			fr.readAsText(f);
		}
	}
	document.getElementById('files').addEventListener('change',
			handleFileSelect, false);

	function loadStudentTable() {
		console.log("Load student table:" + studentDataObject.student.length);
		document.getElementById("student-table").innerHTML = "";
		//First set headers
		//Get keys for headers
		for ( var key in studentDataObject.student[0]) {
			if (Array.isArray(studentDataObject.student[0][key])) {
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
		console.log("studentDataObject.student.length:"
				+ studentDataObject.student.length);
		for (var r = 0; r < studentDataObject.student.length; r++) {
			var x = document.getElementById('student-table').insertRow(r + 1);//Need to add offset for header
			for (var c = 0; c < studentKeys.length; c++) {
				var y = x.insertCell(c);
				y.innerHTML = studentDataObject.student[r][studentKeys[c]];
			}
		}
		highlight_student_row();
		loadCalendarTable();
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

		console.log('Update the meeting table meetings: ' + studentDataObject.student[selectedStudentId].meetings.length);
		if (typeof selectedStudentId === "undefined"
				|| selectedStudentId === null) {
			console.log('Cant find the student: ' + selectedStudentId);
		} else {

			//Get keys for headers
			var col = [];
			for ( var key in studentDataObject.student[selectedStudentId]["meetings"][0]) {
				if (Array
						.isArray(studentDataObject.student[selectedStudentId]["meetings"][key])) {
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
			for (var r = 0; r < studentDataObject.student[selectedStudentId].meetings.length; r++) {
				var x = document.getElementById('meeting-table').insertRow(
						r + 1);//Need to add offset for header
				for (var c = 0; c < col.length; c++) {
					var y = x.insertCell(c);
					y.innerHTML = studentDataObject.student[selectedStudentId].meetings[r][col[c]];
				}
			}
			highlight_meeting_row();
		}
		loadCalendarTable();
	}

	function deleteStudentFunction() {
		console.log('Delete a student: ' + selectedStudentId);
		if (typeof selectedStudentId === "undefined"
				|| selectedStudentId === null) {
			console.log('Cant Delete a student: ' + selectedStudentId);
		} else {
			console.log('Delete a student: ' + selectedStudentId);
			console.log('Delete a student: '
					+ studentDataObject.student.length);
			studentDataObject.student.splice(selectedStudentId, 1);
			console.log('Delete a student: '
					+ studentDataObject.student.length);
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
							+ studentDataObject.student[selectedStudentId].meetings.length);
			studentDataObject.student[selectedStudentId].meetings.splice(
					selectedMessageId, 1);
			console
					.log('student meetings: '
							+ studentDataObject.student[selectedStudentId].meetings.length);
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
		for (i in studentDataObject.student) {
			console.log("The ID:" + studentDataObject.student[i].id + ":" + i);
			if( id == studentDataObject.student[i].id)
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
		studentDataObject.student.push(JSON.parse(tmpStudent));
		console.log("JSON2:" + studentDataObject.student.length);
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
			studentDataObject.student[selectedStudentId]['meetings'] = [];
		}
		console.log('Adding a meeting?' + currentStudentHasMeetings());
		//console.log('Adding a meeting?' + studentDataObject.student[selectedStudentId].meetings.length);

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
		studentDataObject.student[selectedStudentId].meetings.push(JSON.parse(tmpMeeting));
		console.log("meetings length:" + studentDataObject.student[selectedStudentId].meetings.length);
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