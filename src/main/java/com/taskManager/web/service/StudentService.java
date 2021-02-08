package com.taskManager.web.service;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;

import com.taskManager.web.model.Student;


@Service
public class StudentService {
    private static List<Student> students = new ArrayList<Student>();
    private static int StudentCount = 4;//we start with 4 static students

    static {
    	Format f = new SimpleDateFormat("MM/dd/yy");
    	String strDate = f.format(new Date());
    	students.add(new Student(0, "Red", strDate, "Enrolled", "12"));
        students.add(new Student(1, "Ted", strDate, "Enrolled", "9"));
        students.add(new Student(2, "Fred", strDate, "Enrolled", "10"));
        students.add(new Student(3, "Mary", strDate, "Withdrawn", "11"));
        students.add(new Student(4, "Betty", strDate, "Enrolled", "11"));
        students.add(new Student(5, "Jenny", strDate, "Graduated", "n/a"));
        students.add(new Student(6, "Sarah", strDate, "N/A", "8"));
        System.out.println("Students size:" + students.size());
    }

    public List<Student> retrieveStudents(String user) {
        List<Student> filteredstudents = new ArrayList<Student>();
        for (Student Student : students) {
            if (Student.getName().equals(user)) {
                filteredstudents.add(Student);
            }
        }
        return filteredstudents;
    }
    
    public List<Student> retrieveStudents() {
        return students;
    }
    

    public void addStudent(String name, String targetDate,  String status, String grade) {
        students.add(new Student(++StudentCount, name, targetDate, status, grade));
    }

    public void updateStudent(String name, String targetDate,  String status, String grade, int id) {
    	Student aStudent = students.get(id);
    	aStudent.setName(name);
    	aStudent.setDateOfBirth(targetDate);
    	aStudent.setStatus(status);
    	aStudent.setGrade(grade);
    }
    
    
    public void deleteStudent(int id) {
        Iterator<Student> iterator = students.iterator();
        while (iterator.hasNext()) {
            Student Student = iterator.next();
            if (Student.getId() == id) {
                iterator.remove();
            }
        }
    }
}