package com.taskManager.web.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
public class StudentController {
	
	@Autowired
	StudentService service;
	
	@RequestMapping(value="/students", method = RequestMethod.GET)
	public String showStudentPage(ModelMap model){
		List<Student> studentList = service.retrieveStudents();
		System.out.println("Student list size:" + studentList.size());
		System.out.println("Student name:" + studentList.get(0).getName());
        model.addAttribute("studentList", studentList);
		model.put("name", "Trd");
		model.put("studentList", studentList);

		return "students3";
	}
	
}

