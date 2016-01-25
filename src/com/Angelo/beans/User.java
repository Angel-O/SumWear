package com.Angelo.beans;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;


public class User {
	
	private String first = "";
	private String last = "";
	private String email = "";
	private String pwd = "";
	private String confirm = "";
	private String notification = "";
	private boolean loggedin = false;
	private HashMap<String,String> errors = new HashMap<String,String>();
	
	
	public User() {
		this.errors.put("firstError", "");
		this.errors.put("lastError", "");
		this.errors.put("emailError", "");
		this.errors.put("pwdError", "");
		this.errors.put("confirmError", "");
	}
	// used to sign up
	public User(String first, String last, String email, String pwd, String confirm) {
		this.first = first;
		this.last = last;
		this.email = email;
		this.pwd = pwd;
		this.confirm = confirm;
		this.errors.put("firstError", "");
		this.errors.put("lastError", "");
		this.errors.put("emailError", "");
		this.errors.put("pwdError", "");
		this.errors.put("confirmError", "");
	}
	// used to log in
	public User(String email, String pwd) {
		this.email = email;
		this.pwd = pwd;
		this.errors.put("emailError", "");
		this.errors.put("pwdError", "");
	}
	// used after logging in
	public User(String first, String email, boolean loggedin) {
		this.first = first;
		this.email = email;
		this.loggedin = loggedin;
	}
	public String getFirst() {
		return first;
	}
	public void setFirst(String first) {
		this.first = first;
	}
	public String getLast() {
		return last;
	}
	public void setLast(String last) {
		this.last = last;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNotification() {
		return this.notification;
	}
	public boolean isLoggedin(){
		return this.loggedin;
	}
	
	public HashMap<String, String> getErrors(){
		return this.errors;
	}
	
	// fix validation!!!!
	public boolean validate(String action) {
		
		String err = "";
		
		err = emailCheck(email);
		this.errors.put("emailError", err);
		
		err = pwdCheck(pwd);
		this.errors.put("pwdError", err);
		
		if(action.equals("dosignup")) {
			
			err = nameCheck(first);
			this.errors.put("firstError", err);
			
			err = nameCheck(last);
			this.errors.put("lastError", err);
			
			err = confirmCheck(pwd, confirm);
			this.errors.put("confirmError", err);
		}
		
		Set<String> messages = errors.keySet();
		Iterator<String> iter = messages.iterator();
		while (iter.hasNext()){
			String key = iter.next();
			if (!errors.get(key).equals("")) {
				return false;
			}
		}
		return true;
	}
	
	private String nameCheck(String par){
		String error = "";
		// field cannot be empty
		if (par != null && !par.isEmpty()) { 
			// if entered it cannot be too long...
			// but spaces are counted as characters...
			if (par.length() >= 11) {
				error =  "Field cannot be longer than 10 characters";
			}
		}
		else error = "Field cannot be empty";
		return error;
	}
	
	private String emailCheck(String par){
		String error = "";
		// field cannot be empty
		if (par != null && !par.isEmpty()) { 
			// if entered it has to be a valid email address...
			if (!par.matches("\\w+@\\w+\\.\\w+")) {
				error = "Invalid email address";
			}
		}
		else error = "Field cannot be empty";
		return error;
	}
	
	private String pwdCheck(String par){
		String error = "";
		// field cannot be empty
		if (par != null && !par.isEmpty()) { 
			// if entered it has to be a valid password...
			if (!par.matches("\\w*\\s+\\w*")) {
				if (par.length() < 4) {  // length check
					error = "Password must be at least 4 characters long";
				}
			}
			else {  // space check
				error = "Password cannot contain spaces";
			}
		}
		else error = "Field cannot be empty";
		return error;
	}
	
	private String confirmCheck(String par1, String par2){
		String error = "";
		// field cannot be empty
		if (par2 != null && !par2.isEmpty()) { 
			// if entered it has to match the password
			if (!par1.equals(par2)) {
				error = "Passwords do not match";
			}
		}
		else error = "Field cannot be empty";
		return error;
	}
}
