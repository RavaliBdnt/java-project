package com.test;

public class Id {

	int id;
	String name;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Id(int id,String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Id() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Id [id=" + id + ", name=" + name + "]";
	}

	
	
	
}
