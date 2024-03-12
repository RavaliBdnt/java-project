package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entities.Admin;

import com.mysql.cj.xdevapi.PreparableStatement;

public class AdminDao {

	private Connection c;
	
	
	
	public AdminDao(Connection c) {
		super();
		this.c = c;
	}



	public Admin login(String email,String password) {
		Admin admin = null;
		
		try {
			String q = "select * from admin where emailId=? and password=?";
			PreparedStatement ps = c.prepareStatement(q);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				admin = new Admin();
				admin.setId(rs.getInt(1));
				admin.setName(rs.getString(2));
				admin.setEmailId(rs.getString(3));
				admin.setPassword(rs.getString(4));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return admin;
	}
}
