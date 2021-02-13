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
import java.util.Random;
import java.util.Vector;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Test;

import com.taskManager.web.model.Meeting;
import com.taskManager.web.model.Student;
import com.taskManager.web.util.MyFileTool;

//import net.minidev.json.JSONArray;
//import net.minidev.json.parser.JSONParser;

import com.taskManager.web.util.MyFileTool;

public class TestJStudents {

	@Test
	public void test() {
		//MyFileReader fr = new MyFileReader();
		String inFile = "C:\\Users\\tomha\\Documents\\studentsfirst.csv";
		String inFile2 = "C:\\Users\\tomha\\Documents\\studentslast.csv";

		//String inFile = fr.readFile("C:\\Users\\tomha\\git\\student-planner\\D1.txt");
		Vector<String> firstNames =  MyFileTool.readFile2(inFile);
		Vector<String> lastNames =  MyFileTool.readFile2(inFile2);

		System.out.println("ST:" + firstNames.size());
		System.out.println("ST:" + lastNames.size());
		int vLength = lastNames.size();
		String son[] = { "son", "man", "berg", "stein", "er" };
        for(int index = 0; index < vLength; index++) {
            //System.out.println(lastNames.get(index));
            for(int x = 0; x < son.length; x++) {
            	lastNames.add(lastNames.get(index) + son[x]);
            }
        }
		System.out.println("ST:" + lastNames.size());
		Random rand = new Random();
		//	public Student(int id, String name, String firstName,
		//String lastName, String dateOfBirth, String status, String grade)
		vLength = lastNames.size();
		int meetingId = 0;
		Vector<String> meetingTimes = new Vector<String>();
		JSONArray studentArray = new JSONArray();
		JSONArray meetingArray = new JSONArray();
        for(int index = 0; index < vLength; index++) {
        	Student aStudent = new Student();
        	int grade = rand.nextInt(6) + 8;
        	aStudent.setGrade(Integer.toString(grade));
        	if( grade >= 13 )
        	{
        		aStudent.setGrade("g");
        		aStudent.setStatus("graduated");
        	}
        	else 
        	{
        		aStudent.setStatus("enrolled");
        	}
        	aStudent.setFirstName(firstNames.get(rand.nextInt(firstNames.size()-1)));
        	aStudent.setLastName(lastNames.get(index));
        	aStudent.setId(1000 + index);
        	aStudent.setDateOfBirth(setDOB(grade, rand));
        	//System.out.println("Student:" + aStudent.toJSON().toString() );
        	studentArray.add(aStudent.toJSON());
            for(int x = 0; x < grade - 8; x++) {
            	//Adding meetings 20 per year
                for(int z = 0; z < 2; z++) {
            		String aDate = getDate(rand, x);
            		String aTime = getTime(rand);
            		while(meetingTimes.contains(aDate + aTime))
            		{
            			aDate = getDate(rand, x);
                		aTime = getTime(rand);
            		}
            		Meeting aMeeting = new Meeting(meetingId++, aStudent.getId(), "AD", "We met", aDate, aTime);
            		meetingArray.add(aMeeting.toJSON());
            		meetingTimes.add(aDate + aTime);
            		//System.out.println("Meeting:" + aMeeting.toJSON().toString() );
            		System.out.println("Meeting:" + meetingId + ":" +  aStudent.getId());
                }
            }
        }
		System.out.println("Students:" );
		JSONObject obj = new JSONObject();
		obj.put("students", studentArray);
		obj.put("meetings", meetingArray);
		JSONArray area = (JSONArray) obj.get("students");
		System.out.println("Students:" + area.size() );
		String fileName = "C:\\Users\\tomha\\git\\student-planner\\data.json";
		MyFileTool.writeToFile(fileName, obj.toString());

		assertTrue(true);
		//fail("Not yet implemented");
	}
	public String getDate(Random rand, int x)
	{
		String date = "";
    	int yr = 2021 - x;
    	int dy = rand.nextInt(27)+1;
    	int mnth = rand.nextInt(11)+1;
    	String str = "/"; 
		if( mnth < 10)
			date += "0" + mnth + str;
		else
			date += mnth + str;
		if( dy < 10)
			date += "0" + dy + str + yr;
		else
			date += dy + str + yr;
		return date;
	}
	public String getTime(Random rand)
	{
		String time = "";
    	int hr = rand.nextInt(7)+8;
    	int min = rand.nextInt(3) * 15;
    	String str = ":"; 
    	String mer = "AM";
    	if( hr >= 12 )
    		mer = "PM";
    	if( hr > 12 )
    		hr = hr - 12;
		if( hr < 10)
			time += "0" + hr + str;
		else
			time += hr + str;
		if( min <= 15)
			time += "00" + " " + mer;
		else
			time += min + " " + mer;
		return time;
	}

	public String setDOB(int grade, Random rand)
	{
		String dob = "";
		int mnth = rand.nextInt(11) + 1;
		int dy = rand.nextInt(27) + 1;
		int yr = (2021 - grade - 5) + rand.nextInt(2);
		String str = "/"; 
		if( mnth < 10)
			dob += "0" + mnth + str;
		else
			dob += mnth + str;
		if( dy < 10)
			dob += "0" + dy + str + yr;
		else
			dob += dy + str + yr;
		return dob;
	}
}
