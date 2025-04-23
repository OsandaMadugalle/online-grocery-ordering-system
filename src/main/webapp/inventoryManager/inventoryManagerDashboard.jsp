<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
 
<c:if test="${empty sessionScope.loggedIn or empty sessionScope.inventoryManagerDetails}">
    <c:redirect url="/inventoryManager/inventoryManagerLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Inventory Manager Dashboard</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --sidebar-width: 300px;
            --sidebar-collapsed-width: 80px;
            --primary-color: #1a1a2e;
            --secondary-color: #16213e;
            --accent-color: #4cc9f0;
            --text-color: white;
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
            background: rgba(255, 255, 255, 0.1);
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
        
        .sidebar-collapsed .nav-text {
            display: none;
        }
        
        .sidebar-collapsed a {
            justify-content: center;
            padding: 12px 0;
        }
        
        .sidebar-collapsed .admin-name {
            display: none;
        }
        
        .sidebar-collapsed .logout-btn span {
            display: none;
        }
        
        .admin-name {
            color: white;
            font-size: 18px;
            margin-bottom: 5px;
            text-align: center;
            padding: 10px 0;
            white-space: nowrap;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px;
            display: flex;
            align-items: center;
            font-size: 16px;
            margin: 10px 0;
            border-radius: 5px;
            transition: 0.3s;
            width: 100%;
            white-space: nowrap;
        }

        .sidebar a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .sidebar a:hover, .sidebar a.active {
            background: var(--accent-color);
            color: #080710;
        }

        .logout-btn {
            margin-top: auto;
            background: #e94560;
            color: white;
            padding: 12px;
            text-align: center;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-btn:hover {
            background: #c2334d;
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

        .admin-details {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .table-container {
            margin-top: 30px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            color: white;
            border-radius: 10px;
            overflow: hidden;
            min-width: 600px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        th {
            background: rgba(255, 255, 255, 0.2);
        }

        .welcome-message {
            color: white;
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 600;
        }
        
        .detail-row {
            transition: background-color 0.3s ease;
        }
        
        .detail-row:hover {
            background-color: rgba(76, 201, 240, 0.1);
        }
        
        .detail-label {
            font-weight: 600;
            color: var(--accent-color);
            width: 35%;
            vertical-align: middle;
        }
        
        .detail-label i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .detail-value {
            color: #ffffff;
            vertical-align: middle;
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
            padding: 2px 8px;
            font-size: 12px;
        }
        
        .btn-show-password:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        
        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .btn-edit-profile {
            background: linear-gradient(135deg, var(--accent-color) 0%, #3a9ec7 100%); 
            box-shadow: 0 4px 8px rgba(76, 201, 240, 0.3); 
            padding: 12px 24px;
            font-size: 16px;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
        
        .btn-edit-profile:hover {
            background: linear-gradient(135deg, #3a9ec7 0%, #2e8ab8 100%);
            color: white;
        }
        
        /* Mobile Menu Toggle */
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
            cursor: pointer;
        }
        
        /* Responsive Styles */
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
            
            table {
                font-size: 14px;
            }
            
            th, td {
                padding: 8px 12px;
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
        }
        
        @media (max-width: 576px) {
            .main-content {
                padding: 20px 15px;
            }
            
            .welcome-message {
                font-size: 18px;
                margin-bottom: 15px;
            }
        }
        
        @media (max-width: 768px) {
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
              border: 1px solid rgba(255,255,255,0.2);
              border-radius: 5px;
            }
            
            .profile-table td {
              padding: 10px 15px;
              text-align: right;
              position: relative;
              border: none;
              border-bottom: 1px solid rgba(255,255,255,0.1);
            }
            
            .profile-table td:last-child {
              border-bottom: none;
            }
            
            .profile-table td::before {
              content: attr(data-label);
              position: absolute;
              left: 15px;
              top: 10px;
              font-weight: bold;
              text-align: left;
              color: var(--accent-color);
            }
            
            .password-field {
              justify-content: flex-end;
            }
        }
    </style>
</head>

<body>
    <!-- Mobile Menu Toggle -->
    <button class="menu-toggle" id="menuToggle">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="admin-name">
            <i class="fas fa-boxes"></i>
            <span class="nav-text">${sessionScope.inventoryManagerDetails[0].first_name} ${sessionScope.inventoryManagerDetails[0].last_name}</span>
        </div>
        
        <a href="#" class="active">
            <i class="fas fa-tachometer-alt"></i>
            <span class="nav-text">Dashboard</span>
        </a>
        
        <a href="../manageProducts">
            <i class="fas fa-box-open"></i>
            <span class="nav-text">Products</span>
        </a>
        
        <a href="../manageInventory">
            <i class="fas fa-warehouse"></i>
            <span class="nav-text">Inventory</span>
        </a>  
        
        <a href="../manageCategories">
            <i class="fas fa-tags"></i>
            <span class="nav-text">Categories</span>
        </a>
        
        <a href="../manageSuppliers">
            <i class="fas fa-truck-loading"></i>
            <span class="nav-text">Suppliers</span>
        </a>
        
        <a href="../manageOrders">
            <i class="fas fa-clipboard-list"></i>
            <span class="nav-text">Orders</span>
        </a>
          
        <a href="../inventoryManagerLogoutServlet" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i>
            <span class="nav-text">Logout</span>
        </a>
    </div>

    <!-- Main Content -->
    <div class="main-content" id="mainContent">
        <c:choose>
            <c:when test="${not empty sessionScope.inventoryManagerDetails}">
                <div class="welcome-message">
                    <i class="fas fa-boxes"></i> Welcome, ${sessionScope.inventoryManagerDetails[0].first_name} ${sessionScope.inventoryManagerDetails[0].last_name}!
                </div>
                
               <div class="table-responsive">
                <div class="table-container">
                    <table class="profile-table table-bordered">
                        <tbody>
                            <c:forEach var="im" items="${sessionScope.inventoryManagerDetails}">
                            <c:set var="id" value="${im.inventory_manager_id}"/>
                            <c:set var="username" value="${im.username}"/>
                            <c:set var="fName" value="${im.first_name}"/>
                            <c:set var="lName" value="${im.last_name}"/>
                            <c:set var="phone" value="${im.phone}"/>
                            <c:set var="email" value="${im.email}"/>
                            <c:set var="password" value="${im.password}"/>
                            
                            <tr class="detail-row">
                                <td class="detail-label" data-label="Manager ID"><i class="fas fa-id-card"></i> Manager ID</td>
                                <td class="detail-value"><c:out value="${im.inventory_manager_id}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label" data-label="Username"><i class="fas fa-user"></i> Username</td>
                                <td class="detail-value"><c:out value="${im.username}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label" data-label="First Name"><i class="fas fa-signature"></i> First Name</td>
                                <td class="detail-value"><c:out value="${im.first_name}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label" data-label="Last Name"><i class="fas fa-signature"></i> Last Name</td>
                                <td class="detail-value"><c:out value="${im.last_name}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label" data-label="Phone"><i class="fas fa-phone"></i> Phone</td>
                                <td class="detail-value"><c:out value="${im.phone}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label" data-label="Email"><i class="fas fa-envelope"></i> Email</td>
                                <td class="detail-value"><c:out value="${im.email}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label" data-label="Password"><i class="fas fa-lock"></i> Password</td>
                                <td class="detail-value">
                                    <div class="password-field">
                                        <span class="password-mask">••••••••</span>
                                        <button class="btn btn-sm btn-show-password" onclick="togglePassword(this)">
                                            <i class="fas fa-eye"></i> Show
                                        </button>
                                        <span class="actual-password" style="display:none;"><c:out value="${im.password}"/></span>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
                    
                    <c:url value="updateInventoryManagerProfile.jsp" var="inventoryManagerUpdate">
                        <c:param name="id" value="${id}"/>
                        <c:param name="username" value="${username}"/>
                        <c:param name="fName" value="${fName}"/>
                        <c:param name="lName" value="${lName}"/>
                        <c:param name="phone" value="${phone}"/>
                        <c:param name="email" value="${email}"/>
                        <c:param name="password" value="${password}"/>
                    </c:url>

                    <a href="${inventoryManagerUpdate}" class="btn-edit-profile">
                        <i class="fas fa-user-edit"></i> Edit Profile
                    </a>
                    
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-danger text-center mt-5">No inventory manager details found.</div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
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
        
        // Mobile menu toggle functionality
        document.addEventListener('DOMContentLoaded', function() {
            const menuToggle = document.getElementById('menuToggle');
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('mainContent');
            
            menuToggle.addEventListener('click', function() {
                sidebar.classList.toggle('active');
            });
            
            // Close sidebar when clicking outside on mobile
            document.addEventListener('click', function(event) {
                if (window.innerWidth <= 992 && 
                    !sidebar.contains(event.target) && 
                    event.target !== menuToggle) {
                    sidebar.classList.remove('active');
                }
            });
            
            // Toggle sidebar collapse on larger screens
            function handleResize() {
                if (window.innerWidth > 992) {
                    sidebar.classList.remove('active');
                }
            }            
            window.addEventListener('resize', handleResize);
        });
    </script>
</body>
</html>