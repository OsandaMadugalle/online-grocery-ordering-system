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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>My Account - Customer</title>
    
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
        
        .account-container {
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
        
        .account-container h3 {
            font-size: clamp(1.5rem, 2.5vw, 2rem);
            margin-bottom: 30px;
            text-align: center;
            color: var(--accent-color);
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        .info-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
            align-items: center;
        }
        
        .info-label {
            flex: 0 0 180px;
            text-align: right;
            padding-right: 20px;
            font-weight: 500;
            color: var(--accent-color);
        }
        
        .info-value {
            flex: 1;
            min-width: 0;
            background: rgba(255, 255, 255, 0.15);
            color: var(--text-color);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 12px 20px;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
        }
        
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .btn-edit {
            background: var(--accent-color);
            color: #0a192f;
            font-weight: 600;
            border: none;
            padding: 12px 25px;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
            text-transform: uppercase;
        }
        
        .btn-edit:hover {
            background: var(--accent-hover);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(76, 201, 240, 0.3);
        }
        
        .btn-logout {
            background: transparent;
            color: var(--error-color);
            font-weight: 600;
            border: 1px solid var(--error-color);
            padding: 12px 25px;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
            text-transform: uppercase;
        }
        
        .btn-logout:hover {
            background: var(--error-color);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(233, 69, 96, 0.3);
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

        @media (max-width: 768px) {
            .account-container {
                padding: 30px;
                margin-top: 60px;
            }
            
            .info-row {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .info-label {
                flex: 0 0 auto;
                text-align: left;
                padding-right: 0;
                margin-bottom: 10px;
                width: 100%;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 15px;
            }
            
            .home-icon {
                top: 15px;
                left: 15px;
                font-size: 1.3rem;
                padding: 8px 12px;
            }
        }

        @media (max-width: 576px) {
            .account-container {
                padding: 25px 20px;
            }
            
            body {
                padding: 15px;
                align-items: flex-start;
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
    </style>
</head>

<body>
    <a href="${pageContext.request.contextPath}/customer/customerDashboard.jsp" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="account-container">
        <h3><i class="fas fa-user-circle mr-2"></i>Customer Account</h3>
        
        <%
            List<Customer> customerDetails = (List<Customer>) session.getAttribute("customerDetails");
            if (customerDetails != null && !customerDetails.isEmpty()) {
                Customer customer = customerDetails.get(0);
        %>
        
        <div class="info-row">
            <div class="info-label">
                <i class="fas fa-id-card mr-2"></i>Customer ID
            </div>
            <div class="info-value">
                <%= customer.getCustomer_id() %>
            </div>
        </div>
        
        <div class="info-row">
            <div class="info-label">
                <i class="fas fa-user mr-2"></i>Username
            </div>
            <div class="info-value">
                <%= customer.getUsername() %>
            </div>
        </div>
        
        <div class="info-row">
            <div class="info-label">
                <i class="fas fa-signature mr-2"></i>Full Name
            </div>
            <div class="info-value">
                <%= customer.getFirst_name() %> <%= customer.getLast_name() %>
            </div>
        </div>
        
        <div class="info-row">
            <div class="info-label">
                <i class="fas fa-phone mr-2"></i>Phone
            </div>
            <div class="info-value">
                <%= customer.getPhone() %>
            </div>
        </div>
        
        <div class="info-row">
            <div class="info-label">
                <i class="fas fa-envelope mr-2"></i>Email
            </div>
            <div class="info-value">
                <%= customer.getEmail() %>
            </div>
        </div>
        
        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/customer/updateCustomerProfile.jsp" 
               class="btn-edit">
                <i class="fas fa-edit mr-2"></i>Edit Profile
            </a>
            <a href="${pageContext.request.contextPath}/customer/customerLogout.jsp" 
               class="btn-logout">
                <i class="fas fa-sign-out-alt mr-2"></i>Logout
            </a>
        </div>
        
        <%
            }
        %>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>