<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.util.ResourceBundle" %>


<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "demo";
String userid = "root";
String password = "afsaralam15";
try {
Class.forName(driver);
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility

if(request.getSession().getAttribute("username") == null){
	
  	// ResourceBundle.clearCache();
	RequestDispatcher dispatcher = request.getRequestDispatcher("/login/login.jsp");
	dispatcher.forward(request, response);
	
	}

} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
<meta http-equiv="Pragma" content="no-cache">
 <meta http-equiv="Cache-Control" content="no-cache">
  <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<title>GenX Info Technologies Pvt. Ltd.</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div class="navbar-brand">

				<a>Welcome ${username}</a>
			</div>
		
			<ul class="navbar-nav">

				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">List</a></li>
			</ul>

			<ul class="navbar-nav navbar-collapse justify-content-end">

				<li><a href="<%=request.getContextPath()%>/Logout"
					class="nav-link">Logout</a></li>
			</ul>
		</nav>
	</header>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Product</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					Product</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Title</th>
						<th>Target Date</th>
						<th>Product Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="todo" items="${listTodo}">

						<tr>
							<td><c:out value="${todo.title}" /></td>
							<td><c:out value="${todo.targetDate}" /></td>
							<td><c:out value="${todo.status}" /></td>

							<td><a href="edit?id=<c:out value='${todo.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-success px-4"
								data-toggle="modal" data-target="#deleteModal">Delete <i
									class="fa fa-trash" aria-hidden="true"></i></a>


								<div class="modal fade" id="deleteModal">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header bg-danger text-white">
												<h5 class="modal-title">Delete user</h5>
												<button class="close" data-dismiss="modal">
													<span>&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form>
													<p>Are you sure you want to delete</p>
												</form>
											</div>
											<div class="modal-footer">
												<form>
													<a href="delete?id=<c:out value='${todo.id}' />">Delete</a>
												</form>


											</div>
										</div>
									</div>
								</div>
							<td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>


	<script>
		function abc(d) {
			console.log('hello dlete', d)
			document.getElementById('delete').value = d;
			console.log('executed')

		}
	</script>

	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
</body>
</html>
