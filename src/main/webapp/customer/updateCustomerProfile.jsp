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
    <title>Edit Customer Account</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

    <style>
       :root {
		    --primary-color: #013220;
		    --accent-color: #ff4c29;
		    --text-color: #ffffff;
		    --input-bg: #1f3a2d;
		    --input-border: #355e47;
		    --label-color: #f1c40f;
		}
		
		body {
		    font-family: 'Poppins', sans-serif;
		    background-color: var(--primary-color);
		    color: var(--text-color);
		    margin: 0;
		    padding: 0;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    min-height: 100vh;
		}
		
		.main-content {
		    width: 100%;
		    padding: 20px;
		}
		
		.account-container {
		    background: rgba(255, 255, 255, 0.03);
		    backdrop-filter: blur(10px);
		    border-radius: 12px;
		    padding: 30px;
		    max-width: 700px;
		    margin: 0 auto;
		    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5);
		    border: 1px solid rgba(255, 255, 255, 0.1);
		}
		
		h3 {
		    text-align: center;
		    color: var(--accent-color);
		    margin-bottom: 40px;
		    font-size: 26px;
		}
		
		.edit-form {
		    display: flex;
		    flex-direction: column;
		    gap: 20px;
		}
		
		.info-row {
		    display: flex;
		    flex-wrap: wrap;
		    align-items: center;
		    gap: 12px;
		}
		
		.info-label {
		    flex: 0 0 150px;
		    text-align: right;
		    font-weight: 500;
		    color: var(--label-color);
		    font-size: 15px;
		}
		
		.form-input {
		    flex: 1;
		}
		
		.info-value {
		    width: 100%;
		    background-color: var(--input-bg);
		    border: 1px solid var(--input-border);
		    color: var(--text-color);
		    padding: 10px 14px;
		    border-radius: 8px;
		    font-size: 15px;
		    outline: none;
		    transition: 0.3s;
		}
		
		.info-value:focus {
		    border-color: var(--accent-color);
		    background-color: #244a38;
		}
		
		.password-wrapper {
		    position: relative;
		}
		
		.password-toggle {
		    position: absolute;
		    top: 50%;
		    right: 12px;
		    transform: translateY(-50%);
		    background: none;
		    border: none;
		    cursor: pointer;
		    color: var(--label-color);
		}
		
		.password-toggle i {
		    font-size: 16px;
		}
		
		.btn-edit-profile {
		    background-color: var(--accent-color);
		    padding: 12px;
		    width: 100%;
		    border: none;
		    border-radius: 8px;
		    color: white;
		    font-weight: 600;
		    font-size: 16px;
		    transition: background-color 0.3s;
		}
		
		.btn-edit-profile:hover {
		    background-color: #e5431b;
		}
		
		.back-button {
		    display: inline-flex;
		    align-items: center;
		    color: var(--text-color);
		    text-decoration: none;
		    font-size: 14px;
		    margin-bottom: 20px;
		    cursor: pointer;
		    transition: color 0.2s;
		}
		
		.back-button i {
		    margin-right: 6px;
		}
		
		.back-button:hover {
		    color: var(--accent-color);
		}
		
		@media (max-width: 768px) {
		    .info-row {
		        flex-direction: column;
		        align-items: flex-start;
		    }
		
		    .info-label {
		        text-align: left;
		    }
		}
    </style>
</head>
<body>

<div class="main-content">
    <div class="account-container">
        <div class="back-button" onclick="history.back()">
            <i class="fas fa-arrow-left"></i> Back
        </div>

        <h3><i class="fas fa-user-circle mr-2"></i>Edit Customer Account</h3>

        <%
            List<Customer> customerDetails = (List<Customer>) session.getAttribute("customerDetails");
            if (customerDetails != null && !customerDetails.isEmpty()) {
                Customer customer = customerDetails.get(0);
        %>

        <form class="edit-form" action="<%= request.getContextPath() %>/customerUpdate" method="post" onsubmit="return validatePasswords()">
            <div class="info-row">
                <div class="info-label"><i class="fas fa-id-card"></i> Customer ID</div>
                <div class="form-input">
                    <input type="text" class="info-value" value="<%= customer.getCustomer_id() %>" readonly>
                    <input type="hidden" name="customer_id" value="<%= customer.getCustomer_id() %>">
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-user"></i> Username</div>
                <div class="form-input">
                    <input type="text" name="username" class="info-value" value="<%= customer.getUsername() %>" required>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-signature"></i> First Name</div>
                <div class="form-input">
                    <input type="text" name="first_name" class="info-value" value="<%= customer.getFirst_name() %>" required>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-signature"></i> Last Name</div>
                <div class="form-input">
                    <input type="text" name="last_name" class="info-value" value="<%= customer.getLast_name() %>" required>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-envelope"></i> Email</div>
                <div class="form-input">
                    <input type="email" name="email" class="info-value" value="<%= customer.getEmail() %>" required>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-phone"></i> Phone</div>
                <div class="form-input">
                    <input type="tel" name="phone" class="info-value" value="<%= customer.getPhone() %>" required>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-lock"></i> Password</div>
                <div class="form-input password-wrapper">
                    <input type="password" name="password" class="info-value" id="passwordField" value="<%= customer.getPassword() %>" required>
                    <button type="button" class="password-toggle" onclick="togglePassword()"><i class="fas fa-eye"></i></button>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"><i class="fas fa-lock"></i> Confirm</div>
                <div class="form-input password-wrapper">
                    <input type="password" name="confirm_password" class="info-value" id="confirmPasswordField" value="<%= customer.getPassword() %>" required>
                    <button type="button" class="password-toggle" onclick="toggleConfirmPassword()"><i class="fas fa-eye"></i></button>
                </div>
            </div>

            <div class="info-row">
                <div class="info-label"></div>
                <div class="form-input">
                    <button type="submit" class="btn-edit-profile">Save Changes</button>
                </div>
            </div>
        </form>

        <% } else { %>
            <p>No customer data found.</p>
        <% } %>
    </div>
</div>

<script>
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

    function validatePasswords() {
        const pass = document.getElementById("passwordField").value;
        const confirm = document.getElementById("confirmPasswordField").value;
        if (pass !== confirm) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
