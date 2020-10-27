package com.genx.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class LogoutServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		PrintWriter out = response.getWriter();
//
//		request.getRequestDispatcher("login/login.jsp").include(request, response);
//
		HttpSession session = request.getSession(false);
		
		
		 response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	     response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
	     response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	     response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		session.setAttribute("username", null);
		session.invalidate();
		response.sendRedirect("login/login.jsp");
//	  out.print("You are successfully logged out!");

		
	}
}
