<html>

<head>
<link rel="stylesheet" href="mystyle2.css">

<title>Student Meeting Recorder</title>
</head>

<body>


	Set Calendar Dates:<input type="date" id="dateInput" onChange=setCalendarDates()><br>
	<button onclick="startFunction()" id="startButton">start button</button>
	
	<button onclick="openForm()" id="formButton">form button</button>
	
	<button onclick="loadStudentTable2()" id="testButton">loadStudentTable2</button>
	<button onclick="loadCalendarTable2()" id="testButton">loadCalendarTable2</button>

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



<table class="student_fixed_header" id="student-table2" width="100%">
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

<h2>Weekly Calendar</h2>
<table class="gt" id="calendar-table2" width="100%">
	<thead>
    	<tr>
    		<th></th>
      		<th>Monday</th>
			<th>Tuesday</th>
			<th>Wednesday</th>
      		<th>Thursday</th>
      		<th>Friday</th>
    	</tr>
    	<tr>
    		<th>Time</th>
      		<th id = "WD1">TBD</th>
			<th id = "WD2">TBD</th>
			<th id = "WD3">TBD</th>
      		<th id = "WD4">TBD</th>
      		<th id = "WD5">TBD</th>
    	</tr>
  	</thead>
  	<tbody>
  	</tbody>
</table>



<div class="form-popup" id="myForm">

  <form class="form-container">
  <div id="mydivheader">Meeting Information</div>
    <input type="date" id="addUpdateDate" onChange=setCalendarDates()><br>
    <input type="time" id="meetingTime" step="900" onchange="checkMeetingTime()" autocomplete=off>
    <br />
    <textarea id="meetingNotes" name="meetingNotes" rows="4" style="width:100%"></textarea>
    <br />
<label class="switch">
  <input type="checkbox" id="tentativeSwitch">
  Tentative<span class="slider"></span>
</label>
        <br />
 <select name="grade" id="grade" size="10" onchange="addToStudentList()" label="Grade">
 <optgroup label="Grade">
  <option value="8">8</option>
  <option value="9" selected>9</option>
  <option value="10">10</option>
  <option value="11">11</option>
  <option value="12">12</option>
  <option value="All">All</option>
  </optgroup>
</select>
<select name="codeSelectList" id="codeSelectList" multiple size="10">
 <optgroup label="Code">
  </optgroup>
</select>
<select name="adminSelectList" id="adminSelectList" multiple size="10">
 <optgroup label="Admin">
 </optgroup>
</select>
<select name="meetingDuration" id="meetingDuration" multiple size="10">
 <optgroup label="Length">
  <option value="1">15</option>
  <option value="2">30</option>
  <option value="3">45</option>
  <option value="4">60</option>
  <option value="5">75</option>
  <option value="6">90</option>
  <option value="7">105</option>
  <option value="8">120</option>
    </optgroup>
</select>
<select name="studentSelectList" id="studentSelectList" multiple size="10">
<optgroup label="Students">
 <option value="None" selected>None</option>
    </optgroup>
</select>
<br />
    <button type="button" class="btn cancel" onclick="closeForm()">Cancel</button>
    <button type="button" onclick="deleteMeeting()" id="deleteMeetingButton">DeleteMeeting</button>
    <button type="button" class="btn add" id="addMeetingButton" value="Add" onclick="addMeeting2()"></button>
  </form>
</div>

<script>
	var studentDataObject;
	var selectedStudentId, selectedMessageId;
	var studentKeys = [];
	var adminList = [];
	var codeList = [];
	var selectedMeetingId = null;
	var selectedCalendarRow = null;
	var selectedCalendarCell = null;
	var newMeetingDate = null;
	var newMeetingTime = null;
	var meetingMapObject = null;
	var maxMeetingId = 0; 
	//JSON.parse(JSON.stringify({
	//	"meetings" : []
	//}));
	
	function checkMeetingTime()
	{
		console.log("TIME:" + document.getElementById("meetingTime").value );
		//var timeVal =  document.getElementById("meetingTime").value;
		//var minVal = timeVal.split(":")[1];
		//console.log("minVal:" + minVal );
		//if( (minVal % 15) == 0)
		//	return;
		//if( minVal > 45 )
		//	minVal = 45;
		//else if( minVal > 30 )
		//	minVal = 30;
		//else if( minVal > 15 )
		//	minVal = 15;
		//else
		//	minVal = 00;
		//console.log("minVal:" + minVal );
		//console.log("Val:" + timeVal.split(":")[0] + ":" + minVal );
		//document.getElementById("meetingTime").value = timeVal.split(":")[0] + ":" + minVal;
	}
	function checkTime(timeIn)
	{
		console.log("TIME:" + timeIn );
	}
	//This is a test space for any and everything
	function testFunction()
	{
		console.log("test function");
		loadStudentTable2();
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
	function getTodaysDate()
	{
		var today = new Date();
		var mnth = today.getMonth() + 1;
		var dVal = today.getDate();
		if( dVal < 10)
			dVal = '0' + dVal;
		var mVal = today.getMonth() + 1;
		if( mVal < 10)
			mVal = '0' + mVal;
		return today.getFullYear() + "-" + mVal + "-" + dVal;
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
		document.getElementById("dateInput").value = getTodaysDate();
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
	
	function dateStringFormatter( dateIn )
	{//2021-02-22 to 02/22/2021
		return dateIn.split("-")[1] + "/" + dateIn.split("-")[2] + "/" + dateIn.split("-")[0];
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

	//Set the dates in the header row of the calendar
	//Called whenever the date changes
	//And resets the meetings
	function setCalendarDates()
	{
		//console.log('dateIn:' + document.getElementById('dateInput').value );
		var tmpDate = new Date(document.getElementById('dateInput').value);
		var dateObject = new Date ( tmpDate.getTime() - tmpDate.getTimezoneOffset() * -60000 );
		var dateDiff = dateObject.getDate() - dateObject.getDay() + (dateObject.getDay() === 0 ? -6 : 1);
		var nd1 = new Date(dateObject.setDate(dateDiff));
		document.getElementById('WD1').innerHTML = dateFormatter(nd1);
		nd1.setDate(nd1.getDate() + 1);
		document.getElementById('WD2').innerHTML = dateFormatter(nd1);
		nd1.setDate(nd1.getDate() + 1); 
		document.getElementById('WD3').innerHTML = dateFormatter(nd1);
		nd1.setDate(nd1.getDate() + 1);
		document.getElementById('WD4').innerHTML = dateFormatter(nd1);
		nd1.setDate(nd1.getDate() + 1);
		document.getElementById('WD5').innerHTML = dateFormatter(nd1);
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
		meetingMapObject = JSON.parse(JSON.stringify({
			"meetings" : []
		}));

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
			
				
		for(var z = 0; z < studentDataObject.admins.length; z++)
		{
			if (adminList.indexOf(studentDataObject.admins[z]) === -1) {
				console.log("push:" + studentDataObject.admins[z]);
				adminList.push(studentDataObject.admins[z]);
			}
		}
		for(var z = 0; z < studentDataObject.meetingCodes.length; z++)
		{
			if (codeList.indexOf(studentDataObject.meetingCodes[z]) === -1) {
				console.log("push:" + studentDataObject.meetingCodes[z]);
				codeList.push(studentDataObject.meetingCodes[z]);
			}
		}
		//Also get the names of all admins and codes
		for (i in studentDataObject.meetings) {
			{
				date = studentDataObject.meetings[i].date
				time = studentDataObject.meetings[i].time
				if( studentDataObject.meetings[i].id > maxMeetingId)
					maxMeetingId = studentDataObject.meetings[i].id;
				//Check the date before adding
				if(compareDates( startDate, endDate, date))
				{
					//console.log("Adding:" + date + ":" + time + ":" + weeksMeetingObject.meetings.length);
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
			//console.log("Delete row:" + (x - 1) );
			calendarTable.deleteRow( x - 1);
		}
		
		currentLength = document.getElementById("calendar-table2").rows.length;
		console.log("currentLength:" + currentLength );
		//return;
		//Need to go from 8 to 16
		var timeSlots = 38;
		var skipCells = [ 0, 0, 0, 0, 0];
		//Add rows for each hour
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
			
			//Add rows for each 15 minute segment
			for( var y = 0; y < hrSegs.length; y++ )
			{
				var tVal = "";
				if( x >= 12 )
					timeValueMatch = hrVal + ":" + hrSegs[y] + pmVal;
				else
					timeValueMatch = hrVal + ":" + hrSegs[y] + amVal;
				var newRow = calendarTable.insertRow(-1);//Add row
				var newCell = newRow.insertCell(0);//Add cell for time 
				newCell.innerHTML = timeValueMatch;
				//Now add cells for the rest of columns 
				//console.log("skipCells:" + skipCells);
				var skipCt = 0;
				for( var b = 0; b < skipCells.length; b++ )
				{
					if( skipCells[b] > 0 )
					{
						skipCells[b] = skipCells[b] - 1;
						skipCt++;
					}
				}
				//console.log("skipCells:" + skipCells + ":" + skipCt);
				for( var z = 1; z < 6 - skipCt; z++)
				{
					newCell = newRow.insertCell(z);
				}
				//console.log("newRow.cells.length:" + newRow.cells.length);
				//var btnTxt = "<button value=\"Delete\" id=\"removeFrom\" onclick=\"deleteMeeting();\" >Delete</button>"
				//btnTxt += "<button value=\"Update\" id=\"updateTo\" onclick=\"updateMeeting();\" >Update</button>";
				//btnTxt += "<button value=\"Review\" id=\"reviewStudent\" onclick=\"reviewMeeting();\" >Add</button>";
				//newRow.cells[newRow.cells.length - 1].innerHTML = btnTxt;
				var id = weeksMeetingObject.meetings.find( record => record.time === timeValueMatch);
				while (typeof id !== "undefined")
				{	
					//Load row
					{
						id.studentIDs.length
						

						var dtIndex = dateStrings.indexOf(id.date) + 1;
						var meetingInformationStr = "Code:" + id.code;
						console.log("id.studentIDs.length:" + id.studentIDs.length);
						if( id.studentIDs.length > 0 )
							meetingInformationStr += "|Students:";
						for(var z = 0; z < id.studentIDs.length; z++)
						{
							var studentMatch = studentDataObject.students.find( record => record.id === Number(id.studentIDs[z]));
							meetingInformationStr += studentMatch.lastName + ":";
						}
						if( id.adminList.length > 0 )
							meetingInformationStr += "|Admins:";
						for(var z = 0; z < id.adminList.length; z++)
						{
							meetingInformationStr += id.adminList[z];
						}

						//console.log('Match?' + id.time + ":" + id.date + ":" + timeValueMatch + ":" + dtIndex + ":" + meetingInformationStr + ":" + id.studentIDs.length);
						//var newCell = newRow.insertCell(dtIndex);
						var newCell = newRow.cells[dtIndex];
						newCell.rowSpan = id.timePeriods;
						newCell.innerHTML = meetingInformationStr;
						//newRow.cells[dtIndex].rowSpan = id.timePeriods;
						//newRow.cells[dtIndex].innerHTML = meetingInformationStr;
						skipCells[dateStrings.indexOf(id.date)] = id.timePeriods - 1;

						var locationString = newRow.rowIndex + ":" + dtIndex;
						var tmpMessage = JSON.stringify({
							"location" : locationString,
							"id" : id.id
						});
						//console.log('idx:' + locationString + ":" + id.id + ":" + newRow.cells.length);
						meetingMapObject.meetings.push(JSON.parse(tmpMessage));
					}
					removeNode( weeksMeetingObject, id.id);
					id = weeksMeetingObject.meetings.find( record => record.time === timeValueMatch);
				}//End while (typeof id !== "undefined")
				//console.log('ROW LENGTH:' + newRow.rowIndex + ":" + newRow.cells.length);	
			}//For each 15 minute period
		}//For each hour
		console.log("weeksMeetings:" + weeksMeetingObject.meetings.length);
		console.log("meetingMapObject:" + meetingMapObject.meetings.length);

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
				selectedCalendarRow = this.parentNode.rowIndex;
				var cellId = this.cellIndex;
				selectedCalendarCell = this.cellIndex;
				newMeetingDate = table.rows.item(1).cells.item(this.cellIndex).innerHTML;
				newMeetingTime = table.rows.item(this.parentNode.rowIndex).cells.item(0).innerHTML;
				console.log('Selected calendar cell:' + this.parentNode.cellIndex);
				selectedMeetingId = null;
				var rowSelected = table.rows.item(rowId);
				//console.log('Selected calendar rowId: ' + rowId + ":" + cellId + ":" + rowSelected.cells.length);
				//if (rowId <= 1 || cellId == 0 || cellId == rowSelected.cells.length - 1) {
				if (rowId <= 1 || cellId == 0) {
					console.log('clean1');
					//selectedMeetingId = null;
					//console.log('selected meeting ID1:' + selectedMeetingId);

					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 0; row < rowsNotSelected.length; row++) {
						//console.log('clean1');
						//rowsNotSelected[row].style.backgroundColor = "";
						//rowsNotSelected[row].classList.remove('selected');
						var cellLength = table.rows[row].cells.length;
						for (var cell = 0; cell < cellLength; cell++) {
							var cellNotSelected = table.rows.item(row).cells.item(cell);
							cellNotSelected.style.backgroundColor = "";
							cellNotSelected.classList.remove('selected');
						}
					}
				} else {
					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 0; row < rowsNotSelected.length; row++) {
						console.log('clean2');
						//seletedMeetingId = null;
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
					var locationMatch = rowId + ":" + cellId;
					//console.log('selected meeting ID:' + locationMatch);
					var selectedMeeting = meetingMapObject.meetings.find( record => record.location === locationMatch);
					//seletedMeetingId = cellSelected.innerHTML;
					if (typeof selectedMeeting !== "undefined")
					{
						selectedMeetingId = selectedMeeting.id;
						openForm(selectedMeetingId);
						//console.log('selected meeting ID:' + selectedMeetingId);
					}
					else
					{
							selectedMeetingId = null;
							openForm(newMeetingDate, newMeetingTime);
					}

				}//End else
				console.log('selected meeting ID2:' + selectedMeetingId);
			}
		}
	}

	function addMeeting()
	{
		console.log('Add selected meeting ID:' + selectedMeetingId );
		console.log('Add selectedCalendarRow:' + selectedCalendarRow);
		console.log('Add selectedCalendarCell:' + selectedCalendarCell);
		var table = document.getElementById('calendar-table2');
		var date = table.rows.item(1).cells.item(selectedCalendarCell).innerHTML;
		var timeSlot = table.rows.item(selectedCalendarRow).cells.item(0).innerHTML;
		console.log('Meeting Specs:' + selectedCalendarCell + ":" + date + ":" + timeSlot);
		openForm(date, timeSlot);
		if (typeof selectedMeetingId === null)
		{
			//loadCalendarTable2()
		}
	}

		
	function deleteMeeting()
	{
		if (typeof selectedMeetingId !== "undefined" && selectedMeetingId !== null)
		{
			console.log('Delete selected meeting ID:' + selectedMeetingId + ":" + studentDataObject.meetings.length);
			var index = studentDataObject.meetings.findIndex(obj => obj.id==selectedMeetingId);
			console.log("INDEX:" + index);
			studentDataObject.meetings.splice(index,1);
			console.log('Delete selected meeting ID:' + selectedMeetingId + ":" + studentDataObject.meetings.length);
			//If we have a valid meeting we need to delete and load the calendar table
			loadCalendarTable2();
		}
		closeForm();
	}


	function reviewMeeting()
	{
			console.log('Review selected meeting ID:' + selectedMeetingId);
	}

	function militaryTimeEquiv()
	{//01:00 PM to 13:00:00
		var t1 = arguments[0].split(" ");
		var res1 = t1[0].split(":");
		var hr = parseInt(res1[0]);
		var min = parseInt(res1[1]);
		var string1 = "PM";
		if( string1.localeCompare(t1[1]) == 0 && hr != 12)
			hr += 12;
		var hrVal = "";
		var minVal = "";
		if( hr < 10 )
			hrVal = "0" + hr;
		else
			hrVal = hr;
		if( min < 10 )
			minVal = "0" + min;
		else
			minVal = min;

		return hrVal + ":" + minVal + ":" + "00";
	}

	function toStandardTime(militaryTime) {
		console.log("toStandardTime:" + militaryTime);
	    militaryTime = militaryTime.split(':');
	    //Treat as strings & characters
		var hrVal = militaryTime[0];
		var minVal = militaryTime[1];
		//Assume it is am
		var dpStr = " AM";
		if (militaryTime[0].charAt(0) == 1 && militaryTime[0].charAt(1) >= 2)
			dpStr = " PM";
		console.log("hrVal:" + hrVal.length + ":" + hrVal + ":" + minVal + ":" + dpStr);
		if (hrVal.charAt(0) == 1 && hrVal.charAt(1) > 2)
		{
			var hr2 = hrVal.charAt(1);
			console.log("hr2:" + hr2);
			hr2 = hr2 - 2;
			console.log("hr2:" + hr2);
			hrVal = '0' + hr2;
		}
		
		console.log("hrVal:" + hrVal.length + ":" + hrVal + ":" + minVal + ":" + dpStr);
		return hrVal + ":" + minVal + dpStr;
	    //return (militaryTime[0].charAt(0) == 1 && militaryTime[0].charAt(1) > 2) ? (militaryTime[0] - 12) + ':' + militaryTime[1] + ' PM' : militaryTime.join(':') + ' AM'
	}
	function militarizeTime()
	{//01:00 PM to 1300
		var t1 = arguments[0].split(" ");
		var res1 = t1[0].split(":");
		var n1 = parseInt(res1[0])*100 + parseInt(res1[1]);
		var string1 = "PM";
		if( string1.localeCompare(t1[1]) == 0 )
			n1 += 1200;
		if( arguments.length > 1 )
		{
			var tmBump = arguments[1];
			//console.log("n1:" + n1);
			var minuteValue = (n1 % 100);//Get minutes
			//console.log("minuteValue:" + minuteValue);
			var hrVal = n1 - minuteValue;//subtract minutes
			//console.log("hrVal:" + hrVal);
			var z = ( (minuteValue/15) + tmBump );
			//console.log("z:" + z);
			
			while( z >= 4 )
			{
				hrVal += 100;
				z -= 4;
			}
			hrVal += (z * 15);
			n1 = hrVal;
			//console.log("tmBump:" + tmBump + ":" + n1);
		}
		return n1;
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
	
	function removeNode( data, id){
		data.meetings.forEach(function(e, index){
	    if(id == e.id){
	    	data.meetings.splice(index, 1);
	    }
	  })
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
				}
			}
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
		//Form area
	//openForm()
	function openForm() 
	{
		
		console.log("openForm:" + arguments[0]);
		document.getElementById("addUpdateDate").value = getTodaysDate();

		//var today = new Date();
		//console.log("DF:" + dateFormatter(today) );
		//document.getElementById("addUpdateDate").value = today.getFullYear() + "-" + mVal + "-" + dVal;
		//First set the codes
		var codeSelectList = document.getElementById("codeSelectList");
		while(codeSelectList.length > 0)
			codeSelectList.remove(0);
		for( var x = 0; x < codeList.length; x++)
		{
			  var option = document.createElement("option");
			  option.text = codeList[x];
			  //if( x == 0 )
				//  option.selected = true;
			  codeSelectList.add(option);
		}
		//Add Admins
		var adminSelectList = document.getElementById("adminSelectList");
		while(adminSelectList.length > 0)
			adminSelectList.remove(0);
		var option = document.createElement("option");
		option.text = "None";
		adminSelectList.add(option);
		//option.selected = true;
		console.log("adminList:" + adminList.length);
		for( var x = 0; x < adminList.length; x++)
		{
			  var option = document.createElement("option");
			  option.text = adminList[x];
			  //if( x == 0 )
			//	  option.selected = true;
			  adminSelectList.add(option);
		}
		//Add students
		addToStudentList();
		//First for new meeting
		if( arguments.length == 2)
		{
			document.getElementById('meetingTime').value = militaryTimeEquiv(arguments[1]);
			
			var dtVal = arguments[0].split("/")[2] + "-" + arguments[0].split("/")[0] + "-" + arguments[0].split("/")[1];
			document.getElementById("addUpdateDate").value = dtVal;
			console.log("openForm no meeting:" + arguments[0] + ":" + dtVal);
			document.getElementById('addMeetingButton').textContent  = "Add Meeting";
			document.getElementById('meetingTime').disabled = true;
			document.getElementById('addUpdateDate').disabled = true;
			document.getElementById('tentativeSwitch').checked = false;

		}
		else if( arguments.length == 1)
		{
			console.log("openForm for meeting:" + arguments[0]);
			var selectedMeeting = studentDataObject.meetings.find( record => record.id === arguments[0]);
			document.getElementById('meetingTime').value = militaryTimeEquiv(selectedMeeting.time);
			var dtVal = selectedMeeting.date.split("/")[2] + "-" + selectedMeeting.date.split("/")[0] + "-" + selectedMeeting.date.split("/")[1];
			document.getElementById("addUpdateDate").value = dtVal;

			document.getElementById('addMeetingButton').textContent  = "Update Meeting";
			document.getElementById('meetingNotes').value = selectedMeeting.notes;
			document.getElementById('meetingTime').disabled = false;
			document.getElementById('addUpdateDate').disabled = false;

			//Set the tentative indicator
			console.log("TENTATIVE:" + selectedMeeting.tentative);
			if( selectedMeeting.tentative )
			{
				document.getElementById('tentativeSwitch').checked = true;
				//alert("ttt");
			}
			else
				document.getElementById('tentativeSwitch').checked = false;
			//Set the selected code
			for( var x = 0; x < codeSelectList.length; x++)
			{
				console.log("option:" + codeSelectList[x].text);
				if( selectedMeeting.code.localeCompare(codeSelectList[x].text)== 0)
				{
					codeSelectList[x].selected = true;
				}
				else
					codeSelectList[x].selected = false;
			}
			//Set the meeting length
			var durationSelectList = document.getElementById("meetingDuration");
			for( var x = 0; x < durationSelectList.length; x++)
			{
				//console.log("option:" + durationSelectList[x].text);
				if( x == (selectedMeeting.timePeriods - 1) )
				{
					durationSelectList[x].selected = true;
				}
				else
					durationSelectList[x].selected = false;
			}
			//Set the selected admin(s)
			var adminSelectList = document.getElementById("adminSelectList");
			for( var x = 0; x < adminSelectList.length; x++)
			{
				if( selectedMeeting.adminList.length > 0 )
				{
					for( var y = 0; y < selectedMeeting.adminList.length; y++)
					{	
						console.log("admin:" + selectedMeeting.adminList[y]);
						if( selectedMeeting.adminList[y].localeCompare(adminSelectList[x].text)== 0)
							adminSelectList[x].selected = true;
					}
				}
				else
					adminSelectList[x].selected = false;
			}
			//Now set selected students
			var studentSelectList = document.getElementById("studentSelectList");
			//First see what grade(s) we are dealing with as we may need to reset the list
			var grades = [];
			for( var x = 0; x < selectedMeeting.studentIDs.length; x++)
			{
				var studentMatch = studentDataObject.students.find( record => record.id === selectedMeeting.studentIDs[x]);

			
				if (grades.indexOf(studentMatch.grade) === -1) {
					console.log("push:" + studentMatch.grade);
					grades.push(studentMatch.grade);
				}
			}
			if(grades.length > 0)
			{
				console.log("new selected grade:" + grades.length + ":" + grades[0]);
				//If one just select that grade and do student list again
				var gradeMatch = grades[0];
				if(grades.length > 1)
					gradeMatch = "All";
				//Set the meeting length
				console.log("new selected grade:" + gradeMatch);
				var gradeSelectList = document.getElementById("grade");
				for( var x = 0; x < gradeSelectList.length; x++)
				{
					if( gradeMatch.localeCompare(gradeSelectList[x].text) == 0)
					{
						console.log("new selected grade?:" + gradeSelectList[x].text);
						gradeSelectList[x].selected = true;
					}
					else
						gradeSelectList[x].selected = false;
				}
				//Now reset the student list
				addToStudentList();
				//for( var x = 0; x < studentSelectList.length; x++)
				//{
				//	if( selectedMeeting.studentIDs.length > 0 )
				//	{
				//		for( var y = 0; y < selectedMeeting.studentIDs.length; y++)
				//		{	
				//			console.log("studentId:" + selectedMeeting.studentIDs[y]);
				//			if( selectedMeeting.studentIDs[y] == studentSelectList[x].value )
				//				studentSelectList[x].selected = true;
				//		}
				//	}
				//	else
				//		studentSelectList[x].selected = false;
				//}
			}
		}

		document.getElementById("myForm").style.display = "block";

	}
	function closeForm() 
	{
		console.log("close form");
		document.getElementById("myForm").style.display = "none";
	}
	function addToStudentList() 
	{
		console.log("addToStudentList:" + studentSelected());
		var studentIds = [];
		if ( typeof selectedMeetingId !== undefined && selectedMeetingId !== null)
		{
			console.log("selectedMeetingId:" + selectedMeetingId);
		
			var meeting = studentDataObject.meetings.find(obj => obj.id== selectedMeetingId);
			for(var x = 0; x < meeting.studentIDs.length; x++ )
			{
				studentIds.push(meeting.studentIDs[x]);
			}
			//loadCalendarTable2()
		}
		console.log("addToStudentList:" + studentIds.length);
		var idElement = document.getElementById("grade");
		var selectedGrade = idElement.options[idElement.selectedIndex].value;
		console.log("Grade:" + selectedGrade);
		var selectList = document.getElementById("studentSelectList");
		console.log("selectList:" + selectList.length);
		while(selectList.length > 0)
			selectList.remove(0);
		var option = document.createElement("option");
		option.text = "None";
		//option.selected = true;
		selectList.add(option);
		var students = [];
		console.log("All students:" + studentDataObject.students.length + ":" + selectedGrade);
		for( var x = 0; x < studentDataObject.students.length; x++)
		{
			if(selectedGrade.localeCompare("All") == 0 )
			{
				students.push(studentDataObject.students[x].lastName + ":" + studentDataObject.students[x].firstName + ":" + studentDataObject.students[x].id);
			}
			else if( selectedGrade.localeCompare(studentDataObject.students[x].grade) == 0)
			{//Add the student
				students.push(studentDataObject.students[x].lastName + ":" + studentDataObject.students[x].firstName + ":" + studentDataObject.students[x].id);
			}
		}
		students = bubbleSort(students);
		console.log("Grade students:" + students.length);
		for( var x = 0; x < students.length; x++)
		{
			var studentStr = students[x].split(":");
			var option = document.createElement("option");
			option.text = studentStr[0] + "," + studentStr[1];
			option.value = studentStr[2];
			for( var y = 0; y < studentIds.length; y++)
			{
				if( studentIds[y] == parseInt(studentStr[2]))
					option.selected = true;
			}
			selectList.add(option);
		}
	}
	function addMeeting2() 
	{
		
		var x=document.getElementById("studentSelectList");
		console.log("LEN:" + x.options.length);
		//var studentIds = "";
		var studentIds = [];

		for (var i = 0; i < x.options.length; i++) {
			if(x.options[i].selected ==true){
				//if(studentIds.length > 0)
				//	studentIds += ",";
				if( x.options[i].value.localeCompare("None") !== 0)
				{
					console.log("Student:" + x.options[i].value + ":" + x.options[i].text);
					studentIds.push(parseInt(x.options[i].value));
				}
			}
		}
		var x=document.getElementById("adminSelectList");
		console.log("LEN:" + x.options.length);
		var adminList = [];
		for (var i = 0; i < x.options.length; i++) {
			if(x.options[i].selected ==true){
				//if(adminList.length > 0)
				//	adminList += ",";
				if( x.options[i].value.localeCompare("None") !== 0)
				{
					console.log("Admin:" + x.options[i].value + ":" + x.options[i].text);
					adminList.push(x.options[i].value);
				}
			}
		}
		//Get meeting code
		var codeSelectList = document.getElementById("codeSelectList");
		var selectedCodeValue = codeSelectList.options[codeSelectList.selectedIndex].value;
		var durationSelectList = document.getElementById("meetingDuration");
		var adminSelectList = document.getElementById("adminSelectList");
		var notes = document.getElementById("meetingNotes").value;
		var tentative = document.getElementById('tentativeSwitch').checked;

		console.log("add meeting studentIds:" + studentIds);
		console.log("add meeting Code:" + selectedCodeValue);
		console.log("add meeting Date:" + newMeetingDate);
		console.log("add meeting Time:" + newMeetingTime);
		console.log("add meeting Duration:" + durationSelectList.selectedIndex);
		console.log("add meeting admin:" + adminList);
		console.log("add meeting ID:" + maxMeetingId);
		console.log("add meeting tentative:" + tentative);

		if ( typeof selectedMeetingId !== undefined && selectedMeetingId !== null)
		{
			console.log("UPDATE:");
			console.log("!!!!!studentDataObject.meetings:" + studentDataObject.meetings.length);
			var meetingObject = studentDataObject.meetings.find(obj => obj.id== selectedMeetingId);
			const cloneMeetingObject = JSON.parse(JSON.stringify(meetingObject));

			//console.log("validMeeting a:" + JSON.stringify(meetingObject));
			//console.log("validMeeting a:" + JSON.stringify(cloneMeetingObject));

			var mTime = document.getElementById('meetingTime').value;
			//checkTime(mTime);
			//console.log("UPDATE time1:" + mTime);
			//console.log("UPDATE time2:" + toStandardTime(document.getElementById('meetingTime').value));
			//console.log("UPDATE date:" + dateStringFormatter(document.getElementById("addUpdateDate").value));
			//console.log("UPDATE time3:" + meetingObject.time);
			//console.log("UPDATE date4:" + meetingObject.date);
			

			cloneMeetingObject.time = toStandardTime(document.getElementById('meetingTime').value);
			cloneMeetingObject.date = dateStringFormatter(document.getElementById("addUpdateDate").value);
			cloneMeetingObject.code = selectedCodeValue;
			cloneMeetingObject.notes = notes;
			cloneMeetingObject.timePeriods = durationSelectList.selectedIndex + 1;
			cloneMeetingObject.studentIDs = studentIds;
			cloneMeetingObject.adminList = adminList;
			cloneMeetingObject.tentative = tentative;
			//console.log("validMeeting b:" + JSON.stringify(cloneMeetingObject));
			//alert("Cannot load meeting as requested");
			if( validateNewMeeting(cloneMeetingObject, selectedMeetingId) !== true )
			{
				alert("Cannot update meeting as requested");
			}
			else
			{
				//alert("Validated");
			
				//Need to update meetingObject to match cloneMeetingObject
				meetingObject.time = cloneMeetingObject.time;
				meetingObject.date = cloneMeetingObject.date;
				meetingObject.code = selectedCodeValue;
				meetingObject.notes = notes;
				meetingObject.timePeriods = durationSelectList.selectedIndex + 1;
				meetingObject.studentIDs = studentIds;
				meetingObject.adminList = adminList;
				meetingObject.tentative = tentative;
				loadCalendarTable2();
				closeForm();
				console.log("!!!!!studentDataObject.meetings:" + studentDataObject.meetings.length);
				return;
			}
		}
		else
		{
			var tmpMeeting = JSON.stringify({
					"studentId": 1001,
					"date": newMeetingDate,
					"code": selectedCodeValue,
					"notes": "N/A",
					"adminList":adminList,
					"id": maxMeetingId + 1,
					"time": newMeetingTime,
					"timePeriods": durationSelectList.selectedIndex + 1,
					"studentIDs":studentIds
			});
		
			var meetingObject = JSON.parse(tmpMeeting);
			console.log("validMeeting1:" + JSON.stringify(meetingObject));
			console.log("validMeeting2:" + validateNewMeeting(meetingObject));
		
			if( validateNewMeeting(meetingObject, -1) === true)
			{
				console.log("validMeeting!!!");
				studentDataObject.meetings.push(meetingObject);
				loadCalendarTable2();
				closeForm();
			}
			else
			{
				alert("Cannot load meeting as requested");
			}
		}
	}
	function validateNewMeeting(newMeetingObject, selectedMeetingId)
	{
		console.log("validate meeting:" + newMeetingObject.time);
		console.log("validate meeting:" + newMeetingObject.date);
		console.log("validate meeting:" + newMeetingObject.timePeriods);
		var newBeginTime = militarizeTime(newMeetingObject.time);
		var newEndTime = militarizeTime(newMeetingObject.time, newMeetingObject.timePeriods);
		console.log("newTimes:" + newBeginTime + ":" + newEndTime);
		for( var x = 0; x < studentDataObject.meetings.length; x++)
		{//			if( selectedGrade.localeCompare(studentDataObject.students[x].grade) == 0)
			if(newMeetingObject.date == studentDataObject.meetings[x].date )
			{
				if( studentDataObject.meetings[x].id == selectedMeetingId)
				{//Dont need to compare existing meeting to self
					console.log("Dont compare to self:");
					continue;
				}
				var oldBeginTime = militarizeTime(studentDataObject.meetings[x].time);
				var oldEndTime = militarizeTime(studentDataObject.meetings[x].time, studentDataObject.meetings[x].timePeriods);
				console.log("oldTimes:" + oldBeginTime + ":" + oldEndTime);
				if(newBeginTime >= oldEndTime)
					continue;
				if(newEndTime <= oldBeginTime)
					continue;
				if(newBeginTime == oldBeginTime )
					return false;
				if(newEndTime == oldEndTime )
					return false;
				if(newBeginTime > oldBeginTime || newBeginTime < oldEndTime)
					return false;
				if(newEndTime > oldBeginTime || newEndTime < oldEndTime)
					return false;
			}
		}
		return true;
	}

	function bubbleSort()
	{
		var sortArray = arguments[0];
		if( sortArray.length == 1)
			return sortArray;
		var sortComplete = 1;
		while( sortComplete >= 1 )
		{
			//console.log('Begin:' + sortArray.length)
			sortComplete = 0;
			for( var x = 0; x < sortArray.length; x++ )
			{
				if( x >= sortArray.length - 1)
				{
					//console.log('BREAK');
					continue;
				}
				//console.log('BBL:::::::' + sortArray[x][0] + ":" + sortArray[x + 1][0]);
				if( sortArray[x][0] > sortArray[x + 1][0])
				{
					var obj1 = sortArray[x];
					var obj2 = sortArray[x + 1];
					sortArray[x] = obj2;
					sortArray[x+1] = obj1;
					//console.log('SWAP:::::::' + sortArray[x][0] + ":" + sortArray[x + 1][0] );
					sortComplete = 1;
				}
			}
			//console.log('BBL2:' + sortComplete);
		}//End while
		//console.log('BBL3:' + sortComplete);
		return sortArray;
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
