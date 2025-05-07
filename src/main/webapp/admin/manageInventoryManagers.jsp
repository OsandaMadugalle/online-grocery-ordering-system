<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.*" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${empty sessionScope.loggedIn or empty sessionScope.adminDetails}">
    <c:redirect url="/admin/adminLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Inventory Managers List</title>
    <link rel="icon" type="image/png" href="../images/favAdmin.jpg">
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
   <style>
   	:root {
	    --primary-color: #002244;
	    --accent-color: #ff4c29;
	    --text-color: white;
	}
	
	body {
	    font-family: 'Poppins', sans-serif;
	    background-color: var(--primary-color);
	    color: var(--text-color);
	    padding: 20px 0;
	}
	
	.container {
	    max-width: 95%;
	    background: rgba(255, 255, 255, 0.1);
	    backdrop-filter: blur(10px);
	    padding: 20px;
	    border-radius: 12px;
	    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
	    margin: 0 auto;
	}
	
	/* Header Section Styles */
	.d-flex {
	    display: flex;
	}
	
	.justify-content-between {
	    justify-content: space-between;
	}
	
	.align-items-center {
	    align-items: center;
	}
	
	.mb-4 {
	    margin-bottom: 1.5rem;
	}
	
	.mb-0 {
	    margin-bottom: 0;
	}
	
	.mr-3 {
	    margin-right: 1rem;
	}
	
	/* Manager Count Badge */
	.manager-count-badge {
	    background-color: rgba(255, 76, 41, 0.7);
	    color: white;
	    padding: 8px 15px;
	    border-radius: 20px;
	    font-weight: 600;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    display: inline-flex;
	    align-items: center;
	}
	
	.manager-count-badge i {
	    margin-right: 8px;
	}
	
	/* Add Button */
	.btn-add {
	    background: var(--accent-color);
	    color: white;
	    font-weight: 600;
	    border-radius: 8px;
	    padding: 10px 20px;
	    transition: all 0.3s ease;
	    display: inline-flex;
	    align-items: center;
	    white-space: nowrap;
	    margin-bottom: 20px;
	}
	
	.btn-add:hover {
	    transform: translateY(-2px);
	    box-shadow: 0 4px 8px rgba(255, 76, 41, 0.3);
	}
	
	.btn-add i {
	    margin-right: 8px;
	}
	
	/* Responsive Table Styles */
	.responsive-table {
	    width: 100%;
	    border-collapse: collapse;
	    margin: 25px 0;
	    font-size: 0.9em;
	    border-radius: 5px 5px 0 0;
	    overflow: hidden;
	    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	}
	
	.responsive-table thead tr {
	    background-color: rgba(255, 76, 41, 0.7);
	    color: #ffffff;
	    text-align: left;
	    font-weight: bold;
	}
	
	.responsive-table th,
	.responsive-table td {
	    padding: 12px 15px;
	    vertical-align: middle;
	}
	
	.responsive-table tbody tr {
	    border-bottom: 1px solid rgba(221, 221, 221, 0.2);
	    background-color: rgba(0, 0, 0, 0.2);
	}
	
	.responsive-table tbody tr:nth-of-type(even) {
	    background-color: rgba(0, 0, 0, 0.3);
	}
	
	.responsive-table tbody tr:last-of-type {
	    border-bottom: 2px solid var(--accent-color);
	}
	
	.responsive-table tbody tr:hover {
	    background-color: rgba(255, 76, 41, 0.1);
	}
	
	/* Mobile Styles */
	@media screen and (max-width: 768px) {
	    .responsive-table {
	        display: block;
	        width: 100%;
	    }
	    
	    .responsive-table thead {
	        display: none;
	    }
	    
	    .responsive-table tbody, 
	    .responsive-table tr, 
	    .responsive-table td {
	        display: block;
	        width: 100%;
	    }
	    
	    .responsive-table tr {
	        margin-bottom: 15px;
	        border: 1px solid rgba(255, 255, 255, 0.2);
	        border-radius: 5px;
	    }
	    
	    .responsive-table td {
	        text-align: right;
	        padding-left: 50%;
	        position: relative;
	        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
	    }
	    
	    .responsive-table td:before {
	        content: attr(data-label);
	        position: absolute;
	        left: 15px;
	        width: calc(50% - 15px);
	        padding-right: 10px;
	        font-weight: bold;
	        text-align: left;
	        color: #ffcc00;
	    }
	    
	    .responsive-table td:last-child {
	        border-bottom: 0;
	    }
	    
	    .action-buttons {
	        display: flex;
	        justify-content: flex-end;
	        gap: 5px;
	    }
	}
	
	/* Action Buttons */
	.btn-action {
	    padding: 5px 10px;
	    font-size: 0.8rem;
	    margin: 2px;
	    min-width: 70px;
	}
	
	/* Password Field */
	.password-field {
	    display: flex;
	    align-items: center;
	    justify-content: flex-end;
	}
	
	.password-mask {
	    letter-spacing: 2px;
	}
	
	.btn-show-password {
	    background: transparent;
	    border: none;
	    color: white;
	    margin-left: 5px;
	    cursor: pointer;
	}
	
	/* Home Icon */
	.home-icon {
	    position: fixed;
	    top: 20px;
	    left: 20px;
	    font-size: 28px;
	    color: white;
	    text-decoration: none;
	    z-index: 1000;
	    background: rgba(0,0,0,0.5);
	    padding: 5px 10px;
	    border-radius: 50%;
	    transition: all 0.3s ease;
	}
	
	.home-icon:hover {
	    background: rgba(0,0,0,0.7);
	}
   </style>
</head>

<body>
    <!-- Back Button -->
    <a href="${pageContext.request.contextPath}/admin/adminDashboard.jsp" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="container">
    <!-- Header Section -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="mb-0">Inventory Managers List</h3>
        
        <div class="d-flex align-items-center">
            <c:if test="${not empty inventoryManagers}">
                <div class="manager-count-badge mr-3">
                    <i class="fas fa-users"></i> Total Managers: ${fn:length(inventoryManagers)}
                </div>
            </c:if>
            
            <a href="${pageContext.request.contextPath}/admin/createInventoryManager.jsp" class="btn btn-add">
                <i class="fas fa-plus"></i> Add New Manager
            </a>
        </div>
    </div>
    
        <c:if test="${not empty inventoryManagers}">
            <table class="responsive-table">
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
                    <c:forEach var="manager" items="${inventoryManagers}">
                        <tr>
                            <td data-label="ID">${manager.id}</td>
                            <td data-label="Username">${manager.username}</td>
                            <td data-label="First Name">${manager.firstName}</td>
                            <td data-label="Last Name">${manager.lastName}</td>
                            <td data-label="Phone">${manager.phone}</td>
                            <td data-label="Email">${manager.email}</td>
                            <td data-label="Password">
                                <div class="password-field">
                                    <span class="password-mask">••••••••</span>
                                    <button class="btn-show-password" onclick="togglePassword(this)">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <span class="actual-password" style="display:none;">${manager.password}</span>
                                </div>
                            </td>
                            <td data-label="Actions" class="action-buttons">
                                <form action="adminUpdateInventoryManager" method="get" style="display: inline;">
                                    <input type="hidden" name="id" value="${manager.id}">
                                    <button type="submit" class="btn btn-warning btn-sm btn-action">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                </form>
                                
                                <form action="deleteInventoryManager" method="POST" style="display: inline;">
                                    <input type="hidden" name="id" value="${manager.id}">
                                    <button type="submit" class="btn btn-danger btn-sm btn-action" 
                                            onclick="return confirm('Are you sure you want to delete this manager?')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty inventoryManagers}">
            <div class="alert alert-info mt-3">No inventory managers found.</div>
        </c:if>
    </div>

    <script>
        function togglePassword(button) {
            const row = button.closest('.password-field');
            const mask = row.querySelector('.password-mask');
            const actual = row.querySelector('.actual-password');
            const icon = button.querySelector('i');
            
            if (mask.style.display === 'none') {
                mask.style.display = 'inline';
                actual.style.display = 'none';
                icon.className = 'fas fa-eye';
            } else {
                mask.style.display = 'none';
                actual.style.display = 'inline';
                icon.className = 'fas fa-eye-slash';
            }
        }
    </script>
</body>
</html>