<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>

<c:if test="${empty sessionScope.deliveryManagerDetails}">
    <c:redirect url="/deliveryManager/delLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Update My Profile</title>
    <link rel="icon" type="image/png" href="../images/favDelManager.jpg">
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        :root {
            --primary-bg: #1a3a5f;
            --form-bg: rgba(255, 255, 255, 0.1);
            --accent-color: #ff9f1c;
            --accent-hover: #e68a00;
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
            color: var(--accent-color);
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
            box-shadow: 0 0 0 0.2rem rgba(255, 159, 28, 0.25);
        }
        
        .form-control::placeholder {
            color: var(--placeholder-color);
            opacity: 0.7;
        }
        
        .form-control[readonly] {
            background-color: rgba(128, 128, 128, 0.3);
        }
        
        .btn-submit {
            background: var(--accent-color);
            color: #1e1e1e;
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
    <a href="./deliveryManager/deliveryManagerDashboard.jsp" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="form-container">
        <h3><i class="fas fa-user-edit mr-2"></i>Update Delivery Manager Profile</h3>
        
        <form action="../deliveryManagerUpdate" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="d_id" value="${param.id}">
            
            <!-- ID -->
            <div class="form-row">
                <label for="m_id" class="form-label"><i class="fas fa-id-card mr-2"></i>Manager ID</label>
                <div class="form-input">
                    <input type="text" class="form-control" id="m_id" 
                        value="${param.id}" readonly>
                </div>
            </div>
            
            <!-- Username -->
            <div class="form-row">
                <label for="username" class="form-label"><i class="fas fa-user mr-2"></i>Username</label>
                <div class="form-input">
                    <input type="text" class="form-control" name="username" id="username" 
                        placeholder="Username" value="${param.username}" required>
                </div>
            </div>
            
            <!-- First Name -->
            <div class="form-row">
                <label for="firstName" class="form-label"><i class="fas fa-signature mr-2"></i>First Name</label>
                <div class="form-input">
                    <input type="text" class="form-control" name="firstName" id="firstName" 
                        placeholder="First Name" value="${param.fName}" required>
                </div>
            </div>
            
            <!-- Last Name -->
            <div class="form-row">
                <label for="lastName" class="form-label"><i class="fas fa-signature mr-2"></i>Last Name</label>
                <div class="form-input">
                    <input type="text" class="form-control" name="lastName" id="lastName" 
                        placeholder="Last Name" value="${param.lName}" required>
                </div>
            </div>
            
            <!-- Phone -->
            <div class="form-row">
                <label for="phone" class="form-label"><i class="fas fa-phone mr-2"></i>Phone</label>
                <div class="form-input">
                    <input type="tel" class="form-control" name="phone" id="phone" 
                        placeholder="Phone" value="${param.phone}" required pattern="[0-9]{10}"
                        title="Please enter a 10-digit phone number">
                </div>
            </div>
            
            <!-- Email -->
            <div class="form-row">
                <label for="email" class="form-label"><i class="fas fa-envelope mr-2"></i>Email</label>
                <div class="form-input">
                    <input type="email" class="form-control" name="email" id="email" 
                        placeholder="Email" value="${param.email}" required>
                </div>
            </div>
            
            <!-- Password -->
            <div class="form-row">
                <label for="password" class="form-label"><i class="fas fa-lock mr-2"></i>Password</label>
                <div class="form-input">
                    <div class="password-wrapper">
                        <input type="password" class="form-control" name="password" id="password" 
                            placeholder="Password" value="${param.password}" required minlength="8">
                        <button type="button" class="password-toggle" onclick="togglePassword('password', this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Confirm Password -->
            <div class="form-row">
                <label for="confirmPassword" class="form-label"><i class="fas fa-check-circle mr-2"></i>Confirm Password</label>
                <div class="form-input">
                    <div class="password-wrapper">
                        <input type="password" class="form-control" id="confirmPassword" 
                            placeholder="Re-type Password" value="${param.password}" required minlength="8">
                        <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword', this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="error-message" id="error-message"><i class="fas fa-exclamation-circle mr-1"></i>Passwords do not match</div>
                </div>
            </div>
            
            <button type="submit" class="btn-submit"><i class="fas fa-save mr-2"></i>Update Profile</button>
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

        // Real-time password validation
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
        
        // Add input validation for phone number
        document.getElementById('phone').addEventListener('input', function() {
            this.value = this.value.replace(/[^0-9]/g, '');
            if (this.value.length > 10) {
                this.value = this.value.slice(0, 10);
            }
        });
    </script>
</body>
</html>