package com.taskManager.web.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.taskManager.web.model.Student;
import com.taskManager.web.service.StudentService;
import com.taskManager.web.util.MyFileTool;

@Controller
@SessionAttributes("name")
public class CalendarController {
	
	@Autowired
	StudentService service;
	
	@RequestMapping(value="/cal", method = RequestMethod.GET)
	public String showStudentPage(ModelMap model){

		String fileName = "C:\\Users\\tomha\\git\\student-planner\\data2.json";
		String jsonStr = MyFileTool.readFile(fileName);
		JSONObject json = null;
		JSONParser parser = new JSONParser();
		try {
			json = (JSONObject) parser.parse(jsonStr);
			JSONArray studentArray = (JSONArray) json.get("students");
			JSONArray meetingArray = (JSONArray) json.get("meetings");

			System.out.println("students:" + studentArray.size());
			System.out.println("meetings:" + meetingArray.size());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("jsonStr:" + jsonStr.length());
        model.put("fileName", fileName);
        String jsonStr2 = json.toString();
        model.addAttribute("dataJson", jsonStr);  
        //model.addAttribute("json", json.toJSONString());
        //model.addAttribute("data",jsonStr);
		model.put("name", "Trd");

		return "cal2";
	}
	
}

