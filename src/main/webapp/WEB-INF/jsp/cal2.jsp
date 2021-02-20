<html>
<head>
<link rel="stylesheet" href="mystyle3.css">

<style>
.grid-container {
  display: grid;
  grid-template-columns: 30px auto auto auto auto auto 30px;
  grid-template-rows: 40px 40px;
  align-content: center;
  grid-gap: 1px;
  background-color: #2196F3;
  padding: 4px;
}

.grid-container > div {
  background-color: rgba(255, 255, 255, 0.8);
  text-align: center;
  padding: 20px 0;
  font-size: 20px;
}


</style>
</head>
<body>


<div class="grid-container">
  <div class="item1">Sun</div>
  <div class="item2">Monday</div>
  <div class="item3">Tuesday</div>  
  <div class="item4">Wednesday</div>
  <div class="item5">Thursday</div>
  <div class="item6">Friday</div>
  <div class="item7">Sat</div>
  <div class="day1">1</div>
  <div class="day2">2</div>
  <div class="day3">3</div>  
  <div class="day4">4</div>
  <div class="day5">5</div>
  <div class="day6">6</div>
  <div class="day7">7</div>
</div> 


<div class="form-popup" id="myForm">
  <form class="form-container">
    <h1>Login</h1>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter studentId" id="meetingStudentId"  value='1000' value='1000' required>
    <input type="text" placeholder="Enter admin" id="meetingAdmin" value='Mary' required>
    <input type="text" placeholder="Enter periods" id="meetingPeriods" value='1' required>
    <input type="text" placeholder="Enter code" id="meetingCode" value='SST'  required>
<select name="cars" id="cars" multiple size="10">
  <option >
</option>
  <option >Saab</option>
  <option >Opel</option>
  <option >Audi</option>
</select>
    <button type="button" class="btn cancel" onclick="closeForm()">Cancel</button>
    <button type="button" class="btn add" onclick="addMeeting()">Add Meeting</button>
  </form>
</div>
	<button onclick="openForm()" id="formButton">form button</button>


    <script>
    start()
    function start()
    {
    	console.log("start");
    	openForm();
    	//openForm();
    }
	function openForm() 
	{
		addToCarList();
		console.log("openForm");
		  document.getElementById("myForm").style.display = "block";
	}
	function closeForm() 
	{
		console.log("close form");
		document.getElementById("myForm").style.display = "none";
	}
	function addToCarList() {
		  var x = document.getElementById("cars");
		  for (var i = 0; i < 300; i++) {
			  var option = document.createElement("option");
			  option.value = "one";
			  option.text = i;
			  x.add(option);
		  }
		}
	function addMeeting() 
	{
		closeForm();
		
		var stId = document.getElementById("meetingStudentId").value;
		var idElement = document.getElementById("cars");
		var selectedValue = idElement.options[idElement.selectedIndex].value;
	      var x=document.getElementById("cars");
	      console.log("LEN:" + x.options.length);
	      for (var i = 0; i < x.options.length; i++) {
	         if(x.options[i].selected ==true){
	        	 console.log("close form:" + x.options[i].value + ":" + x.options[i].text);
	          }
	      }
		console.log("add meeting:" + stId + ":" + selectedValue);

		console.log("add meeting:" + stId + ":" + selectedValue);

	}
	
    </script>
</body>
</html>