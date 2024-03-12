package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Manager {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;
	private String branch;
	private String dob;
	private String gender;
	private String email;
	private String doj;
	private double salary;
	private String password;
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	
	
	@Override
	public String toString() {
		return "Manager [id=" + id + ", name=" + name + ", branch=" + branch + ", dob=" + dob + ", gender=" + gender
				+ ", email=" + email + ", doj=" + doj + ", salary=" + salary + ", password=" + password + "]";
	}
	public Manager(String name, String branch, String dob, String gender, String email, String doj,
			double salary, String password) {
		super();
		
		this.name = name;
		this.branch = branch;
		this.dob = dob;
		this.gender = gender;
		this.email = email;
		this.doj = doj;
		this.salary = salary;
		this.password = password;
	}
	public Manager() {
		super();
		
	}
	
	
	
}
