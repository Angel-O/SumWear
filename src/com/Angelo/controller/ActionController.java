package com.Angelo.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Angelo.beans.User;

/**
 * Servlet implementation class ActionController
 */
@WebServlet("/ActionController")
public class ActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String destination = (String) request.getAttribute("dest"); // set in the Controller
		//String destination = request.getParameter("dest"); // would allow entering data from address bar...not needed
		String pageToGo = null;
		String action = (String) request.getAttribute("act"); // set in the Controller
		request.setAttribute("notification", "Please enter your data");
		request.setAttribute("email", "");
		request.setAttribute("pwd", "");
		User standardUser = new User();
		HashMap<String,String> errors = standardUser.getErrors();
		request.setAttribute("errors", errors);
		request.setAttribute("h5class", "prompt");
		request.setAttribute("first", "");
		request.setAttribute("last", "");
		
		if (action == null){
			if(destination == null) {
				pageToGo = "/index.jsp";
			}
			else {
				switch (destination) {
				case "reg": pageToGo = "/WEB-INF/register.jsp"; break;
				case "sign": pageToGo = "/WEB-INF/signin.jsp"; break;
				case "bye": {
					HttpSession session = request.getSession(); 
					session.invalidate(); 
					pageToGo = "/index.jsp"; break;
				}
				default: pageToGo = "/error.jsp"; break;
				}
			}
		}
		else {
			pageToGo = "/error.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(pageToGo);
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = (String) request.getAttribute("act");
		String email = request.getParameter("email").trim();
		String pwd = request.getParameter("pwd");
		
		request.setAttribute("email", email);
		request.setAttribute("pwd", pwd); // shall I set an attribute for the password??? security???
		
		String pageToGo = "";
		
		switch (action) {
		
			case "dosignup": {
				String first = request.getParameter("first").trim();
				String last = request.getParameter("last").trim();
				String confirm = request.getParameter("confirm").trim();
				request.setAttribute("first", first);
				request.setAttribute("last", last);
				
				User user = new User(first,last,email,pwd,confirm);
				pageToGo += choosePage(action, user, request, response);
				
			}; break;
			
			case "dologin": {
				User user = new User(email,pwd);
				pageToGo += choosePage(action, user, request, response);
				
			}; break;
			
			default: pageToGo += "/error.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(pageToGo);
		dispatcher.forward(request, response);
	}
	
	private String choosePage(String action, User user, HttpServletRequest request, HttpServletResponse response) {
		
		if(user.validate(action)) {
			
			return "/DBmanagerJndi";
			/*switch (action) {
				case("dosignup"): return "/DBmanagerJndi";
				case("dologin"): return "/DBmanagerJndi";
				default: return "/error.jsp";
			}*/		
		}
		else{
			request.setAttribute("h5class", "error");
			String notification = "Please correct wrong entries";
			request.setAttribute("notification", notification);
			HashMap<String,String> errors = user.getErrors();
			request.setAttribute("errors", errors);
			
			switch (action) {
				case("dosignup"): return "/WEB-INF/register.jsp";
				case("dologin"): return "/WEB-INF/signin.jsp";
				default: return "/error.jsp";
			}	
		}
	}
}
