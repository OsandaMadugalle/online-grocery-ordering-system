<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>

<c:if test="${empty sessionScope.loggedIn or empty sessionScope.customerDetails}">
    <c:redirect url="./cusLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --sidebar-width: 250px;
            --primary-color: #013220;
            --accent-color: #ff4c29;
            --text-color: white;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-color);
            color: var(--text-color);
            min-height: 100vh;
        }

        .sidebar {
            width: var(--sidebar-width);
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            position: fixed;
            height: 100vh;
            z-index: 1000;
            box-shadow: 4px 0px 10px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
        }

        .customer-name {
            color: white;
            font-size: 18px;
            margin-bottom: 20px;
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
        }

        .sidebar a i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .sidebar a:hover, .sidebar a.active {
            background: var(--accent-color);
        }

        .logout-btn {
            margin-top: auto;
            background: red;
            color: white;
            padding: 12px;
            text-align: center;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-btn:hover {
            background: darkred;
        }

        .main-content {
            padding: 30px;
            margin-left: var(--sidebar-width);
            transition: margin-left 0.3s ease;
        }

        .welcome-message {
            color: white;
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 600;
        }
        
        .detail-label {
            font-weight: 600;
            color: #ffcc00;
            width: 35%;
        }
        
        .detail-label i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
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
        
        .btn-edit-profile {
            background: linear-gradient(135deg, #ff4c29 0%, #ff6b3d 100%); 
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
            background: linear-gradient(135deg, #e03e1a 0%, #e05a2a 100%);
            color: white;
        }

        /* Table Styling Fixes */
        .profile-table {
            color: white;
            background-color: transparent;
        }

        .profile-table td {
            color: white;
            background-color: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.1);
        }

        .profile-table tbody tr:hover td {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .actual-password {
            color: white !important;
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
            }
            
            .profile-table td {
              text-align: right;
              position: relative;
              padding-left: 50%;
            }
            
            .profile-table td::before {
              content: attr(data-label);
              position: absolute;
              left: 15px;
              font-weight: bold;
              text-align: left;
              color: #ffcc00;
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
        <div class="customer-name">
            <i class="fas fa-user"></i>
            <span>${sessionScope.customerDetails[0].first_name} ${sessionScope.customerDetails[0].last_name}</span>
        </div>
        <a href="#" class="active">
            <i class="fas fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
        <a href="./viewProducts.jsp">
            <i class="fas fa-shopping-bag"></i>
            <span>Shop</span>
        </a>
        <a href="./viewOrders.jsp">
            <i class="fas fa-clipboard-list"></i>
            <span>My Orders</span>
        </a>
        <a href="./viewCart.jsp">
            <i class="fas fa-shopping-cart"></i>
            <span>My Cart</span>
        </a>
        <a href="./viewWishlist.jsp">
            <i class="fas fa-heart"></i>
            <span>Wishlist</span>
        </a>
        <a href="${pageContext.request.contextPath}/customerLogoutServlet" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i>
            <span>Logout</span>
        </a>
    </div>

    <!-- Main Content -->
    <div class="main-content" id="mainContent">
        <c:choose>
            <c:when test="${not empty sessionScope.customerDetails}">
                <div class="welcome-message">
                    <i class="fas fa-user"></i> Welcome, ${sessionScope.customerDetails[0].first_name} ${sessionScope.customerDetails[0].last_name}!
                </div>
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="table-responsive">
                            <table class="profile-table table table-bordered">
                                <tbody>
                                    <c:forEach var="cd" items="${sessionScope.customerDetails}">
                                    <c:set var="id" value="${cd.customer_id}"/>
                                    <c:set var="username" value="${cd.username}"/>
                                    <c:set var="fName" value="${cd.first_name}"/>
                                    <c:set var="lName" value="${cd.last_name}"/>
                                    <c:set var="phone" value="${cd.phone}"/>
                                    <c:set var="email" value="${cd.email}"/>
                                    <c:set var="password" value="${cd.password}"/>
                                    
                                    <tr>
                                        <td class="detail-label" data-label="Customer ID"><i class="fas fa-id-card"></i> Customer ID</td>
                                        <td><c:out value="${cd.customer_id}"/></td>
                                    </tr>
                                    <tr>
                                        <td class="detail-label" data-label="Username"><i class="fas fa-user"></i> Username</td>
                                        <td><c:out value="${cd.username}"/></td>
                                    </tr>
                                    <tr>
                                        <td class="detail-label" data-label="First Name"><i class="fas fa-signature"></i> First Name</td>
                                        <td><c:out value="${cd.first_name}"/></td>
                                    </tr>
                                    <tr>
                                        <td class="detail-label" data-label="Last Name"><i class="fas fa-signature"></i> Last Name</td>
                                        <td><c:out value="${cd.last_name}"/></td>
                                    </tr>
                                    <tr>
                                        <td class="detail-label" data-label="Phone"><i class="fas fa-phone"></i> Phone</td>
                                        <td><c:out value="${cd.phone}"/></td>
                                    </tr>
                                    <tr>
                                        <td class="detail-label" data-label="Email"><i class="fas fa-envelope"></i> Email</td>
                                        <td><c:out value="${cd.email}"/></td>
                                    </tr>
                                    <tr>
                                        <td class="detail-label" data-label="Password"><i class="fas fa-lock"></i> Password</td>
                                        <td>
                                            <div class="password-field">
                                                <span class="password-mask">••••••••</span>
                                                <button class="btn btn-sm btn-show-password" onclick="togglePassword(this)">
                                                    <i class="fas fa-eye"></i> Show
                                                </button>
                                                <span class="actual-password" style="display:none;"><c:out value="${cd.password}"/></span>
                                            </div>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
                        <c:url value="customer/updateCustomerProfile.jsp" var="customerUpdate">
                            <c:param name="id" value="${id}"/>
                            <c:param name="username" value="${username}"/>
                            <c:param name="fName" value="${fName}"/>
                            <c:param name="lName" value="${lName}"/>
                            <c:param name="phone" value="${phone}"/>
                            <c:param name="email" value="${email}"/>
                            <c:param name="password" value="${password}"/>
                        </c:url>

                        <a href="${customerUpdate}" class="btn-edit-profile mt-3">
                            <i class="fas fa-user-edit"></i> Edit Profile
                        </a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-danger text-center mt-5">No customer details found.</div>
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
        });
    </script>
</body>
</html>