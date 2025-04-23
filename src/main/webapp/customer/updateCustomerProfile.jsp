<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.Customer" %>
<%@ page session="true" %>

<c:if test="${empty sessionScope.loggedIn or empty sessionScope.customerDetails}">
    <c:redirect url="/customer/cusLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Account</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Include Toastr for notifications -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #013220;
            --primary-dark: #001a10;
            --primary-light: #1a4a30;
            --accent-color: #ff4c29;
            --accent-dark: #e5431b;
            --accent-light: #ff6b4a;
            --text-color: #ffffff;
            --text-muted: #cccccc;
            --input-bg: #1f3a2d;
            --input-border: #355e47;
            --input-focus: #4a7d5c;
            --label-color: #f1c40f;
            --success-color: #2ecc71;
            --error-color: #ff6b6b;
            --warning-color: #f39c12;
            --card-bg: rgba(255, 255, 255, 0.05);
            --card-border: rgba(255, 255, 255, 0.1);
            --transition: all 0.3s ease;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-color);
            color: var(--text-color);
            line-height: 1.6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: 
                radial-gradient(circle at 10% 20%, rgba(0, 80, 40, 0.2) 0%, transparent 20%),
                radial-gradient(circle at 90% 80%, rgba(255, 76, 41, 0.1) 0%, transparent 20%);
        }
        
        .main-content {
            width: 100%;
            padding: 20px;
            animation: fadeIn 0.5s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .account-container {
            background: var(--card-bg);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 16px;
            padding: 40px;
            max-width: 800px;
            margin: 0 auto;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
            border: 1px solid var(--card-border);
            transition: var(--transition);
        }
        
        .account-container:hover {
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
        }
        
        h3 {
            text-align: center;
            color: var(--accent-color);
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            position: relative;
            padding-bottom: 15px;
        }
        
        h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, var(--accent-color), var(--label-color));
            border-radius: 3px;
        }
        
        .edit-form {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }
        
        .info-row {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 15px;
        }
        
        .info-label {
            flex: 0 0 160px;
            text-align: right;
            font-weight: 500;
            color: var(--label-color);
            font-size: 15px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .form-input {
            flex: 1;
            min-width: 0;
        }
        
        .info-value {
            width: 100%;
            background-color: var(--input-bg);
            border: 1px solid var(--input-border);
            color: var(--text-color);
            padding: 12px 16px;
            border-radius: 10px;
            font-size: 15px;
            outline: none;
            transition: var(--transition);
        }
        
        .info-value:focus {
            border-color: var(--input-focus);
            background-color: var(--primary-light);
            box-shadow: 0 0 0 3px rgba(74, 125, 92, 0.3);
        }
        
        .info-value:disabled {
            background-color: rgba(31, 58, 45, 0.5);
            color: var(--text-muted);
        }
        
        .password-wrapper {
            position: relative;
        }
        
        .password-toggle {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: var(--label-color);
            transition: var(--transition);
            padding: 5px;
            border-radius: 50%;
        }
        
        .password-toggle:hover {
            color: var(--accent-color);
            background: rgba(255, 255, 255, 0.1);
        }
        
        .password-toggle i {
            font-size: 16px;
        }
        
        .btn-edit-profile {
            background: linear-gradient(135deg, var(--accent-color), var(--accent-dark));
            padding: 14px;
            width: 100%;
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: 600;
            font-size: 16px;
            transition: var(--transition);
            cursor: pointer;
            margin-top: 10px;
            box-shadow: 0 4px 15px rgba(255, 76, 41, 0.3);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .btn-edit-profile:hover {
            background: linear-gradient(135deg, var(--accent-light), var(--accent-color));
            box-shadow: 0 6px 20px rgba(255, 76, 41, 0.4);
            transform: translateY(-2px);
        }
        
        .btn-edit-profile:active {
            transform: translateY(0);
        }
        
        .back-button {
            display: inline-flex;
            align-items: center;
            color: var(--text-color);
            text-decoration: none;
            font-size: 15px;
            margin-bottom: 25px;
            cursor: pointer;
            transition: var(--transition);
            padding: 8px 12px;
            border-radius: 6px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .back-button i {
            margin-right: 8px;
            transition: var(--transition);
        }
        
        .back-button:hover {
            color: var(--accent-color);
            background: rgba(255, 76, 41, 0.1);
            border-color: rgba(255, 76, 41, 0.2);
        }
        
        .back-button:hover i {
            transform: translateX(-3px);
        }
        
        .error-message {
            color: var(--error-color);
            font-size: 13px;
            margin-top: 8px;
            font-weight: 400;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .success-message {
            color: var(--success-color);
            font-size: 13px;
            margin-top: 8px;
            font-weight: 400;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .password-strength {
            margin-top: 8px;
            height: 4px;
            background-color: var(--input-bg);
            border-radius: 2px;
            overflow: hidden;
        }
        
        .strength-meter {
            height: 100%;
            width: 0%;
            transition: width 0.3s ease, background-color 0.3s ease;
        }
        
        .password-hints {
            margin-top: 10px;
            font-size: 12px;
            color: var(--text-muted);
        }
        
        .password-hint {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 3px;
        }
        
        .hint-icon {
            font-size: 10px;
            color: var(--error-color);
        }
        
        .hint-icon.valid {
            color: var(--success-color);
        }
        
        .form-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .form-footer a {
            color: var(--accent-color);
            text-decoration: none;
            font-size: 14px;
            transition: var(--transition);
        }
        
        .form-footer a:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 768px) {
            .account-container {
                padding: 30px 20px;
                border-radius: 12px;
            }
            
            .info-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 8px;
            }
            
            .info-label {
                flex: 1 1 100%;
                text-align: left;
            }
            
            .form-input {
                width: 100%;
            }
            
            h3 {
                font-size: 24px;
                margin-bottom: 25px;
            }
        }
        
        /* Animation for form elements */
        .info-row {
            animation: slideIn 0.5s ease-out forwards;
            opacity: 0;
        }
        
        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        
        /* Delay animations for each row */
        .info-row:nth-child(1) { animation-delay: 0.1s; }
        .info-row:nth-child(2) { animation-delay: 0.2s; }
        .info-row:nth-child(3) { animation-delay: 0.3s; }
        .info-row:nth-child(4) { animation-delay: 0.4s; }
        .info-row:nth-child(5) { animation-delay: 0.5s; }
        .info-row:nth-child(6) { animation-delay: 0.6s; }
        .info-row:nth-child(7) { animation-delay: 0.7s; }
        .info-row:nth-child(8) { animation-delay: 0.8s; }
        .info-row:nth-child(9) { animation-delay: 0.9s; }
    </style>
</head>
<body>

<div class="main-content">
    <div class="account-container">
        <div class="back-button" onclick="history.back()">
            <i class="fas fa-arrow-left"></i> Back to Profile
        </div>

        <h3><i class="fas fa-user-edit"></i> Edit Your Account</h3>

        <%
            List<Customer> customerDetails = (List<Customer>) session.getAttribute("customerDetails");
            if (customerDetails != null && !customerDetails.isEmpty()) {
                Customer customer = customerDetails.get(0);
        %>

        <form class="edit-form" action="<%= request.getContextPath() %>/customerUpdate" method="post" onsubmit="return validateForm()">
            <div class="info-row">
                <div class="info-label"><i class="fas fa-id-card"></i> Customer ID</div>
                <div class="form-input">
                    <input type="text" class="info-value" value="<%= customer.getCustomer_id() %>" readonly disabled>
                    <input type="hidden" name="customer_id" value="<%= customer.getCustomer_id() %>">
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-user-tag"></i> Username</div>
                <div class="form-input">
                    <input type="text" name="username" class="info-value" value="<%= customer.getUsername() %>" required>
                    <div id="usernameError" class="error-message"></div>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-user"></i> First Name</div>
                <div class="form-input">
                    <input type="text" name="first_name" class="info-value" value="<%= customer.getFirst_name() %>" required>
                    <div id="firstNameError" class="error-message"></div>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-user"></i> Last Name</div>
                <div class="form-input">
                    <input type="text" name="last_name" class="info-value" value="<%= customer.getLast_name() %>" required>
                    <div id="lastNameError" class="error-message"></div>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-envelope"></i> Email</div>
                <div class="form-input">
                    <input type="email" name="email" class="info-value" value="<%= customer.getEmail() %>" required>
                    <div id="emailError" class="error-message"></div>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-phone-alt"></i> Phone</div>
                <div class="form-input">
                    <input type="tel" name="phone" class="info-value" value="<%= customer.getPhone() %>" required>
                    <div id="phoneError" class="error-message"></div>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-lock"></i> Password</div>
                <div class="form-input password-wrapper">
                    <input type="password" name="password" class="info-value" id="passwordField" value="<%= customer.getPassword() %>" required minlength="6">
                    <button type="button" class="password-toggle" onclick="togglePassword()">
                        <i class="fas fa-eye"></i>
                    </button>
                    <div id="passwordError" class="error-message"></div>
                    <div class="password-strength">
                        <div class="strength-meter" id="strengthMeter"></div>
                    </div>
                    <div class="password-hints" id="passwordHints">
                        <div class="password-hint">
                            <i class="fas fa-circle hint-icon" id="lengthHint"></i>
                            <span>At least 6 characters</span>
                        </div>
                        <div class="password-hint">
                            <i class="fas fa-circle hint-icon" id="numberHint"></i>
                            <span>Contains a number</span>
                        </div>
                        <div class="password-hint">
                            <i class="fas fa-circle hint-icon" id="specialHint"></i>
                            <span>Contains a special character</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-lock"></i> Confirm Password</div>
                <div class="form-input password-wrapper">
                    <input type="password" name="confirm_password" class="info-value" id="confirmPasswordField" value="<%= customer.getPassword() %>" required minlength="6">
                    <button type="button" class="password-toggle" onclick="toggleConfirmPassword()">
                        <i class="fas fa-eye"></i>
                    </button>
                    <div id="confirmError" class="error-message"></div>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"></div>
                <div class="form-input">
                    <button type="submit" class="btn-edit-profile">
                        <i class="fas fa-save"></i> Save Changes
                    </button>
                </div>
            </div>
        </form>

        <% } else { %>
            <div class="error-message" style="text-align: center; margin-top: 20px;">
                <i class="fas fa-exclamation-triangle"></i> No customer data found. Please log in again.
            </div>
        <% } %>
    </div>
</div>

<!-- Include jQuery and Toastr for notifications -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script>
    // Initialize Toastr
    toastr.options = {
        positionClass: "toast-bottom-right",
        progressBar: true,
        closeButton: true,
        newestOnTop: true,
        timeOut: 5000
    };

    // Toggle password visibility
    function togglePassword() {
        const field = document.getElementById("passwordField");
        const icon = event.currentTarget.querySelector("i");
        field.type = field.type === "password" ? "text" : "password";
        icon.classList.toggle("fa-eye");
        icon.classList.toggle("fa-eye-slash");
    }

    function toggleConfirmPassword() {
        const field = document.getElementById("confirmPasswordField");
        const icon = event.currentTarget.querySelector("i");
        field.type = field.type === "password" ? "text" : "password";
        icon.classList.toggle("fa-eye");
        icon.classList.toggle("fa-eye-slash");
    }

    // Password strength checker
    function checkPasswordStrength(password) {
        let strength = 0;
        
        // Check length
        if (password.length >= 6) strength++;
        if (password.length >= 8) strength++;
        
        // Check for numbers
        if (/\d/.test(password)) strength++;
        
        // Check for special chars
        if (/[!@#$%^&*(),.?":{}|<>]/.test(password)) strength++;
        
        // Check for uppercase and lowercase
        if (/[a-z]/.test(password) && /[A-Z]/.test(password)) strength++;
        
        return Math.min(strength, 5); // Max strength is 5
    }

    // Update password strength meter
    function updatePasswordStrength(password) {
        const strength = checkPasswordStrength(password);
        const meter = document.getElementById("strengthMeter");
        const hints = document.getElementById("passwordHints");
        
        // Update meter
        const width = (strength / 5) * 100;
        meter.style.width = width + "%";
        
        // Update meter color
        if (strength <= 1) {
            meter.style.backgroundColor = "var(--error-color)";
        } else if (strength <= 3) {
            meter.style.backgroundColor = "var(--warning-color)";
        } else {
            meter.style.backgroundColor = "var(--success-color)";
        }
        
        // Update hints
        const lengthHint = document.getElementById("lengthHint");
        const numberHint = document.getElementById("numberHint");
        const specialHint = document.getElementById("specialHint");
        
        // Length check
        if (password.length >= 6) {
            lengthHint.classList.add("valid");
            lengthHint.classList.remove("fa-circle");
            lengthHint.classList.add("fa-check");
        } else {
            lengthHint.classList.remove("valid");
            lengthHint.classList.add("fa-circle");
            lengthHint.classList.remove("fa-check");
        }
        
        // Number check
        if (/\d/.test(password)) {
            numberHint.classList.add("valid");
            numberHint.classList.remove("fa-circle");
            numberHint.classList.add("fa-check");
        } else {
            numberHint.classList.remove("valid");
            numberHint.classList.add("fa-circle");
            numberHint.classList.remove("fa-check");
        }
        
        // Special char check
        if (/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
            specialHint.classList.add("valid");
            specialHint.classList.remove("fa-circle");
            specialHint.classList.add("fa-check");
        } else {
            specialHint.classList.remove("valid");
            specialHint.classList.add("fa-circle");
            specialHint.classList.remove("fa-check");
        }
    }

    // Form validation
    function validateForm() {
        let isValid = true;
        
        // Reset errors
        document.querySelectorAll('.error-message').forEach(el => el.textContent = '');
        
        // Validate username
        const username = document.querySelector('input[name="username"]').value.trim();
        if (username.length < 3) {
            document.getElementById("usernameError").textContent = "Username must be at least 3 characters long.";
            isValid = false;
        }
        
        // Validate first name
        const firstName = document.querySelector('input[name="first_name"]').value.trim();
        if (firstName.length < 2) {
            document.getElementById("firstNameError").textContent = "First name must be at least 2 characters long.";
            isValid = false;
        }
        
        // Validate last name
        const lastName = document.querySelector('input[name="last_name"]').value.trim();
        if (lastName.length < 2) {
            document.getElementById("lastNameError").textContent = "Last name must be at least 2 characters long.";
            isValid = false;
        }
        
        // Validate email
        const email = document.querySelector('input[name="email"]').value.trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            document.getElementById("emailError").textContent = "Please enter a valid email address.";
            isValid = false;
        }
        
        // Validate phone
        const phone = document.querySelector('input[name="phone"]').value.trim();
        const phoneRegex = /^[\d\s\-+()]{8,}$/;
        if (!phoneRegex.test(phone)) {
            document.getElementById("phoneError").textContent = "Please enter a valid phone number.";
            isValid = false;
        }
        
        // Validate passwords
        const pass = document.getElementById("passwordField").value;
        const confirm = document.getElementById("confirmPasswordField").value;
        
        if (pass.length < 6) {
            document.getElementById("passwordError").textContent = "Password must be at least 6 characters long.";
            isValid = false;
        }
        
        if (pass !== confirm) {
            document.getElementById("confirmError").textContent = "Passwords do not match.";
            isValid = false;
        }
        
        if (!isValid) {
            toastr.error("Please correct the errors in the form.");
        } else {
            toastr.success("Profile updated successfully!");
        }
        
        return isValid;
    }
    
    // Real-time validation
    document.getElementById("passwordField").addEventListener("input", function() {
        const password = this.value;
        updatePasswordStrength(password);
        
        const passwordError = document.getElementById("passwordError");
        if (password.length > 0 && password.length < 6) {
            passwordError.textContent = "Password must be at least 6 characters long.";
        } else {
            passwordError.textContent = "";
        }
    });
    
    document.getElementById("confirmPasswordField").addEventListener("input", function() {
        const confirmError = document.getElementById("confirmError");
        const password = document.getElementById("passwordField").value;
        if (this.value !== password) {
            confirmError.textContent = "Passwords do not match.";
        } else {
            confirmError.textContent = "";
        }
    });
    
    // Initialize password strength on page load
    document.addEventListener("DOMContentLoaded", function() {
        const initialPassword = document.getElementById("passwordField").value;
        updatePasswordStrength(initialPassword);
    });
    
    // Confirm account deletion
    function confirmDelete() {
        if (confirm("Are you sure you want to delete your account? This action cannot be undone.")) {
            // Redirect to delete account endpoint
            window.location.href = "<%= request.getContextPath() %>/deleteAccount";
        }
    }
</script>
</body>
</html>