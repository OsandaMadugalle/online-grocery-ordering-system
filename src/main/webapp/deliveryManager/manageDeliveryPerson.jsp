<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.*" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${empty sessionScope.deliveryManagerDetails}">
    <c:redirect url="/deliveryManager/delLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Delivery Persons</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --primary-color: #1a1a2e;
            --secondary-color: #16213e;
            --accent-color: #0f3460;
            --highlight-color: #e94560;
            --text-color: #ffffff;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-color);
            color: var(--text-color);
            min-height: 100vh;
            padding: 20px;
        }

        .manager-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .manager-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .page-title {
            font-size: 28px;
            font-weight: 600;
            color: var(--highlight-color);
            margin: 0;
        }

        .manager-count {
            background-color: var(--highlight-color);
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
        }

        .manager-count i {
            margin-right: 8px;
        }

        .btn-add-manager {
            background: var(--highlight-color);
            color: white;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
        }

        .btn-add-manager:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(233, 69, 96, 0.3);
            color: white;
        }

        .btn-add-manager i {
            margin-right: 8px;
        }

        .manager-table-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            overflow-x: auto;
        }

        .manager-table {
            width: 100%;
            border-collapse: collapse;
            color: var(--text-color);
        }

        .manager-table thead tr {
            background-color: var(--highlight-color);
            color: white;
        }

        .manager-table th,
        .manager-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .manager-table tbody tr {
            transition: all 0.2s ease;
        }

        .manager-table tbody tr:nth-child(even) {
            background-color: rgba(0, 0, 0, 0.1);
        }

        .manager-table tbody tr:hover {
            background-color: rgba(233, 69, 96, 0.1);
        }

        .password-field {
            display: flex;
            align-items: center;
        }

        .password-mask {
            letter-spacing: 2px;
        }

        .btn-show-password {
            background: transparent;
            border: none;
            color: var(--highlight-color);
            margin-left: 10px;
            cursor: pointer;
            padding: 0;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .btn-action {
            padding: 8px 12px;
            border-radius: 5px;
            border: none;
            color: white;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-edit {
            background-color: #4e9f3d;
        }

        .btn-edit:hover {
            background-color: #3e7d32;
        }

        .btn-delete {
            background-color: #d32f2f;
        }

        .btn-delete:hover {
            background-color: #b71c1c;
        }

        .no-managers {
            background: rgba(0, 0, 0, 0.2);
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            color: var(--highlight-color);
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            color: var(--highlight-color);
            margin-bottom: 20px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .back-btn:hover {
            color: white;
            text-decoration: none;
        }

        .back-btn i {
            margin-right: 8px;
        }

        @media (max-width: 768px) {
            .manager-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .header-actions {
                width: 100%;
                display: flex;
                justify-content: space-between;
            }

            .manager-table {
                display: block;
                overflow-x: auto;
            }

            .manager-table td {
                min-width: 120px;
            }

            .action-buttons {
                justify-content: flex-end;
            }
        }

        @media (max-width: 576px) {
            .manager-table {
                display: block;
                width: 100%;
            }
            
            .manager-table thead {
                display: none;
            }
            
            .manager-table tbody, 
            .manager-table tr, 
            .manager-table td {
                display: block;
                width: 100%;
            }
            
            .manager-table tr {
                margin-bottom: 15px;
                border: 1px solid rgba(255, 255, 255, 0.2);
                border-radius: 5px;
                padding: 10px;
            }
            
            .manager-table td {
                text-align: right;
                padding-left: 50%;
                position: relative;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }
            
            .manager-table td:before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                width: calc(50% - 15px);
                padding-right: 10px;
                font-weight: bold;
                text-align: left;
                color: var(--highlight-color);
            }
            
            .manager-table td:last-child {
                border-bottom: 0;
            }
            
            .action-buttons {
                justify-content: flex-end;
            }
        }
    </style>
</head>

<body>
    <div class="manager-container">
        <a href="/deliveryManager/deliveryManagerDashboard.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>

        <div class="manager-header">
            <h1 class="page-title"><i class="fas fa-truck"></i> Manage Delivery Persons</h1>
            <div class="header-actions">
                <c:if test="${not empty deliveryPersons}">
                    <div class="manager-count">
                        <i class="fas fa-users"></i> Total Delivery Persons: ${fn:length(deliveryPersons)}
                    </div>
                </c:if>
                
                <a href="/deliveryManager/createDeliveryPerson.jsp" class="btn btn-add-manager">
                    <i class="fas fa-plus"></i> Add Delivery Person
                </a>
            </div>
        </div>

        <div class="manager-table-container">
            <c:if test="${not empty deliveryPersons}">
                <table class="manager-table">
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
                        <c:forEach var="dp" items="${deliveryPersons}">
                            <tr>
                                <td data-label="ID">${dp.id}</td>
                                <td data-label="Username">${dp.username}</td>
                                <td data-label="First Name">${dp.firstName}</td>
                                <td data-label="Last Name">${dp.lastName}</td>
                                <td data-label="Phone">${dp.phone}</td>
                                <td data-label="Email">${dp.email}</td>
                                <td data-label="Password">
                                    <div class="password-field">
                                        <span class="password-mask">••••••••</span>
                                        <button class="btn-show-password" onclick="togglePassword(this)">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <span class="actual-password" style="display:none;">${dp.password}</span>
                                    </div>
                                </td>
                                <td data-label="Actions">
                                    <div class="action-buttons">
                                        <form action="$./deliveryPersonUpdate" method="get" style="display: inline;">
                                            <input type="hidden" name="id" value="${dp.id}">
                                            <button type="submit" class="btn-action btn-edit" title="Edit">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                        </form>
                                        
                                        <form action="./deleteDeliveryPerson" method="POST" style="display: inline;">
                                            <input type="hidden" name="id" value="${dp.id}">
                                            <button type="submit" class="btn-action btn-delete" title="Delete"
                                                    onclick="return confirm('Are you sure you want to delete this delivery person?')">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty deliveryPersons}">
                <div class="no-managers">
                    <i class="fas fa-info-circle fa-2x"></i>
                    <h3>No Delivery Persons Found</h3>
                    <p>There are currently no delivery persons registered in the system.</p>
                    <a href="/deliveryManager/addDeliveryPerson.jsp" class="btn btn-add-manager mt-3">
                        <i class="fas fa-plus"></i> Add Your First Delivery Person
                    </a>
                </div>
            </c:if>
        </div>
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