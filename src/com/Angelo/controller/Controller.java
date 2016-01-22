package com.Angelo.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Angelo.beans.User;

/**
 * Servlet implementation class Controller
 */
//@WebServlet("/Controller")
@WebServlet(name = "Controller", urlPatterns = {"/Controller"}) // add /*
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// PAGE LOGIC
		// route user
		// check handle form (non)submission ---> user routed to register page
		// handle register page accessed via url bar 
		
		// set errors to empty strings
		User standardUser = new User();
		HashMap<String,String> errors = standardUser.getErrors();
		// create an attribute called errors:
		//it'll be used when redisplaying the form
		request.setAttribute("errors", errors);
		
		// create page variable
		String pageToGo = "";
		
		// get destination and action parameters
		String destination = request.getParameter("dest");
		String action = request.getParameter("action");
		
		// create attributes from destination and action:
		// they will be used in the ActionController servlet
		request.setAttribute("dest", destination);
		request.setAttribute("act", action);
		
		// determine page value
		if (destination == null) {
			pageToGo += "/index.jsp"; 
		}
		else {
			switch (destination) {
			
				case "shop" : pageToGo += "/shop.jsp"; break;
				case "join" : pageToGo += "/joinus.jsp"; break;
				case "home" : pageToGo += "/index.jsp"; break;
				case "site" : pageToGo += "/sitemap.jsp"; break;
				case "reg" : pageToGo += "/ActionController"; break;
				case "sign" : pageToGo += "/ActionController"; break;
				default: pageToGo += "/error.jsp"; break;
			}
		}
		// redirect or forward accordingly
		RequestDispatcher dispatcher = request.getRequestDispatcher(pageToGo);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String action = request.getParameter("action");
		request.setAttribute("act", action);
		String pageToGo = "";
		
		if (action != null){
			pageToGo += "/ActionController";	
		}
		
		else {
			pageToGo += "/error.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(pageToGo);
		dispatcher.forward(request, response);
		
		//will be true only if the form has been submitted 
		/*else if (action.equals("dosignup")) {
			
			String first = request.getParameter("first").trim();
			String last = request.getParameter("last").trim();
			String email = request.getParameter("email").trim();
			String pwd = request.getParameter("pwd");
			
			request.setAttribute("email", email);
			request.setAttribute("first", first);
			request.setAttribute("last", last);
			request.setAttribute("pwd", pwd); // shall I set an attribute for the password??? security???
			
			User user = new User(first,last,email,pwd);
			
			if(user.validate()) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/process.jsp");
				dispatcher.forward(request, response);	
			}
			else {
				request.setAttribute("class", "error");
				String notification = "Please correct wrong entries";
				request.setAttribute("notification", notification);
				
				String[] errors = user.getErrors();
				request.setAttribute("errors", errors);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
				dispatcher.forward(request, response);	
			}
		}
		else if (action.equals("dologin")) {
			
			String email = request.getParameter("email").trim();
			String pwd = request.getParameter("pwd");
			
			request.setAttribute("email", email);
			request.setAttribute("pwd", pwd); // shall I set an attribute for the password??? security???
			
			User user = new User(email,pwd);
			
			//Account account = new Account(cn);
			
			if(user.validate()) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/process.jsp");
				dispatcher.forward(request, response);	
			}
			else {
				request.setAttribute("class", "error");
				String notification = "Please correct wrong entries";
				request.setAttribute("notification", notification);
				
				String[] errors = user.getErrors();
				request.setAttribute("errors", errors);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/signin.jsp");
				dispatcher.forward(request, response);	
			}
		}*/
	}

}
