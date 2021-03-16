package com.taskManager.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.taskManager.web.model.Student;
import com.taskManager.web.service.StudentService;


@Controller
@SessionAttributes("name")
public class TestController {

	@Autowired
	StudentService service;
	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String getController(ModelMap model){
		System.out.println("Test GET:");
		List<Student> studentList = service.retrieveStudents();
		model.put("studentList", studentList);
		return "test2";
	}

	
	@RequestMapping(value="/test", method = RequestMethod.POST)
	//public String postController(ModelMap model, @RequestParam String name, @RequestParam String password){
	public String postController(ModelMap model, @RequestParam int addStudent, @RequestParam String name, @RequestParam String dob, @RequestParam String status, @RequestParam String grade){
		List<Student> studentList = service.retrieveStudents();
		System.out.println("Student list size:" + studentList.size());
		System.out.println("Student name:" + studentList.get(0).getName());
		System.out.println("Test POST addStudent:" + addStudent);
		switch(addStudent) {
		  case 0://Add
			  service.addStudent(name, dob, status, grade);
			  break;
		  case 1://Update
			  break;
		  case 2://Delete
			  break;
		  default:
		}
		//model.put("name", name);
		//model.put("password", password);
		model.put("studentList", studentList);
		return "test";
	}
	@RequestMapping(value="/testDelete", method = RequestMethod.POST)
	public String deleteController(ModelMap model, @RequestParam int deleteIndex){
		System.out.println("Test DELETE:" + service.retrieveStudents().size());
		service.deleteStudent(deleteIndex);
		List<Student> studentList = service.retrieveStudents();
		model.put("studentList", studentList);
		System.out.println("Test DELETE:" + studentList.size());
		return "test";
	}

}
