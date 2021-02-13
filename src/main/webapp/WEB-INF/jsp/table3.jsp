<head>
	<link rel="stylesheet" href="table3.css">
	<title>Student Meeting Recorder</title>
</head>
<button onclick="testFunction()" id="testButton">test button</button>
<button onclick="findStudent()" id="testButton2">test button2</button>
<button onclick="startFunction()" id="startButton">start button</button>

 <form onsubmit="return findStudent()">
  Enter name: <input id="lname" type="number">
  <input type="button" value="doIt" onClick="findStudent()"/>
</form> 

<table class="student_fixed_header" id="student-table" width="100%">
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
<table class="meeting_fixed_header" id="meeting-table" width="100%">
	<caption id="HeadersRow">Meetings with fixed Column Header Row</caption>
	<thead>
    	<tr>
      		<th>Date</th>
			<th>Time</th>
			<th>Student ID</th>
      		<th>Code</th>
      		<th>Notes</th>
      		<th>Function</th>
    	</tr>
  	</thead>
  	<tbody>
  	</tbody>
</table>

<script>
    var name = "${name}";
//	console.log("parsed json file:" + name);
	var studentDataObject = null; //JSON.parse(JSON.stringify(${dataJson}));
	console.log("Again:");
	function testFunction() {
		console.log("Test function:");
		loadStudentTable2();
		loadMeetingTable();
	}
	function startFunction() {
		console.log("Start function:");
		console.log("parsed json file:" + name);
		studentDataObject = JSON.parse(JSON.stringify(${dataJson}));
		console.log("parsed json file:" + studentDataObject.students.length);
	}
	function findStudent()
	{
		//var results = JSONPath(null, studentDataObject, "$..[?(@.id=='A')]");
		var inVal = document.getElementById("lname").value;
		console.log("results:" + inVal + ":");
		//console.log("results:" + (inVal + 1));
		console.log("parsed json file:" + studentDataObject.students.length);
		
		var id = studentDataObject.students.find( record => record.id === Number(inVal));
		console.log("id:" + id.firstName);
		for( var x = 0; x < studentDataObject.students.length; x++)
		{
			var stObj = studentDataObject.students[x];
			//console.log("results:" + stObj.id );
		}
		id = studentDataObject.students.find( record => record.firstName === "Rudra");
		console.log("results2:" + id.lastName);

		//var result=studentDataObject.filter(obj=> obj.firstName == "David");
		//console.log("FNAME:" + result);
		return false;
	}
	var studentKeys = [];

	function loadStudentTable2() {
		console.log("Load student table:" + studentDataObject.students.length);
		var tbodyRef = document.getElementById("student-table").getElementsByTagName('tbody')[0];
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
	function loadMeetingTable() {
		console.log("Load meeting table:" + studentDataObject.meetings.length);
		var tbodyRef = document.getElementById("meeting-table").getElementsByTagName('tbody')[0];
		for( var x = 0; x < studentDataObject.meetings.length; x++)
		{
			var meetingDate = studentDataObject.meetings[x].date;
			console.log("Meeting Date:" + meetingDate);
			if( meetingDate == "01/14/2021")
			{
				var studentId = studentDataObject.meetings[x].studentId;
				var studentObject = findStudent(studentId);
				var id = studentDataObject.meetings[x].id;
				var y = tbodyRef.insertRow();
				y.insertCell(0).innerHTML = studentDataObject.meetings[x].date;
				y.insertCell(1).innerHTML = studentDataObject.meetings[x].time;
				y.insertCell(2).innerHTML = studentObject.lastName;
				y.insertCell(3).innerHTML = studentDataObject.meetings[x].code;
				y.insertCell(4).innerHTML = studentDataObject.meetings[x].notes;
				var btnTxt = "<button value=\"Delete\" id=\"removeFrom\" onclick=\"deleteRow(" + id + ");\" >Delete</button>"
				btnTxt += "<button value=\"Update\" id=\"updateTo\" onclick=\"updateRow(" + id + ");\" >Update</button>";
				btnTxt += "<button value=\"Review\" id=\"reviewStudent\" onclick=\"reviewStudent(" + id + ");\" >Review</button>";
				y.insertCell(5).innerHTML = btnTxt;
			}
		}
	}
	function findStudent(idIn) {
		//console.log("Find Student:" + idIn);
		var tbodyRef = document.getElementById("meeting-table").getElementsByTagName('tbody')[0];
		for( var x = 0; x < studentDataObject.students.length; x++)
		{
			var id = studentDataObject.students[x].id;
			if ( id == idIn)
				return studentDataObject.students[x];
		}
		return null;
	}

	function deleteRow(evt) 
	{
		console.log("remove from student table:" + evt);
	}
</script>