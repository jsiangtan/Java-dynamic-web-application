package com;
import java.util.ArrayList;
import java.util.List;

public class Student {
	private String studentID;
	private String studentName;
	private String department;
	private String mark;
	
	public void setStudentID (String studentID) {
		this.studentID = studentID;
	}
	
	public String getStudentID () {
		return studentID;
	}
	
	public void setStudentName (String studentName) {
		this.studentName = studentName;
	}
	
	public String getStudentName () {
		return studentName;
	}
	
	public void setDepartment (String department) {
		this.department = department;
	}
	
	public String getDepartment () {
		return department;
	}
	
	public void setMark (String mark) {
		this.mark = mark;
	}
	
	public String getMark () {
		return mark;
	}

	public List<Student> getStudentList(){
		List<Student> studentList = new ArrayList<Student>();
		String[][] details = {{"Dep 1","Marcus","35"},{"Dep 1","Edwin","70"}, {"Dep 1","Alex","60"},
				{"Dep 1","Jenny","90"}, {"Dep 2","Edward","30"}, {"Dep 3","Jessie","32"},
				{"Dep 3","John","70"},{"Dep 3","Alice","20"}};
		
		for(int i=0; i<8; i++) {
			Student student = new Student();
			
			student.setStudentID("S"+(i+1));
			student.setDepartment(details[i][0]);
			student.setStudentName(details[i][1]);
			student.setMark(details[i][2]);
			
			studentList.add(student);
		}
		return studentList;
	}
	
	public int getPassStatus() {
		if(Integer.parseInt(mark) >= 40 )
			return 1;
		else 
			return 0;
	}
}
