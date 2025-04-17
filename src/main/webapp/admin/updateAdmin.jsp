<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.Admin" %>
<%@ page session="true" %>

<%
    // Admin session verification
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("loggedIn") == null) {
        response.sendRedirect(request.getContextPath() + "/admin/adminLogin.jsp");
        return;
    }

    List<Admin> adminDetails = (List<Admin>) sessionObj.getAttribute("adminDetails");
    if (adminDetails == null || adminDetails.isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/admin/adminLogin.jsp");
        return;
    }

    // Get the manager to edit
    Admin ad = (Admin) request.getAttribute("admin");
    if (ad == null) {
        response.sendRedirect(request.getContextPath() + "/adminUpdateAdmin");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Admin</title>
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #002244;
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
        }
        
        .edit-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            width: 800px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            animation: fadeIn 0.5s ease-in-out;
            color: white;
        }
        
        .form-control {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
        }
        
        .btn-update {
            background: #ff4c29;
            color: white;
            font-weight: 600;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 8px;
            transition: 0.3s;
            margin-top: 15px;
        }
        
        .home-icon {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 28px;
            color: white;
        }
        
       .form-group {
	        display: flex;
	        align-items: center;
	        margin-bottom: 15px;
	    }
	
	    .form-group label {
	        text-align: right;
	        min-width: 150px; /* Ensures alignment */
	        margin-right: 15px; /* Spacing between label and input */
	        color: white;
	    }
	
	    .form-group input {
	        flex: 1;
	    }

	   
    </style>
</head>

<body>
    <a href="${pageContext.request.contextPath}/manageAdmin" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="edit-container">
        <h3>Update Admin</h3>
        
        <form action="${pageContext.request.contextPath}/adminUpdateAdmin" method="post" onsubmit="return validateForm()">
    
		<!-- ID -->
		<div class="form-group">
		    <label for="id">ID</label>
		    <input type="text" class="form-control" name="id" id="id" 
		        value="<%= ad.getAdmin_id() %>" readonly style="background-color: grey;">
		</div>
		
		<!-- Username -->
		<div class="form-group">
		    <label for="username">Username</label>
		    <input type="text" class="form-control" name="username" id="username" 
		        value="<%= ad.getUsername() %>" required>
		</div>
		
		<!-- First Name -->
		<div class="form-group">
		    <label for="firstName">First Name</label>
		    <input type="text" class="form-control" name="firstName" id="firstName" 
		        value="<%= ad.getFirst_name() %>" required>
		</div>
		
		<!-- Last Name -->
		<div class="form-group">
		    <label for="lastName">Last Name</label>
		    <input type="text" class="form-control" name="lastName" id="lastName" 
		        value="<%= ad.getLast_name() %>">
		</div>
		
		<!-- Phone -->
		<div class="form-group">
		    <label for="phone">Phone</label>
		    <input type="tel" class="form-control" name="phone" id="phone" 
		        value="<%= ad.getPhone() %>">
		</div>
		
		<!-- Email -->
		<div class="form-group">
		    <label for="email">Email</label>
		    <input type="email" class="form-control" name="email" id="email" 
		        value="<%= ad.getEmail() %>" required>
		</div>
		
		<!-- Password -->
		<div class="form-group">
		    <label for="password">Password</label>
		    <input type="password" class="form-control" name="password" id="password" 
		        value="<%= ad.getPassword() %>" required>
		</div>
		
		<!-- Confirm Password -->
		<div class="form-group">
		    <label for="confirmPassword">Confirm Password</label>
		    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" 
		        value="<%= ad.getPassword() %>" required>
		    <div class="text-danger" id="error-message" style="display:none;">
		        Passwords do not match
		    </div>
		</div>
	    
	            <button type="submit" class="btn-update">Update Profile</button>
	        </form>
	    </div>

    <script>
        function validateForm() {
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirmPassword").value;
            let errorMessage = document.getElementById("error-message");
            
            if (password !== confirmPassword) {
                errorMessage.style.display = "block";
                return false;
            }
            errorMessage.style.display = "none";
            return true;
        }
    </script>
</body>
</html>