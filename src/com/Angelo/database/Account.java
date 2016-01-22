package com.Angelo.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet; // right one??
import java.sql.SQLException;


public class Account {
	
	private Connection conn;
	
	public Account(Connection conn) {
		this.conn = conn;
	}
	
	public boolean signin(String email, String password) throws SQLException {
		
		// handle no connection....
		String sql = "select count(*) as count from users where email=? and password=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, email);
		stmt.setString(2, password);
		
		ResultSet rs = stmt.executeQuery();
		int count = 0;
		if(rs.next()) {
			
			 count = rs.getInt("count");
		}
		
		rs.close();
		
		if(count == 0){
			return false;
		}
		return true;
	}
	
	public boolean exists(String email) throws SQLException {
		
		String sql = "select count(*) as count from users where email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, email);
		
		ResultSet rs = stmt.executeQuery();
		int count = 0;
		if(rs.next()) {
			
			 count = rs.getInt("count");
		}
		
		rs.close();
		
		if(count == 1){
			return true;
		}
		return false;
	}
	
	public void createAccount(String email, String password, String first, String last) throws SQLException{
		
		String sql = "insert into users(email, password, first, last) values(?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, email);
		stmt.setString(2, password);
		stmt.setString(3, first);
		stmt.setString(4, last);
		
		stmt.executeUpdate();
		stmt.close();
	}
}
