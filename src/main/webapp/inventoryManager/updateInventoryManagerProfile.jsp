<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.Admin" %>
<%@ page session="true" %>

<c:if test="${empty sessionScope.loggedIn or empty sessionScope.inventoryManagerDetails}">
    <c:redirect url="/inventoryManager/inventoryManagerLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Update My Profile</title>
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        :root {
            --primary-bg: #1a1a2e;
            --secondary-bg: #16213e;
            --accent-color: #4cc9f0;
            --accent-hover: #3a9ec7;
            --text-color: white;
            --placeholder-color: #b8c2d9;
            --error-color: #e94560;
            --form-bg: rgba(255, 255, 255, 0.1);
            --border-radius: 10px;
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
            background-image: linear-gradient(to bottom right, var(--primary-bg), var(--secondary-bg));
        }
        
        .form-container {
            background: var(--form-bg);
            backdrop-filter: blur(12px);
            padding: 40px;
            width: 100%;
            max-width: 800px;
            border-radius: var(--border-radius);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: fadeIn 0.6s cubic-bezier(0.39, 0.575, 0.565, 1);
        }
        
        .form-container h3 {
            font-size: clamp(1.5rem, 2.5vw, 2rem);
            margin-bottom: 30px;
            text-align: center;
            color: var(--accent-color);
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
            align-items: center;
        }
        
        .form-label {
            flex: 0 0 180px;
            text-align: right;
            padding-right: 20px;
            font-weight: 500;
            color: var(--accent-color);
        }
        
        .form-input {
            flex: 1;
            min-width: 0;
        }
        
        .form-control {
            background: rgba(255, 255, 255, 0.15);
            color: var(--text-color);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 12px 20px;
            border-radius: var(--border-radius);
            width: 100%;
            transition: all 0.3s ease;
            font-size: 15px;
        }
        
        .form-control:focus {
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 0 0 0.2rem rgba(76, 201, 240, 0.3);
            border-color: var(--accent-color);
            outline: none;
        }
        
        .form-control::placeholder {
            color: var(--placeholder-color);
            opacity: 0.7;
        }
        
        .form-control[readonly] {
            background-color: rgba(128, 128, 128, 0.2);
            color: #ccc;
        }
        
        .btn-submit {
            background: var(--accent-color);
            color: #0a192f;
            font-size: clamp(0.9rem, 1.2vw, 1rem);
            font-weight: 600;
            border: none;
            padding: 14px;
            width: 100%;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
            margin-top: 25px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }
        
        .btn-submit:hover {
            background: var(--accent-hover);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(76, 201, 240, 0.3);
        }
        
        .error-message {
            color: var(--error-color);
            font-size: 0.85rem;
            margin-top: 8px;
            text-align: left;
            display: none;
            font-weight: 500;
        }
        
        .home-icon {
            position: fixed;
            top: 25px;
            left: 25px;
            font-size: 1.5rem;
            color: white;
            text-decoration: none;
            z-index: 100;
            background: rgba(76, 201, 240, 0.2);
            padding: 10px 15px;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
            border: 1px solid rgba(76, 201, 240, 0.3);
        }
        
        .home-icon:hover {
            background: rgba(76, 201, 240, 0.3);
            transform: translateY(-2px);
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
            transition: all 0.2s ease;
        }
        
        .password-toggle:hover {
            color: var(--accent-color);
        }
        
        .password-wrapper {
            position: relative;
            width: 100%;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 30px;
                margin-top: 60px;
            }
            
            .form-row {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .form-label {
                flex: 0 0 auto;
                text-align: left;
                padding-right: 0;
                margin-bottom: 10px;
                width: 100%;
            }
            
            .form-input {
                width: 100%;
            }
            
            .home-icon {
                top: 15px;
                left: 15px;
                font-size: 1.3rem;
                padding: 8px 12px;
            }
        }

        @media (max-width: 576px) {
            .form-container {
                padding: 25px 20px;
            }
            
            body {
                padding: 15px;
                align-items: flex-start;
            }
            
            .form-control {
                padding: 10px 15px;
            }
        }

        @keyframes fadeIn {
            from { 
                opacity: 0; 
                transform: translateY(30px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }
        
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }
        
        .form-container {
            animation: fadeIn 0.6s ease-out, float 6s ease-in-out infinite;
        }
    </style>
</head>

<body>
    <%
        String id= request.getParameter("id");
        String username= request.getParameter("username");
        String fName= request.getParameter("fName");
        String lName= request.getParameter("lName");
        String phone= request.getParameter("phone");
        String email= request.getParameter("email");
        String password= request.getParameter("password");
    %>

    <a href="./inventoryManagerDashboard.jsp" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="form-container">
        <h3><i class="fas fa-user-edit mr-2"></i>Update Inventory Manager Profile</h3>
        
        <form action="../updateInventoryManager" method="post" onsubmit="return validateForm()">
            <!-- ID -->
            <div class="form-row">
                <label for="m_id" class="form-label">
                    <i class="fas fa-id-card mr-2"></i>Manager ID
                </label>
                <div class="form-input">
                    <input type="text" class="form-control" name="m_id" id="m_id" 
                        value="<%= id %>" readonly>
                </div>
            </div>
            
            <!-- Username -->
            <div class="form-row">
                <label for="username" class="form-label">
                    <i class="fas fa-user mr-2"></i>Username
                </label>
                <div class="form-input">
                    <input type="text" class="form-control" name="username" id="username" 
                        placeholder="Enter username" value="<%= username %>" required>
                </div>
            </div>
            
            <!-- First Name -->
            <div class="form-row">
                <label for="firstName" class="form-label">
                    <i class="fas fa-signature mr-2"></i>First Name
                </label>
                <div class="form-input">
                    <input type="text" class="form-control" name="firstName" id="firstName" 
                        placeholder="Enter first name" value="<%= fName %>" required>
                </div>
            </div>
            
            <!-- Last Name -->
            <div class="form-row">
                <label for="lastName" class="form-label">
                    <i class="fas fa-signature mr-2"></i>Last Name
                </label>
                <div class="form-input">
                    <input type="text" class="form-control" name="lastName" id="lastName" 
                        placeholder="Enter last name" value="<%= lName %>" required>
                </div>
            </div>
            
            <!-- Phone -->
            <div class="form-row">
                <label for="phone" class="form-label">
                    <i class="fas fa-phone mr-2"></i>Phone
                </label>
                <div class="form-input">
                    <input type="tel" class="form-control" name="phone" id="phone" 
                        placeholder="Enter phone number" value="<%= phone %>" required>
                </div>
            </div>
            
            <!-- Email -->
            <div class="form-row">
                <label for="email" class="form-label">
                    <i class="fas fa-envelope mr-2"></i>Email
                </label>
                <div class="form-input">
                    <input type="email" class="form-control" name="email" id="email" 
                        placeholder="Enter email address" value="<%= email %>" required>
                </div>
            </div>
            
            <!-- Password -->
            <div class="form-row">
                <label for="password" class="form-label">
                    <i class="fas fa-lock mr-2"></i>Password
                </label>
                <div class="form-input">
                    <div class="password-wrapper">
                        <input type="password" class="form-control" name="password" id="password" 
                            placeholder="Enter new password" value="<%= password %>" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('password', this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Confirm Password -->
            <div class="form-row">
                <label for="confirmPassword" class="form-label">
                    <i class="fas fa-check-circle mr-2"></i>Confirm Password
                </label>
                <div class="form-input">
                    <div class="password-wrapper">
                        <input type="password" class="form-control" id="confirmPassword" 
                            placeholder="Re-enter password" value="<%= password %>" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword', this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="error-message" id="error-message">
                        <i class="fas fa-exclamation-circle mr-1"></i>Passwords do not match
                    </div>
                </div>
            </div>
            
            <button type="submit" class="btn-submit">
                <i class="fas fa-save mr-2"></i>Update Profile
            </button>
        </form>
    </div>

    <script>
        function validateForm() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const errorMessage = document.getElementById("error-message");
            
            if (password !== confirmPassword) {
                errorMessage.style.display = "block";
                document.getElementById("confirmPassword").focus();
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
        
        // Validate password match on the fly
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById("password").value;
            const confirmPassword = this.value;
            const errorMessage = document.getElementById("error-message");
            
            if (password !== confirmPassword) {
                errorMessage.style.display = "block";
            } else {
                errorMessage.style.display = "none";
            }
        });
    </script>
</body>
</html>