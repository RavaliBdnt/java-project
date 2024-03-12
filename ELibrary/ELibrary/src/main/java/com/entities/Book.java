package com.entities;

public class Book {

	private int sno;
	private String title;
	private String author;
	private String dateOfPurchase;
	private int quantity;
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
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
	public String getDateOfPurchase() {
		return dateOfPurchase;
	}
	public void setDateOfPurchase(String dateOfPurchase) {
		this.dateOfPurchase = dateOfPurchase;
	}
	public double getPrice() {
		return quantity;
	}
	public void setPrice(int qty) {
		this.quantity  = qty;
	}
	public Book(String title, String author, String dateOfPurchase, int quantiy) {
		super();
		this.title = title;
		this.author = author;
		this.dateOfPurchase = dateOfPurchase;
		this.quantity = quantiy;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Book [sno=" + sno + ", title=" + title + ", author=" + author + ", dateOfPurchase=" + dateOfPurchase
				+ ", quantity=" + quantity + "]";
	}
	
	
}
