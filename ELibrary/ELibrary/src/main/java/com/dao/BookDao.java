package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Book;
import com.entities.Librarian;


public class BookDao {
	
	private Connection c;

	public BookDao(Connection c) {
		super();
		this.c = c;
	}
	
	public boolean addBook(String title,String author,String date,int qty) {
		boolean f = false;
		try {
			
			String q = "insert into book(title,author,date,quantity) values(?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setString(1, title);
			ps.setString(2, author);
			ps.setString(3, date);
			ps.setDouble(4, qty);
			int r = ps.executeUpdate();
			
			if(r==1) {
				f = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Book> getAllBooks(){
		List<Book> books = new ArrayList<Book>();
		Book book = null;
		try {
			
			String q = "select * from book";
			PreparedStatement ps = c.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				book = new Book();
				book.setSno(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setDateOfPurchase(rs.getString(4));
				book.setPrice(rs.getInt(5));
				books.add(book);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return books;
	}
	
	public boolean deleteBook(int sno) {
		boolean f = false;
		try {
			
			String q = "delete from book where sno=?";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setInt(1, sno);
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public Book getBookBySNO(int sno) {
		Book book = null;
		try {
			String q = "select * from book where sno=?";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setInt(1, sno);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				book = new Book();
				book.setSno(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setDateOfPurchase(rs.getString(4));
				book.setPrice(rs.getInt(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}
	
	public boolean updateBook(int sno,String title,String author,String date,int quantity) {
		boolean f = false;
		try {
			String q = "update book set title=?,author=?,date=?,quantity=? where sno = ?";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setString(1, title);
			ps.setString(2, author);
			ps.setString(3, date);
			ps.setInt(4, quantity);
			ps.setInt(5, sno);
			int i = ps.executeUpdate();
			
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean balanceBook(int regSno) {
		
		int qty = fintQuantity(regSno);
		 
		boolean f = false;
		if(qty>0) {
			try {
				String q = "update book set quantity = ? where sno = ?";
				PreparedStatement ps = c.prepareStatement(q);
				ps.setInt(1, qty-1);
				ps.setInt(2, regSno);
				int i = ps.executeUpdate();
				if(i==1) {
					f = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return f;
	}

	private int fintQuantity(int regSno) {
		int i = 0;
		try {
			String q = "select quantity from book where sno=?";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setInt(1, regSno);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			i = rs.getInt(1);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

}
