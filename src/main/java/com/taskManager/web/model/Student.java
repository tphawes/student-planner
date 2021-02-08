package com.taskManager.web.model;

import java.util.Date;

public class Student {
	
	private int id;
    private String name;
    private String dateOfBirth;
    private String status;
	private String grade;
    
    /**
	 * @param id
	 * @param name
	 * @param dateOfBirth
	 * @param status
	 */
	public Student(int id, String name, String dateOfBirth, String status, String grade) {
		super();
		this.id = id;
		this.name = name;
		this.dateOfBirth = dateOfBirth;
		this.status = status;
		this.grade = grade;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
    public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
    public String toString() {
        return new String("Student name=" + name);
    }

}
