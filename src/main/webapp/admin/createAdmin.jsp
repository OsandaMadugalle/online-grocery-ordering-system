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

    Admin admin = adminDetails.get(0);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Admin</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1b1b2f, #162447);
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

        .edit-container h3 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
        }

        .form-control::placeholder {
            color: #e0e0e0;
        }

        .btn-update {
            background: #ff4c29;
            color: white;
            font-size: 16px;
            font-weight: 600;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 8px;
            transition: 0.3s;
            margin-top: 15px;
        }

        .btn-update:hover {
            background: #e03e1a;
        }

        .error-message {
            color: red;
            font-size: 14px;
            display: none;
            margin-top: 5px;
        }

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

    <a href="adminManage.jsp" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="edit-container">
        <h3>Create Admin</h3>

        <form action="addAdmin" method="post" onsubmit="return validateForm()">
            
            <!-- Username -->
            <div class="form-group">
                <input type="text" class="form-control" name="username" placeholder="Username" required>
            </div>

            <!-- First Name -->
            <div class="form-group">
                <input type="text" class="form-control" name="firstName" placeholder="First Name" required>
            </div>

            <!-- Last Name -->
            <div class="form-group">
                <input type="text" class="form-control" name="lastName" placeholder="Last Name">
            </div>

            <!-- Phone Number -->
            <div class="form-group">
                <input type="tel" class="form-control" name="phone" placeholder="Phone">
            </div>

            <!-- Email Address -->
            <div class="form-group">
                <input type="email" class="form-control" name="email" placeholder="Email" required>
            </div>

            <!-- Password (Optional) -->
            <div class="form-group">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password" required>
                <div class="error-message" id="error-message">Passwords do not match</div>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn-update">Create Admin</button>

        </form>
    </div>

    <script>
        function validateForm() {
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirmPassword").value;
            let errorMessage = document.getElementById("error-message");

            if (password !== "" && password !== confirmPassword) {
                errorMessage.style.display = "block";
                return false;
            } else {
                errorMessage.style.display = "none";
                return true;
            }
        }
    </script>

</body>
</html>
