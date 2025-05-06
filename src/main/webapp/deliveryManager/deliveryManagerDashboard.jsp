<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Manager Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --sidebar-width: 300px;
            --sidebar-collapsed-width: 80px;
            --primary-color: #1f1f3a;
            --accent-color: #ff6f61;
            --highlight-color: #fcd34d;
            --text-color: #ffffff;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-color);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .sidebar {
            width: var(--sidebar-width);
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            padding: 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 4px 0px 10px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease;
            position: fixed;
            height: 100vh;
            z-index: 1000;
        }

        .sidebar-collapsed {
            width: var(--sidebar-collapsed-width);
            overflow: hidden;
        }

        .sidebar-collapsed .nav-text,
        .sidebar-collapsed .manager-name,
        .sidebar-collapsed .logout-btn span {
            display: none;
        }

        .sidebar a {
            color: var(--text-color);
            text-decoration: none;
            padding: 12px;
            display: flex;
            align-items: center;
            font-size: 16px;
            margin: 10px 0;
            border-radius: 5px;
            transition: 0.3s;
        }

        .sidebar a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: var(--accent-color);
        }

        .logout-btn {
            margin-top: auto;
            background: #dc3545;
            color: white;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            justify-content: center;
        }

        .logout-btn:hover {
            background-color: #b02a37;
        }

        .main-content {
            flex: 1;
            padding: 30px;
            margin-left: var(--sidebar-width);
            transition: margin-left 0.3s ease;
        }

        .main-content-expanded {
            margin-left: var(--sidebar-collapsed-width);
        }

        .manager-name {
            text-align: center;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 18px;
        }

        .welcome-message {
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            overflow: hidden;
            color: var(--text-color);
            min-width: 600px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.15);
        }

        th {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .detail-label {
            font-weight: 600;
            color: var(--highlight-color);
            width: 35%;
        }

        .password-field {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .password-mask {
            letter-spacing: 2px;
        }

        .btn-show-password {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            font-size: 12px;
        }

        .btn-edit-profile {
            background: linear-gradient(135deg, var(--accent-color), #ff8369);
            box-shadow: 0 4px 8px rgba(255, 76, 41, 0.3);
            padding: 12px 24px;
            border-radius: 5px;
            color: white;
            font-weight: 500;
            text-decoration: none;
        }

        .btn-edit-profile:hover {
            background: #e05a4f;
        }

        .menu-toggle {
            display: none;
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1100;
            background: var(--accent-color);
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
        }

        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
                position: fixed;
                z-index: 1000;
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
                padding-top: 80px;
            }

            .menu-toggle {
                display: block;
            }
        }

        @media (max-width: 768px) {
            .welcome-message {
                font-size: 20px;
            }

            .btn-edit-profile {
                padding: 10px 15px;
                font-size: 14px;
            }

            .profile-table,
            .profile-table tbody,
            .profile-table tr,
            .profile-table td {
                display: block;
                width: 100%;
            }

            .profile-table thead {
                display: none;
            }

            .profile-table tr {
                margin-bottom: 15px;
                background: rgba(255,255,255,0.05);
            }

            .profile-table td {
                padding: 10px 15px;
                text-align: right;
                position: relative;
            }

            .profile-table td::before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                top: 10px;
                font-weight: bold;
                text-align: left;
                color: var(--highlight-color);
            }
        }
    </style>
</head>

<body>
    <button class="menu-toggle" id="menuToggle">
        <i class="fas fa-bars"></i>
    </button>

    <div class="sidebar" id="sidebar">
        <div class="manager-name">
            <i class="fas fa-truck"></i>
            <span class="nav-text">${sessionScope.deliveryManagerDetails.firstName} ${sessionScope.deliveryManagerDetails.lastName}</span>
        </div>
        <a href="#" class="active"><i class="fas fa-tachometer-alt"></i> <span class="nav-text">Dashboard</span></a>
        <a href="../manageDeliveries"><i class="fas fa-shipping-fast"></i> <span class="nav-text">Deliveries</span></a>
        <a href="../manageDrivers"><i class="fas fa-user-tie"></i> <span class="nav-text">Drivers</span></a>
        <a href="../manageVehicles"><i class="fas fa-truck-pickup"></i> <span class="nav-text">Vehicles</span></a>
        <a href="../LogoutServlet" class="logout-btn"><i class="fas fa-sign-out-alt"></i> <span class="nav-text">Logout</span></a>
    </div>

    <div class="main-content" id="mainContent">
        <c:choose>
            <c:when test="${not empty sessionScope.deliveryManagerDetails}">
                <div class="welcome-message">
                    <i class="fas fa-truck"></i> Welcome, ${sessionScope.deliveryManagerDetails.firstName} ${sessionScope.deliveryManagerDetails.lastName}!
                </div>

                <div class="table-container">
                    <table class="profile-table table-bordered">
                        <tbody>
                            <tr class="detail-row"><td class="detail-label" data-label="Manager ID"><i class="fas fa-id-card"></i> Manager ID</td><td class="detail-value">${sessionScope.deliveryManagerDetails.managerId}</td></tr>
                            <tr class="detail-row"><td class="detail-label" data-label="Username"><i class="fas fa-user"></i> Username</td><td class="detail-value">${sessionScope.deliveryManagerDetails.username}</td></tr>
                            <tr class="detail-row"><td class="detail-label" data-label="First Name"><i class="fas fa-signature"></i> First Name</td><td class="detail-value">${sessionScope.deliveryManagerDetails.firstName}</td></tr>
                            <tr class="detail-row"><td class="detail-label" data-label="Last Name"><i class="fas fa-signature"></i> Last Name</td><td class="detail-value">${sessionScope.deliveryManagerDetails.lastName}</td></tr>
                            <tr class="detail-row"><td class="detail-label" data-label="Phone"><i class="fas fa-phone"></i> Phone</td><td class="detail-value">${sessionScope.deliveryManagerDetails.phone}</td></tr>
                            <tr class="detail-row"><td class="detail-label" data-label="Email"><i class="fas fa-envelope"></i> Email</td><td class="detail-value">${sessionScope.deliveryManagerDetails.email}</td></tr>
                            <tr class="detail-row"><td class="detail-label" data-label="Password"><i class="fas fa-lock"></i> Password</td>
                                <td class="detail-value">
                                    <div class="password-field">
                                        <span class="password-mask">••••••••</span>
                                        <button class="btn btn-sm btn-show-password" onclick="togglePassword(this)">
                                            <i class="fas fa-eye"></i> Show
                                        </button>
                                        <span class="actual-password" style="display:none;">${sessionScope.deliveryManagerDetails.password}</span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <c:url value="updateDeliveryManagerProfile.jsp" var="managerUpdate">
                    <c:param name="id" value="${sessionScope.deliveryManagerDetails.managerId}"/>
                    <c:param name="username" value="${sessionScope.deliveryManagerDetails.username}"/>
                    <c:param name="firstName" value="${sessionScope.deliveryManagerDetails.firstName}"/>
                    <c:param name="lastName" value="${sessionScope.deliveryManagerDetails.lastName}"/>
                    <c:param name="phone" value="${sessionScope.deliveryManagerDetails.phone}"/>
                    <c:param name="email" value="${sessionScope.deliveryManagerDetails.email}"/>
                    <c:param name="password" value="${sessionScope.deliveryManagerDetails.password}"/>
                </c:url>

                <a href="${managerUpdate}" class="btn-edit-profile mt-4">
                    <i class="fas fa-user-edit"></i> Edit Profile
                </a>

            </c:when>
            <c:otherwise>
                <div class="alert alert-danger text-center mt-5">No delivery manager details found.</div>
            </c:otherwise>
        </c:choose>
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
                button.innerHTML = '<i class="fas fa-eye"></i> Show';
            } else {
                mask.style.display = 'none';
                actual.style.display = 'inline';
                icon.className = 'fas fa-eye-slash';
                button.innerHTML = '<i class="fas fa-eye-slash"></i> Hide';
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const menuToggle = document.getElementById('menuToggle');
            const sidebar = document.getElementById('sidebar');

            menuToggle.addEventListener('click', function () {
                sidebar.classList.toggle('active');
            });

            document.addEventListener('click', function (event) {
                if (window.innerWidth <= 992 &&
                    !sidebar.contains(event.target) &&
                    event.target !== menuToggle) {
                    sidebar.classList.remove('active');
                }
            });
        });
    </script>
</body>
</html>