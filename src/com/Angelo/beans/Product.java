package com.Angelo.beans;

public class Product {
	
	String prodName = "default_name";
	String prodDesc = "default_description";
	Double prodPric = 0.0;
	String prodCate = "default_category";
	
	public Product(String name, String description, Double price, String category) {
		this.prodName = name;
		this.prodDesc = description;
		this.prodPric = price;
		this.prodCate = category;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getProdDesc() {
		return prodDesc;
	}

	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}

	public Double getProdPric() {
		return prodPric;
	}

	public void setProdPric(Double prodPric) {
		this.prodPric = prodPric;
	}

	public String getProdCate() {
		return prodCate;
	}

	public void setProdCate(String prodCate) {
		this.prodCate = prodCate;
	}
}
