<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.Admin" %>
<%@ page import="com.gos.model.InventoryManager" %>
<%@ page session="true" %>

<c:if test="${empty sessionScope.loggedIn or empty sessionScope.adminDetails}">
    <c:redirect url="/admin/adminLogin.jsp"/>
</c:if>

<%
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Update Inventory Manager</title>
    <link rel="icon" type="image/png" href="../images/favAdmin.jpg">
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        :root {
            --primary-bg: #002244;
            --form-bg: rgba(255, 255, 255, 0.1);
            --accent-color: #ff4c29;
            --accent-hover: #e03e1a;
            --text-color: white;
            --placeholder-color: #e0e0e0;
            --error-color: #ff6b6b;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-bg);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .form-container {
            background: var(--form-bg);
            backdrop-filter: blur(10px);
            padding: 30px;
            width: 100%;
            max-width: 800px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            animation: fadeIn 0.5s ease-in-out;
        }
        
        .form-container h3 {
            font-size: clamp(1.5rem, 2.5vw, 2rem);
            margin-bottom: 25px;
            text-align: center;
        }
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 15px;
            align-items: center;
        }
        
        .form-label {
            flex: 0 0 150px;
            text-align: right;
            padding-right: 15px;
            font-weight: 500;
        }
        
        .form-input {
            flex: 1;
            min-width: 0;
        }
        
        .form-control {
            background: rgba(255, 255, 255, 0.2);
            color: var(--text-color);
            border: none;
            padding: 12px 15px;
            border-radius: 8px;
            width: 100%;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            background: rgba(255, 255, 255, 0.3);
            box-shadow: 0 0 0 0.2rem rgba(255, 76, 41, 0.25);
        }
        
        .form-control::placeholder {
            color: var(--placeholder-color);
        }
        
        .form-control[readonly] {
            background-color: rgba(128, 128, 128, 0.3);
        }
        
        .btn-submit {
            background: var(--accent-color);
            color: white;
            font-size: clamp(0.9rem, 1.2vw, 1rem);
            font-weight: 600;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            transition: all 0.3s ease;
            margin-top: 20px;
        }
        
        .btn-submit:hover {
            background: var(--accent-hover);
            transform: translateY(-2px);
        }
        
        .error-message {
            color: var(--error-color);
            font-size: 0.85rem;
            margin-top: 5px;
            text-align: left;
            display: none;
        }
        
        .home-icon {
            position: fixed;
            top: 20px;
            left: 20px;
            font-size: 1.5rem;
            color: white;
            text-decoration: none;
            z-index: 100;
            background: rgba(0, 0, 0, 0.3);
            padding: 8px 12px;
            border-radius: 50%;
            transition: all 0.3s ease;
        }
        
        .home-icon:hover {
            color: #ddd;
            background: rgba(0, 0, 0, 0.5);
        }
        
        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            background: transparent;
            border: none;
            color: var(--placeholder-color);
            cursor: pointer;
        }
        
        .password-wrapper {
            position: relative;
            width: 100%;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 25px;
                margin-top: 40px;
            }
            
            .form-row {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .form-label {
                flex: 0 0 auto;
                text-align: left;
                padding-right: 0;
                margin-bottom: 8px;
                width: 100%;
            }
            
            .form-input {
                width: 100%;
            }
            
            .home-icon {
                font-size: 1.3rem;
                padding: 6px 10px;
            }
        }

        @media (max-width: 576px) {
            .form-container {
                padding: 20px 15px;
            }
            
            body {
                padding: 15px;
                align-items: flex-start;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <a href="${pageContext.request.contextPath}/manageInventoryManager" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="form-container">
        <h3>Update Inventory Manager</h3>
        
        <form action="${pageContext.request.contextPath}/adminUpdateInventoryManager" method="post" onsubmit="return validateForm()">
            <!-- ID -->
            <div class="form-row">
                <label for="id" class="form-label">ID</label>
                <div class="form-input">
                    <input type="text" class="form-control" name="id" id="id" 
                        value="<%= manager.getInventory_manager_id() %>" readonly>
                </div>
            </div>
            
            <!-- Username -->
            <div class="form-row">
                <label for="username" class="form-label">Username</label>
                <div class="form-input">
                    <input type="text" class="form-control" name="username" id="username" 
                        value="<%= manager.getUsername() %>" required>
                </div>
            </div>
            
            <!-- First Name -->
            <div class="form-row">
                <label for="firstName" class="form-label">First Name</label>
                <div class="form-input">
                    <input type="text" class="form-control" name="firstName" id="firstName" 
                        value="<%= manager.getFirst_name() %>" required>
                </div>
            </div>
            
            <!-- Last Name -->
            <div class="form-row">
                <label for="lastName" class="form-label">Last Name</label>
                <div class="form-input">
                    <input type="text" class="form-control" name="lastName" id="lastName" 
                        value="<%= manager.getLast_name() %>">
                </div>
            </div>
            
            <!-- Phone -->
            <div class="form-row">
                <label for="phone" class="form-label">Phone</label>
                <div class="form-input">
                    <input type="tel" class="form-control" name="phone" id="phone" 
                        value="<%= manager.getPhone() %>">
                </div>
            </div>
            
            <!-- Email -->
            <div class="form-row">
                <label for="email" class="form-label">Email</label>
                <div class="form-input">
                    <input type="email" class="form-control" name="email" id="email" 
                        value="<%= manager.getEmail() %>" required>
                </div>
            </div>
            
            <!-- Password -->
            <div class="form-row">
                <label for="password" class="form-label">Password</label>
                <div class="form-input">
                    <div class="password-wrapper">
                        <input type="password" class="form-control" name="password" id="password" 
                            value="<%= manager.getPassword() %>" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('password', this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Confirm Password -->
            <div class="form-row">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <div class="form-input">
                    <div class="password-wrapper">
                        <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" 
                            value="<%= manager.getPassword() %>" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword', this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="error-message" id="error-message">Passwords do not match</div>
                </div>
            </div>
            
            <button type="submit" class="btn-submit">Update Profile</button>
        </form>
    </div>

    <script>
        function validateForm() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const errorMessage = document.getElementById("error-message");
            
            if (password !== confirmPassword) {
                errorMessage.style.display = "block";
                return false;
            }
            errorMessage.style.display = "none";
            return true;
        }

        function togglePassword(fieldId, button) {
            const field = document.getElementById(fieldId);
            const icon = button.querySelector('i');
            
            if (field.type === "password") {
                field.type = "text";
                icon.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                field.type = "password";
                icon.classList.replace('fa-eye-slash', 'fa-eye');
            }
        }
    </script>
</body>
</html>