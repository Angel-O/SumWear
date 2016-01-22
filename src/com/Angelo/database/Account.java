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
	
	private void checkConnection(Connection conn) throws SQLException {
		
		if (conn == null) {
			throw new SQLException("Cannot connect to database at the moment, plese try again later.");
		}
	}
	
	public boolean signin(String email, String password) throws SQLException {
		
		checkConnection(conn);
		// handle no connection....
		String sql = "select count(*) as count from users where email=? and password=?";
		
		PreparedStatement stmt = null;
		int count = 0;
		
		stmt = conn.prepareStatement(sql);
		
			
		stmt.setString(1, email);
		stmt.setString(2, password);
		ResultSet rs = stmt.executeQuery();
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
		
		checkConnection(conn);
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
		
		checkConnection(conn);
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
