package com.taskManager.web.model;

import org.json.simple.JSONObject;

public class Meeting {
	private int id;
	private int studentId;
	private String code;
	private String notes;
	private String date;
	private String time;
	public Meeting(int id, int studentId, String code, String notes, String date, String time) {
		super();
		this.id = id;
		this.studentId = studentId;
		this.code = code;
		this.notes = notes;
		this.date = date;
		this.time = time;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
    public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public JSONObject toJSON() {
        JSONObject obj = new JSONObject();
        obj.put("id",this.getId());
        obj.put("studentId",this.studentId);
        obj.put("code",this.code);
        obj.put("notes",this.notes);
        obj.put("date",this.date);
        obj.put("time",this.time);
        return obj;
    }
}
