package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Book;
import com.entities.IssueBook;

public class IssueBookDao {

	private Connection c;

	public IssueBookDao(Connection c) {
		super();
		this.c = c;
	}
	
	public boolean issueBook(int regSno,String title,String author,String date,String name,String address,String librarian) {
		boolean f  = false;
		try {
			
			String q = "insert into issue_book(reg_no,title,author,date_of_issue,name_of_candidate,address,librarian_name) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setInt(1, regSno);
			ps.setString(2, title);
			ps.setString(3, author);
			ps.setString(4, date);
			ps.setString(5, name);
			ps.setString(6, address);
			ps.setString(7, librarian);
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<IssueBook> getAllIssueBooks(){
		List<IssueBook> issuebooks = new ArrayList<IssueBook>();
		IssueBook book = null;
		try {
			
			String q = "select * from issue_book";
			PreparedStatement ps = c.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				book = new IssueBook();
				book.setSno(rs.getInt(1));
				book.setRegNo(rs.getInt(2));
				book.setTitle(rs.getString(3));
				book.setAuthor(rs.getString(4));
				book.setDateOfIssue(rs.getString(5));
				book.setName(rs.getString(6));
				book.setAddress(rs.getString(7));
				book.setDateOfReturn(rs.getString(8));
				book.setLibrarian(rs.getString(9));
				issuebooks.add(book);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return issuebooks;
	}
	
	
}
