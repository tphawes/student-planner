<html>

<head>

<title>First Web Application</title>
</head>

<body>
	<font color="red">${errorMessage}</font>
	<button onclick="testFunction()" id="testButton">test button</button>
	<form method="post">
		Name : <input type="text" name="name" />
		Password : <input type="password" name="password" /> 
		<input type="submit" />
	</form>
	<div id="result"></div>
	<button onclick="memoryFunction()" id="addButton">Add Student</button>
	<div id="memSpace"></div>
<input type="file" id="files" name="files[]" multiple />
<output id="list"></output>

<h2>Make a table based on JSON data.</h2>
<p id="demo"></p>

<p id="demo2"></p>

<p>How to access nested JSON objects.</p>

<p id="demo3"></p>
<p id="demo4"></p>
<p id="demo5"></p>
<p id="demo6"></p>

	<table id="display-table" class="table-layout" style="width: 100%" border='1'>
	</table>

<script>
	var dataObject;
	var selectedStudentObject;
	function testFunction()
	{
		console.log("test function");
		console.log("test function dataObject:" + dataObject);
		console.log("test function selectedStudentObject:" + selectedStudentObject);
		if( typeof dataObject === "object" )
			console.log("test function dataObject:" + true);

	}
  function handleFileSelect(evt) {
	console.log("handle a file");
    var files = evt.target.files; // FileList object
    // Loop through the FileList and read as text
    for (var i = 0, f; f = files[i]; i++) {
    	console.log("handle file:" + i + ":" + f.type);
        var fr=new FileReader(); 
        fr.onload=function(){ 
        	console.log("fr.result:" + fr.result);
        	//var dataObject = JSON.parse(fr.result);
            doJSON(fr.result);
        } 
      fr.readAsText(f);
    }
  }
  document.getElementById('files').addEventListener('change', handleFileSelect, false);
  function doJSON()
  {
	  console.log("doJSON:" + arguments[0]);
	  //var obj, dbParam, dataObject, x, txt = "";
	  //var dataObject, x, txt = "";
	  var x, txt = "";
	  //obj = { table: "users", limit: 20 };
	  //dbParam = JSON.stringify(obj);
	  
	  console.log("Args:" + arguments.length);
	  if( arguments.length == 1 )
		  {
		  	dataObject = JSON.parse(arguments[0]);
		  	//dataObject1 = JSON.parse(arguments[0]);

	      	console.log("parsed:");
	      	
	      	//Get keys for headers
	      	var col = [];
            for (var key in dataObject.students[0]) 
            {
            	//console.log("key1:" + key);
            	//console.log("key2:" + dataObject.students[i][key]);
            	if( Array.isArray( dataObject.students[0][key]) )
            	{
            		console.log("key array!!!!!!!!" + key);
            		continue;
            	}
                if (col.indexOf(key) === -1) {
                    col.push(key);
                }
            }
			//Finished getting headers
	        console.log("Headers length:" + col.length);
	      	//Now load to table
	        txt += "<table border='1'>";
	        txt += "<tr>";
	        //Add headers
   	        for (var i = 0; i < col.length; i++) {
   	        	txt += "<th>" + col[i] + "</th>";	
   	        }
   	     	txt += "</tr>";
   	     	console.log("txt:" + txt);
	        //for (x in dataObject) {
	        for (var i = 0; i < dataObject.students.length; i++)
	        {
		      	console.log("dataObject:" + dataObject.students[i]);
		      	txt += "<tr>";
		      	txt += "<td>" + dataObject.students[i].name + "</td>";
		      	txt += "<td>" + dataObject.students[i].dob + "</td>";
		      	txt += "<td>" + dataObject.students[i].status + "</td>";
		      	txt += "<td>" + dataObject.students[i].grade + "</td>";
		      	txt += "</tr>";
	        }
			txt += "</table>";
	        console.log("txt:" + txt);
	           document.getElementById("demo").innerHTML = txt;

	           
	           //Now populate student table
	           
	           //First set headers
	           //Add headers
	           console.log("Add headers:" + col.length);
   	           var table = document.getElementById("display-table");
	           var header = table.createTHead();
	           var row = header.insertRow(0);
	           for (var i = 0; i < col.length; i++) {
   		           
   		           var cell = row.insertCell(i);
   		           cell.innerHTML = col[i].toUpperCase();
	           }

	           console.log("Added headers:" + col.length);

	           //var row = header.insertRow(0);
	           //var cell0 = row.insertCell(0);
	           //cell0.innerHTML = "<b>Name</b>";
	           //var cell1 = row.insertCell(1);
	           //cell1.innerHTML = "<b>DOB</b>";
	           //var cell2 = row.insertCell(2);
	           //cell2.innerHTML = "<b>Status</b>";
	           //var cell3 = row.insertCell(3);
	           //cell3.innerHTML = "<b>Grade</b>";

	           
	           console.log("dataObject.students.length:" + dataObject.students.length);
	           for(var r = 0; r < dataObject.students.length; r++ )
	           {
	            var x=document.getElementById('display-table').insertRow(r + 1);//Need to add offset for header
	            for(var c=0;c<col.length;c++)  
	             {
	              var y=  x.insertCell(c);
		              console.log("dataObject.students[r][col[c]]:" + dataObject.students[r][col[c]]);
	              y.innerHTML=dataObject.students[r][col[c]];
	             }
	            }
	           
	           
		  }
  }

  function doJSON1()
  {
	  console.log("doJSON:" + arguments[0]);
	  //var obj, dbParam, dataObject, x, txt = "";
	  //var dataObject, x, txt = "";
	  var x, txt = "";
	  //obj = { table: "users", limit: 20 };
	  //dbParam = JSON.stringify(obj);
	  
	  console.log("Args:" + arguments.length);
	  if( arguments.length == 1 )
		  {
		  	dataObject = JSON.parse(arguments[0]);
		  	//dataObject1 = JSON.parse(arguments[0]);

	      	console.log("parsed:");
	      	
	      	console.log("dataObject.users.length:" + dataObject.users.length);
	      	var col = [];
	        for (var i = 0; i < dataObject.users.length; i++) 
	        {
	            for (var key in dataObject.users[i]) 
	            {
	            	console.log("key:" + key);

	                if (col.indexOf(key) === -1) {
	                    col.push(key);
	                }
	            }
	        }
	        console.log("col length:" + col.length);
	      	//Now load to table
	        txt += "<table border='1'>";
	        txt += "<tr>";
	        //Add headers
   	        for (var i = 0; i < col.length; i++) {
   	        	txt += "<th>" + col[i] + "</th>";	
   	        }
   	     	txt += "</tr>";
   	     	console.log("txt:" + txt);
	        //for (x in dataObject) {
	        for (var i = 0; i < dataObject.users.length; i++)
	        {
		      	console.log("dataObject:" + dataObject.users[i]);
		      	txt += "<tr>";
		      	txt += "<td>" + dataObject.users[i].name + "</td>";
		      	txt += "<td>" + dataObject.users[i].city + "</td>";
		      	txt += "<td>" + dataObject.users[i].cars.length + "</td>";
		      	txt += "<td>" + dataObject.users[i].job + "</td>";
		      	txt += "</tr>";
	        }
			txt += "</table>";
	        console.log("txt:" + txt);
	           document.getElementById("demo").innerHTML = txt;
		  }
  }
</script>

	<script>
	if (window.File && window.FileReader && window.FileList && window.Blob) {
		  // Great success! All the File APIs are supported.
		  //alert("Good to go!!!");
		} else {
		  alert('The File APIs are not fully supported in this browser.');
		}
	</script>
	<script>
	function memoryFunction()
	{
		document.getElementById("memSpace").innerHTML = localStorage.getItem("lastname");
	}
if (typeof(Storage) !== "undefined") {
	  // Store
	  localStorage.setItem("lastname", "Smith");
	  // Retrieve
	  document.getElementById("result").innerHTML = localStorage.getItem("lastname");
	} else {
	  document.getElementById("result").innerHTML = "Sorry, your browser does not support Web Storage...";
	}
	
</script>
<script>
var dataObject2 = {
		  "name":"John",
		  "age":30,
		  "cars": {
		  "car1":"Ford",
		  "car2":"BMW",
		  "car3":"Fiat"
		  },
		  "trs": [
			  "VW",
	          "Toyata"
		  ]
		  
		}
	console.log("dataObject2 x:" + dataObject2.trs[0]);
		document.getElementById("demo3").innerHTML += dataObject2.cars.car2 + "<br>";
		//or:
		document.getElementById("demo4").innerHTML += dataObject2.trs[0];
</script>
<script>
var dataObject3 = 
		{
		  "trs": 
			  [
			  {
			         "name": "John",
			         "city": "Berlin",
			         "cars": [
			            "audi",
			            "bmw"
			         ],
			         "job": "Teacher"			  
			  },
			  {
			             "name": "Mark",
			             "city": "Oslo",
			             "cars": [
			                "VW",
			                "Toyata"
			             ],
			             "job": "Doctor"			  }

			  ]
		}
	console.log("dataObject3 x:" + dataObject3.trs.length);
	console.log("dataObject3 x:" + dataObject3.trs[0].name);
	console.log("dataObject3 x:" + dataObject3.trs[1].name);
    for (x in dataObject3) {
    	console.log("x value:" + x);
    	console.log("x length:" + x.length);
      	console.log("Value:" + x[0].name);
      	console.log("Value:" + x.name);
      	console.log("dataObject:" + dataObject3[x][0].name);
    }
</script>
</body>
</html>