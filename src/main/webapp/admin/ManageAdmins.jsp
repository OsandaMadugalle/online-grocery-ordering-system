<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.Admin" %>
<%@ page session="true" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("loggedIn") == null) {
        response.sendRedirect("../admin/adminLogin.jsp"); // Redirect to admin folder
        return;
    }

    List<Admin> adminDetails = (List<Admin>) sessionObj.getAttribute("adminDetails");
    if (adminDetails == null || adminDetails.isEmpty()) {
        response.sendRedirect("../admin/adminLogin.jsp"); // Redirect to admin folder
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admins List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #002244;
            color: white;
            text-align: center;
            padding-top: 50px;
        }
        .container {
            width: 80%;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            position: relative;
        }
        .btn-add {
            background: #ff4c29;
            color: white;
            font-weight: 600;
            border-radius: 8px;
        }
        .btn-add:hover { background: #e03e1a; }
        .table { color: white; }
        .btn { font-size: 14px; }
        .home-icon {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 28px;
            color: white;
            text-decoration: none;
        }
        .home-icon:hover {
            color: #ddd;
        }
    </style>
</head>

<body>

    <!-- Back Button -->
    <a href="adminAccount.jsp" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="container">
        <h3>Admin List</h3>
        
        <a href="createAdmin.jsp" class="btn btn-add">Add New Admin</a>
        <c:if test="${not empty stockManager}">
		    <table class="table table-dark table-striped mt-3">
		        <thead>
		            <tr>
		                <th>ID</th>
		                <th>Username</th>
		                <th>First Name</th>
		                <th>Last Name</th>
		                <th>Phone</th>
		                <th>Email</th>
		                <th>Password</th>
		                <th>Actions</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="sm" items="${stockManager}">
		                <tr>
		                    <td><c:out value="#" /></td>
		                    <td><c:out value="#" /></td>
		                    <td><c:out value="#" /></td>
		                    <td><c:out value="#" /></td>
		                    <td><c:out value="#" /></td>
		                    <td><c:out value="#" /></td>
		                    <td><c:out value="#" /></td>
		                    <td>
		                        <a href="editStockManager.jsp?id=${sm.stock_manager_id}" class="btn btn-warning">Edit</a>
		                        <a href="DeleteStockManagerServlet?id=${sm.stock_manager_id}" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</c:if>
		<c:if test="${empty stockManager}">
		    <div class="alert alert-info mt-3">No admins found.</div>
		</c:if>
    </div>
</body>
</html>