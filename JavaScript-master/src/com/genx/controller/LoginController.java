package com.genx.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.genx.dao.LoginDao;
import com.genx.model.Login;
import com.genx.utils.MD5;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao;

	public void init() {
		loginDao = new LoginDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login/login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		authenticate(request, response);
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Login loginBean = new Login();
		String pass = MD5.getMd5(password);
		loginBean.setUsername(username);
		loginBean.setPassword(pass);
		
		HttpSession session = request.getSession();
		

		try {
			if (loginDao.validate(loginBean)) {
//			RequestDispatcher dispatcher = request.getRequestDispatcher("todo/todo-list.jsp");
//			dispatcher.forward(request, response);
		  
		    session.setAttribute("username", username);
			response.sendRedirect("todo/todo-list.jsp");
				
				
				
			} else {
//				HttpSession session = request.getSession();
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User or password incorrect');");
				out.println("location='login/login.jsp';");
				out.println("</script>");
//				out.println("<font color=red>Either user name or password is wrong </font>");
				// session.setAttribute("user", username);
				// response.sendRedirect("login.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
}
