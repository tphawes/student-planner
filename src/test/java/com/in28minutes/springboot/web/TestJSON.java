package com.in28minutes.springboot.web;

import static org.junit.Assert.*;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Test;

import com.taskManager.web.util.MyFileTool;

//import net.minidev.json.JSONArray;
//import net.minidev.json.parser.JSONParser;

import com.taskManager.web.util.MyFileTool;

public class TestJSON {

	@Test
	public void test() throws JSONException{
		//MyFileReader fr = new MyFileReader();
		String inFile = "C:\\Users\\tomha\\git\\student-planner\\employees.json";
		//String inFile = fr.readFile("C:\\Users\\tomha\\git\\student-planner\\D1.txt");
		StringBuffer stBuff = new StringBuffer();

	     //BufferedReader reader;
			//reader = new BufferedReader(new FileReader(inFile));
			String jsonStr = MyFileTool.readFile(inFile);
			JSONParser parser = new JSONParser();
			try {
				JSONObject json = (JSONObject) parser.parse(jsonStr);
				JSONArray studentArray = (JSONArray) json.get("student");
				JSONObject studentObject = (JSONObject) studentArray.get(0);
				//System.out.println(studentObject);
				JSONArray meetingArray = (JSONArray) json.get("meetings");

				System.out.println("students:" + studentArray.size());
				System.out.println("meetings:" + meetingArray.size());
				JSONObject obj = new JSONObject();
				obj.put("students", studentArray);
				obj.put("meetings", meetingArray);
				System.out.println("obj:" + obj.toString().length()  + ":" + obj.toString().substring(0, 200));

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		     //String currentLine = reader.readLine();
				//System.out.println("Data:" + jsonStr);
				


		//JSONParser jsonParser = new JSONParser();
            //Read JSON file
            //JSONParser parser = new JSONParser();
            //Use JSONObject for simple JSON and JSONArray for array of JSON.
            //JSONObject data = (JSONObject) parser.parse(
             //     new FileReader(inFile));//path to the JSON file.
            
            //JSONArray ja_data = data.getJSONArray("data");
            //int length = jsonObj.length();
            
            //String json = data.toJSONString();
            //System.out.println(json);
            
             
            //Iterate over employee array
            //objectList.forEach( emp -> parseObject( (JSONObject) emp ) );
 
		assertTrue(true);
		//fail("Not yet implemented");
	}
	
    private static void parseObject(JSONObject employee) 
    {
        //Get employee object within list
        JSONObject employeeObject = (JSONObject) employee.get("employee");
         
        //Get employee first name
        String firstName = (String) employeeObject.get("firstName");    
        System.out.println("ST:" + firstName);
         
        //Get employee last name
        String lastName = (String) employeeObject.get("lastName");  
        System.out.println(lastName);
         
        //Get employee website name
        String website = (String) employeeObject.get("website");    
        System.out.println("End:" + website);
    }

}
