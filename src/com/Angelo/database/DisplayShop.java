package com.Angelo.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Angelo.beans.Product;

public class DisplayShop {
	
	private Connection conn;
	
	public DisplayShop(Connection conn){
		this.conn = conn;
	}
	
	private void checkConnection(Connection conn) throws SQLException {
			
			if (conn == null) {
				throw new SQLException("Cannot connect to database at the moment, plese try again later.");
			}
	}
	
	public ArrayList<Product> createItemList() throws SQLException{
		
		ArrayList<Product> products = new ArrayList<Product>();
		checkConnection(conn);
		PreparedStatement stmt;
		String sql = "select * from products";
		stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			String prodName = rs.getString(2);
			String prodDesc = rs.getString(3);
			Double prodPric = rs.getDouble(4);
			String prodCate = rs.getString(5);
			Product item = new Product(prodName, prodDesc, prodPric, prodCate);
			products.add(item);
		}
		return products;
	}
	
	
}

