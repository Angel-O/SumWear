package com.Angelo.connect;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.Angelo.beans.Product;
import com.Angelo.beans.User;
import com.Angelo.database.Account;
import com.Angelo.database.DisplayShop;

/**
 * Servlet implementation class DBmanagerJndi
 */
@WebServlet("/DBmanagerJndi")
public class DBmanagerJndi extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	private DataSource ds;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBmanagerJndi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			InitialContext initContext = new InitialContext();
			Context env = (Context) initContext.lookup("java:comp/env");
			ds = (DataSource) env.lookup("jdbc/sumwear");
			
		} catch (NamingException e) {
			throw new ServletException();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String destination = (String) request.getAttribute("dest");
		
		// at the moment only one destination leads to this controller...
		if (destination != null) {
			
			// try and open connection with data source
			Connection conn = null;
			try {
				conn = ds.getConnection();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				out.println("NOT Connected to database: GET");
				return;
			}
			
			// use connection
			// out.println("Connected to database: GET");
			ArrayList<Product> itemList = new ArrayList<Product>();
			DisplayShop shop = new DisplayShop(conn);
			try {
				itemList = shop.createItemList();
				request.setAttribute("itemList", itemList);
				request.getRequestDispatcher("/newshop.jsp").forward(request, response);
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				//e1.printStackTrace(); return;
				out.println("database under maintenance");
			}
			
			// close connection
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		PrintWriter out = response.getWriter();
		
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException | NullPointerException e) {	
			out.println("Cannot connect to database at the moment, please try again later");
			return;
		}
		
		// use connection
		// out.println("Connected to database");
		
		Account account = new Account(conn);
		String email = (String) request.getAttribute("email");
		String password = (String) request.getAttribute("pwd");
		HashMap<String, String> errors = new HashMap<String,String>();
		String action = (String) request.getAttribute("act");
		String pageToGo = "";
		
		try {
			switch (action){
				case "dologin" : {
					
					/*if (account.signin(email, password)){
						pageToGo += "/process.jsp";
						// to do: create session...
						HttpSession session = request.getSession();
						session.setAttribute("loggedInUser", new User());
						
					}*/
					String name = account.signin(email, password);
					if (!name.equals("")){
						pageToGo += "/index.jsp";
						// to do: create session...
						HttpSession session = request.getSession();
						session.setAttribute("loggedInUser", new User(name, email, true));	
					}
					else{
						//inline errors not needed. If we got to this point the data has already been validated
						User standardUser = new User();
						errors = standardUser.getErrors();
						request.setAttribute("errors", errors);
						
						request.setAttribute("class", "error");
						String notification = "Password/Email mismatch: user not recognized";
						request.setAttribute("notification", notification);
						pageToGo += "/WEB-INF/signin.jsp";	
					}
				}break;
				
				case "dosignup" : {
					if (!account.exists(email)) {
						String first = (String) request.getAttribute("first");
						String last = (String) request.getAttribute("last");
						account.createAccount(email, password, first, last);
						pageToGo += "/welcome.jsp";
						
						HttpSession session = request.getSession();
						session.setAttribute("loggedInUser", new User(first, email, true));	
					}
					else{
						//inline errors not needed. If we got to this point the data has already been validated
						User standardUser = new User();
						errors = standardUser.getErrors();
						request.setAttribute("errors", errors);
						
						request.setAttribute("class", "error");
						String notification = "The email address entered is already on file";
						request.setAttribute("notification", notification);
						pageToGo += "/WEB-INF/register.jsp";
					}
				}break;
				
				default: pageToGo = "/error.jsp"; break;
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(pageToGo);
			dispatcher.forward(request, response);
			
		} catch (SQLException e) {
			out.println("Something went wrong, try again later");
		}
		
		try {
			conn.close();
		} catch (SQLException | NullPointerException e) {
			
			out.println("bye");
		}
	}

}
