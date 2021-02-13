
package com.taskManager.web.model;

import java.util.Date;

import org.json.simple.JSONObject;

public class Student {
	
	public Student(int id, String name, String firstName, String lastName, String dateOfBirth, String status,
			String grade) {
		super();
		this.id = id;
		this.name = name;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.status = status;
		this.grade = grade;
	}

	private int id;
    private String name;
    private String firstName;
    private String lastName;
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
	public Student() {
		// TODO Auto-generated constructor stub
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
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	@Override
    public String toString() {
        return new String("Student name=" + name);
    }
	
    public JSONObject toJSON() {
        JSONObject obj = new JSONObject();
        obj.put("firstName",this.firstName);
        obj.put("lastName",this.lastName);
        obj.put("id",this.id);
        obj.put("dob",this.dateOfBirth);
        obj.put("status",this.status);
        obj.put("grade",this.grade);
        return obj;
    }
}
