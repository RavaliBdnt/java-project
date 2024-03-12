package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entities.Librarian;

public class LibrarianDao {

	private Connection c;

	public LibrarianDao(Connection c) {
		super();
		this.c = c;
	}
	
	public boolean addEmployee(String name,String email,String password) {
		boolean f = false;
		
		try {
			
			String q = "insert into librarian(name,email,password) values(?,?,?)";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f =true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Librarian> getAllLibrarians(){
		List<Librarian> librarians = new ArrayList<Librarian>();
		Librarian librarian = null;
		try {
			
			String q = "select * from librarian";
			PreparedStatement ps = c.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				librarian = new Librarian();
				librarian.setId(rs.getInt(1));
				librarian.setName(rs.getString(2));
				librarian.setEmail(rs.getString(3));
				librarians.add(librarian);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return librarians;
	}
	
	public boolean deleteLibrarian(int id) {
		boolean f = false;
		try {
			
			String q = "delete from librarian where id=?";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public Librarian getLibrarianById(int id) {
		Librarian librarian = null;
		try {
			String q = "select * from librarian where id=?";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				librarian = new Librarian();
				librarian.setId(rs.getInt(1));
				librarian.setName(rs.getString(2));
				librarian.setEmail(rs.getString(3));
				librarian.setPassword(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return librarian;
	}
	
	public boolean updateEmployee(int id,String name,String email,String password) {
		boolean f = false;
		try {
			String q = "update librarian set name=?,email=?,password=? where id = ?";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setInt(4, id);
			int i = ps.executeUpdate();
			
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public Librarian loginLibrarian(String email,String password) {
		Librarian librarian = null;
		try {
			String q = "select * from librarian where email=? and password=?";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				librarian = new Librarian();
				librarian.setId(rs.getInt(1));
				librarian.setName(rs.getString(2));
				librarian.setEmail(rs.getString(3));
				librarian.setPassword(rs.getString(4));
				
				
			}
					
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return librarian;
	}
	
	
}
