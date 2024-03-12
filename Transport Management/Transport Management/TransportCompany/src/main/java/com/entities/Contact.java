package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Contact {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String topic;
	@Column(length = 499)
	private String message;
	private String nameOfContactPerson;
	private String email;
	private String phoneNumber;
	
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getNameOfContactPerson() {
		return nameOfContactPerson;
	}
	public void setNameOfContactPerson(String nameOfContactPerson) {
		this.nameOfContactPerson = nameOfContactPerson;
	}

	
	
	
	public Contact(String topic, String message, String nameOfContactPerson, String email, String phoneNumber) {
		super();
		this.topic = topic;
		this.message = message;
		this.nameOfContactPerson = nameOfContactPerson;
		this.email = email;
		this.phoneNumber = phoneNumber;
	}
	
	
	
	public Contact(String topic, String message, String nameOfContactPerson) {
		super();
		
		this.topic = topic;
		this.message = message;
		this.nameOfContactPerson = nameOfContactPerson;
	}
	@Override
	public String toString() {
		return "Contact [id=" + id + ", topic=" + topic + ", message=" + message + ", nameOfContactPerson="
				+ nameOfContactPerson + ", email=" + email + ", phoneNumber=" + phoneNumber + "]";
	}
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
