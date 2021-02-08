<html>
<head>
	<link rel="stylesheet" href="field.css">

    <title>Spring boot jsp example</title>
    <style>

</style>
</head>
<body>
<div style='float:left'>
<form>
 <fieldset>
  <legend>Student Information:</legend>
		Name : <input type="text" name="name" id="inputName" value="ted"/><br>
		ID : <input type="text" name="id" id="inputId" value="4"/><br>
		DOB : <input type="text" name="dob" id="inputDOB" value="02/26/1964"/><br>
		STATUS : <input type="text" name="status" id="inputStatus" value="enrolled"/><br>
		GRADE : <input type="text" name="grade" id="inputGrade" value="9"/><br>
		<input type="submit" value="Add Student"/>
		<input type="button" value="Cancel" onClick="cancelAdd()"/>
 </fieldset>
</form>
</div>

<div style='float:Left'>
<form>
 <fieldset>
  <legend>Meeting Information:</legend>
		Date : <input type="text" name="date" id="inputDate" value="01/01/2021"/><br>
		Notes : <input type="text" name="notes" id="inputNotes" value="We chatted"/><br>
		<input type="submit" value="Add Meeting"/>
		<input type="button" value="Cancel" onClick="cancelAddMeeting()"/></form>
	</fieldset>
</div>
</body>
</html>