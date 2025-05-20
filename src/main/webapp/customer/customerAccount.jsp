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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Profile</title>
    <link rel="icon" type="image/png" href="../images/fav.png">

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
            overflow-x: hidden;
        }

        .sidebar {
            width: var(--sidebar-width);
            background: rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(10px);
            padding: 20px;
            position: fixed;
            height: 100vh;
            z-index: 1050;
            box-shadow: 4px 0px 12px rgba(0, 0, 0, 0.3);
            border-right: 1px solid rgba(255, 255, 255, 0.1);
            transition: transform 0.3s ease;
        }

        .customer-name {
            color: white;
            font-size: 18px;
            margin-bottom: 20px;
            text-align: center;
            padding: 10px 0;
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
            transition: background 0.3s;
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
            box-shadow: 0 4px 12px rgba(255, 0, 0, 0.3);
        }

        .logout-btn:hover {
            background: darkred;
            transform: translateY(-2px);
        }

        .main-content {
            padding: 30px;
            margin-left: var(--sidebar-width);
            transition: all 0.3s ease;
            min-height: 100vh;
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
            padding: 5px 10px;
            font-size: 12px;
            transition: 0.3s;
            min-width: 60px;
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
            box-shadow: 0 4px 12px rgba(255, 76, 41, 0.3);
        }

        .btn-edit-profile:hover {
            background: linear-gradient(135deg, #e03e1a 0%, #e05a2a 100%);
            transform: translateY(-2px);
            color: white;
        }

        .profile-table {
            color: white;
            background-color: transparent;
            width: 100%;
        }

        .profile-table td {
            color: white;
            background-color: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.1);
            padding: 12px 15px;
        }

        .profile-table tbody tr:hover td {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .actual-password {
            color: white !important;
        }

        .menu-toggle {
            display: none;
            position: fixed;
            top: 15px;
            left: 15px;
            z-index: 1100;
            background: var(--accent-color);
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 14px;
            font-size: 18px;
            cursor: pointer;
            box-shadow: 0px 0px 8px rgba(0,0,0,0.2);
        }

        /* Responsive styles */
        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                z-index: 1050;
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
                padding: 20px;
                padding-top: 70px;
            }
            
            .menu-toggle {
                display: block;
            }
        }

        @media (max-width: 768px) {
            .welcome-message {
                font-size: 20px;
                margin-top: 10px;
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
                position: relative;
            }
            
            .profile-table td {
                text-align: right;
                position: relative;
                padding-left: 50%;
                padding-right: 15px;
            }
            
            .profile-table td::before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                font-weight: bold;
                text-align: left;
                color: #ffcc00;
                width: calc(50% - 15px);
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            
            .password-field {
                justify-content: flex-end;
            }
            
            .btn-edit-profile {
                width: 100%;
                padding: 12px;
            }
        }
        
        .button-container {
		    display: flex;
		    gap: 15px;
		    justify-content: center; /* Optional: Center the buttons */
		}
		
		.btn-edit-profile, .delete-btn {
		    display: inline-flex;
		    align-items: center;
		    gap: 8px;
		    padding: 12px 24px;
		    font-size: 16px;
		    border-radius: 5px;
		    text-decoration: none;
		    box-shadow: 0 4px 12px rgba(0, 76, 41, 0.3);
		    transition: all 0.3s ease;
		}
		
		.btn-edit-profile {
		    background: linear-gradient(135deg, #ff4c29 0%, #ff6b3d 100%);
		}
		
		.btn-edit-profile:hover {
		    background: linear-gradient(135deg, #e03e1a 0%, #e05a2a 100%);
		}
		
		.delete-btn {
		    background: #dc3545;
		    color: white;
		    padding: 12px 24px;
		    text-align: center;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: 0.3s;
		}
		
		.delete-btn:hover {
		    background: #c82333;
		    transform: translateY(-2px);
		}
		        

        @media (max-width: 576px) {
            .welcome-message {
                font-size: 18px;
            }
            
            .profile-table td {
                padding-left: 40%;
            }
            
            .profile-table td::before {
                width: calc(40% - 15px);
            }
            
            .detail-label {
                width: 100%;
            }
            
            .btn-show-password {
                padding: 8px 12px;
                font-size: 14px;
            }
        }

        @media (max-width: 400px) {
            .profile-table td {
                padding-left: 50%;
            }
            
            .profile-table td::before {
                width: calc(50% - 15px);
            }
            
            .main-content {
                padding: 15px;
                padding-top: 70px;
            }
        }
    </style>
</head>

<body>
    <button class="menu-toggle" id="menuToggle">
        <i class="fas fa-bars"></i>
    </button>

    <div class="sidebar" id="sidebar">
        <div class="customer-name">
            <i class="fas fa-user"></i>
            <span>${sessionScope.customerDetails[0].firstName} ${sessionScope.customerDetails[0].lastName}</span>
        </div>
        <a href="#" class="active"><i class="fas fa-tachometer-alt"></i> Profile</a>
        <a href="#"><i class="fas fa-shopping-bag"></i> Shop</a>
        <a href="#"><i class="fas fa-clipboard-list"></i> My Orders</a>
        <a href="./cart.jsp"><i class="fas fa-shopping-cart"></i> My Cart</a>
        <a href="#"><i class="fas fa-heart"></i> Wishlist</a>
        <a href="../webContent/index.jsp">
            <i class="fas fa-cog"></i>
            <span class="nav-text">Back To Site</span>
        </a>
        <a href="../customerLogoutServlet" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <div class="main-content" id="mainContent">
        <c:choose>
            <c:when test="${not empty sessionScope.customerDetails}">
                <div class="welcome-message">
                    <i class="fas fa-user"></i> Welcome, ${sessionScope.customerDetails[0].firstName} ${sessionScope.customerDetails[0].lastName}!
                </div>

                <div class="row">
				    <div class="col-12">
				        <div class="table-responsive">
				            <table class="profile-table table table-bordered">
				                <tbody>
				                    <c:forEach var="cd" items="${sessionScope.customerDetails}">
				                        <c:set var="id" value="${cd.id}"/>
				                        <c:set var="username" value="${cd.username}"/>
				                        <c:set var="fName" value="${cd.firstName}"/>
				                        <c:set var="lName" value="${cd.lastName}"/>
				                        <c:set var="phone" value="${cd.phone}"/>
				                        <c:set var="email" value="${cd.email}"/>
				                        <c:set var="password" value="${cd.password}"/>
				
				                        <tr><td class="detail-label" data-label="Customer ID"><i class="fas fa-id-card"></i> Customer ID</td><td><c:out value="${cd.id}"/></td></tr>
				                        <tr><td class="detail-label" data-label="Username"><i class="fas fa-user"></i> Username</td><td><c:out value="${cd.username}"/></td></tr>
				                        <tr><td class="detail-label" data-label="First Name"><i class="fas fa-signature"></i> First Name</td><td><c:out value="${cd.firstName}"/></td></tr>
				                        <tr><td class="detail-label" data-label="Last Name"><i class="fas fa-signature"></i> Last Name</td><td><c:out value="${cd.lastName}"/></td></tr>
				                        <tr><td class="detail-label" data-label="Phone"><i class="fas fa-phone"></i> Phone</td><td><c:out value="${cd.phone}"/></td></tr>
				                        <tr><td class="detail-label" data-label="Email"><i class="fas fa-envelope"></i> Email</td><td><c:out value="${cd.email}"/></td></tr>
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
				
				        <c:url value="updateCustomerProfile.jsp" var="customerUpdate">
				            <c:param name="id" value="${id}"/>
				            <c:param name="username" value="${username}"/>
				            <c:param name="fName" value="${fName}"/>
				            <c:param name="lName" value="${lName}"/>
				            <c:param name="phone" value="${phone}"/>
				            <c:param name="email" value="${email}"/>
				            <c:param name="password" value="${password}"/>
				        </c:url>
				
				        <!-- Buttons container -->
				        <div class="button-container mt-3 mb-4">
				            <a href="${customerUpdate}" class="btn-edit-profile">
				                <i class="fas fa-user-edit"></i> Edit Profile
				            </a>
				            
							<a href="../deleteCustomer?id=${id}" class="delete-btn" onclick="return confirm('Are you sure you want to delete your account? This action is irreversible.')">
								<i class="fas fa-trash-alt"></i> Delete Account
				            </a>
				        </div>
				    </div>
				</div>                        
            </c:when>
            <c:otherwise>
                <div class="alert alert-danger text-center mt-5">No customer details found.</div>
            </c:otherwise>
        </c:choose>
    </div>

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
                button.innerHTML = '<i class="fas fa-eye"></i> Show';
            } else {
                mask.style.display = 'none';
                actual.style.display = 'inline';
                button.innerHTML = '<i class="fas fa-eye-slash"></i> Hide';
            }
        }

        document.addEventListener('DOMContentLoaded', function () {
            const menuToggle = document.getElementById('menuToggle');
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('mainContent');

            menuToggle.addEventListener('click', function () {
                sidebar.classList.toggle('active');
                document.body.classList.toggle('sidebar-open');
            });

            // Close sidebar when clicking outside on mobile
            document.addEventListener('click', function (event) {
                if (window.innerWidth <= 992 && 
                    !sidebar.contains(event.target) && 
                    event.target !== menuToggle) {
                    sidebar.classList.remove('active');
                    document.body.classList.remove('sidebar-open');
                }
            });
            
            // Better handling of window resize
            window.addEventListener('resize', function() {
                if (window.innerWidth > 992) {
                    sidebar.classList.remove('active');
                    document.body.classList.remove('sidebar-open');
                }
            });
        });
    </script>
</body>
</html>