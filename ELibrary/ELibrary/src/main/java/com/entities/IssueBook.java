package com.entities;

public class IssueBook {
	
	private int sno;
	private int regNo;
	private String title;
	private String author;
	private String dateOfIssue;
	private String name;
	private String address;
	private String dateOfReturn;
	private String librarian;
	
	
	public IssueBook(int sno, int regNo, String title, String author, String dateOfIssue, String name, String address,
			String dateOfReturn, String librarian) {
		super();
		this.sno = sno;
		this.regNo = regNo;
		this.title = title;
		this.author = author;
		this.dateOfIssue = dateOfIssue;
		this.name = name;
		this.address = address;
		this.dateOfReturn = dateOfReturn;
		this.librarian = librarian;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getRegNo() {
		return regNo;
	}
	public void setRegNo(int regNo) {
		this.regNo = regNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDateOfIssue() {
		return dateOfIssue;
	}
	public void setDateOfIssue(String dateOfIssue) {
		this.dateOfIssue = dateOfIssue;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDateOfReturn() {
		return dateOfReturn;
	}
	public void setDateOfReturn(String dateOfReturn) {
		this.dateOfReturn = dateOfReturn;
	}
	public String getLibrarian() {
		return librarian;
	}
	public void setLibrarian(String librarian) {
		this.librarian = librarian;
	}
	@Override
	public String toString() {
		return "IssueBook [sno=" + sno + ", regNo=" + regNo + ", title=" + title + ", author=" + author
				+ ", dateOfIssue=" + dateOfIssue + ", name=" + name + ", address=" + address + ", dateOfReturn="
				+ dateOfReturn + ", librarian=" + librarian + "]";
	}
	public IssueBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	

}
