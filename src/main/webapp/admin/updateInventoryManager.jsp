<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.Admin" %>
<%@ page import="com.gos.model.InventoryManager" %>
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
    InventoryManager manager = (InventoryManager) request.getAttribute("manager");
    if (manager == null) {
        response.sendRedirect(request.getContextPath() + "/updateInventoryManager");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Manager Profile</title>
    
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
    </style>
</head>
<body>
    <a href="${pageContext.request.contextPath}/manageInventoryManager" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="edit-container">
        <h3>Update Manager Profile</h3>
        
        <form action="${pageContext.request.contextPath}/updateInventoryManager" method="post" onsubmit="return validateForm()">
    
            <!-- ID -->
            <div class="form-group">
                <input type="text" class="form-control" name="id" 
                    value="<%= manager.getStock_manager_id() %>" readonly style="background-color: grey;">
            </div>
            
            <!-- Username -->
            <div class="form-group">
                <input type="text" class="form-control" name="username" 
                    value="<%= manager.getUsername() %>" required>
            </div>
            
            <!-- First Name -->
            <div class="form-group">
                <input type="text" class="form-control" name="firstName" 
                    value="<%= manager.getFirst_name() %>" required>
            </div>
            
            <!-- Last Name -->
            <div class="form-group">
                <input type="text" class="form-control" name="lastName" 
                    value="<%= manager.getLast_name() %>" required>
            </div>
            
            <!-- Phone -->
            <div class="form-group">
                <input type="tel" class="form-control" name="phone" 
                    value="<%= manager.getPhone() %>" required>
            </div>
            
            <!-- Email -->
            <div class="form-group">
                <input type="email" class="form-control" name="email" 
                    value="<%= manager.getEmail() %>" required>
            </div>
            
            <!-- Password -->
            <div class="form-group">
                <input type="password" class="form-control" id="password" name="password" 
                    value="<%= manager.getPassword() %>" required>
            </div>
            
            <!-- Confirm Password -->
            <div class="form-group">
                <input type="password" class="form-control" id="confirmPassword" 
                    value="<%= manager.getPassword() %>" required>
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