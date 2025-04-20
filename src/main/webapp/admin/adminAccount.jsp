<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>

<c:if test="${empty sessionScope.loggedIn or empty sessionScope.adminDetails}">
    <c:redirect url="/admin/adminLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #002244;
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 300px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 4px 0px 10px rgba(0, 0, 0, 0.3);
            align-items: center;
        }
        
        .admin-name {
            color: white;
            font-size: 18px;
            margin-bottom: 5px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px;
            display: block;
            font-size: 16px;
            margin: 10px 0;
            border-radius: 5px;
            transition: 0.3s;
            width: 100%;
            text-align: center;
        }

        .sidebar a:hover, .sidebar a.active {
            background: #ff4c29;
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
            width: 100%;
        }

        .logout-btn:hover {
            background: darkred;
        }

        .main-content {
            flex: 1;
            padding: 30px;
            color: white;
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
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            color: white;
            border-radius: 10px;
            overflow: hidden;
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
            background-color: rgba(255, 255, 255, 0.15);
        }
        
        .detail-label {
            font-weight: 600;
            color: #ffcc00;
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
            background: linear-gradient(135deg, #ff4c29 0%, #ff6b3d 100%); 
            box-shadow: 0 4px 8px rgba(255, 76, 41, 0.3); 
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
    </style>
</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="#" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="../manageAdmin"><i class="fas fa-users-cog"></i> Manage Admins</a>
        <a href="../manageInventoryManager"><i class="fas fa-boxes"></i> Manage Inventory Managers</a>
        <a href="manageDelivery.jsp"><i class="fas fa-truck"></i> Manage Delivery Managers</a>
        <a href="#"><i class="fas fa-users"></i> Manage Users</a>
        <a href="../index.jsp"><i class="fas fa-cog"></i> Site Settings</a>
        <a href="../LogoutServlet" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <c:choose>
            <c:when test="${not empty sessionScope.adminDetails}">
                <div class="welcome-message">
                    <i class="fas fa-user-shield"></i> Welcome, ${sessionScope.adminDetails[0].first_name} ${sessionScope.adminDetails[0].last_name}!
                </div>
                
                <div class="table-responsive">
                    <table class="table table-bordered">				            
                        <tbody>
                            <c:forEach var="ad" items="${sessionScope.adminDetails}">
                            <c:set var="id" value="${ad.admin_id}"/>
                            <c:set var="username" value="${ad.username}"/>
                            <c:set var="fName" value="${ad.first_name}"/>
                            <c:set var="lName" value="${ad.last_name}"/>
                            <c:set var="phone" value="${ad.phone}"/>
                            <c:set var="email" value="${ad.email}"/>
                            <c:set var="password" value="${ad.password}"/>
                            
                            <tr class="detail-row">
                                <td class="detail-label"><i class="fas fa-id-card"></i> Admin ID</td>
                                <td class="detail-value"><c:out value="${ad.admin_id}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label"><i class="fas fa-user"></i> Username</td>
                                <td class="detail-value"><c:out value="${ad.username}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label"><i class="fas fa-signature"></i> First Name</td>
                                <td class="detail-value"><c:out value="${ad.first_name}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label"><i class="fas fa-signature"></i> Last Name</td>
                                <td class="detail-value"><c:out value="${ad.last_name}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label"><i class="fas fa-phone"></i> Phone</td>
                                <td class="detail-value"><c:out value="${ad.phone}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label"><i class="fas fa-envelope"></i> Email</td>
                                <td class="detail-value"><c:out value="${ad.email}"/></td>
                            </tr>
                            <tr class="detail-row">
                                <td class="detail-label"><i class="fas fa-lock"></i> Password</td>
                                <td class="detail-value">
                                    <div class="password-field">
                                        <span class="password-mask">••••••••</span>
                                        <button class="btn btn-sm btn-show-password" onclick="togglePassword(this)">
                                            <i class="fas fa-eye"></i> Show
                                        </button>
                                        <span class="actual-password" style="display:none;"><c:out value="${ad.password}"/></span>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <c:url value="updateAdminProfile.jsp" var="adminUpdate">
                        <c:param name="id" value="${id}"/>
                        <c:param name="username" value="${username}"/>
                        <c:param name="fName" value="${fName}"/>
                        <c:param name="lName" value="${lName}"/>
                        <c:param name="phone" value="${phone}"/>
                        <c:param name="email" value="${email}"/>
                        <c:param name="password" value="${password}"/>
                    </c:url>

                    <a href="${adminUpdate}" class="btn-edit-profile">
                        <i class="fas fa-user-edit"></i> Edit Profile
                    </a>
                    
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-danger text-center mt-5">No admin details found.</div>
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
    </script>
</body>
</html>