<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.Admin" %>
<%@ page session="true" %>

<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("loggedIn") == null) {
        response.sendRedirect("../admin/adminLogin.jsp"); // Redirect to admin folder
        return;
    }

    List<Admin> adminDetails = (List<Admin>) sessionObj.getAttribute("adminDetails");
    if (adminDetails == null || adminDetails.isEmpty()) {
        response.sendRedirect("../admin/adminLogin.jsp"); // Redirect to admin folder
        return;
    }

    Admin admin = adminDetails.get(0);
%>
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
            background: linear-gradient(135deg, #1b1b2f, #162447);
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 4px 0px 10px rgba(0, 0, 0, 0.3);
            align-items: center;
        }

        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 3px solid white;
            margin-bottom: 10px;
        }

        .admin-name {
            color: white;
            font-size: 18px;
            margin-bottom: 5px;
        }

        .admin-role {
            color: #ff4c29;
            font-size: 14px;
            margin-bottom: 20px;
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

        .dashboard-cards {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            width: 250px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            margin: 15px;
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
            width: 50%;
            color: white;
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        th {
            background: rgba(255, 255, 255, 0.2);
        }

        .btn-download {
            margin-top: 10px;
            background: #ff4c29;
            border: none;
            color: white;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn-download:hover {
            background: #e03e1a;
        }
    </style>
</head>

<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="admin-role" id="adminRole">Administrator</div>
        <a href="#" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="updateAdmin.jsp"><i class="fas fa-user-edit"></i> Edit Profile</a>
        <a href="#"><i class="fas fa-users"></i> Manage Users</a>
        <a href="#"><i class="fas fa-chart-line"></i> Reports</a>
        <a href="#"><i class="fas fa-cog"></i> Settings</a>
        <a href="../LogoutServlet" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>

    <!-- Right Section -->
    <div class="container mt-4" style="width: 75%;">
        <c:if test="${not empty adminDetails}">          

           <div class="container mt-4">
                <div class="table-responsive">
                    <table class="table table-bordered">				            
                        <tbody>
                            <c:forEach var="ad" items="${adminDetails}">
                                <tr>
                                    <td><strong>Admin ID</strong></td>
                                    <td><c:out value="${ad.admin_id}" /></td>
                                </tr>
                                <tr>
                                    <td><strong>Username</strong></td>
                                    <td><c:out value="${ad.username}" /></td>
                                </tr>
                                <tr>
                                    <td><strong>First Name</strong></td>
                                    <td><c:out value="${ad.first_name}" /></td>
                                </tr>
                                <tr>
                                    <td><strong>Last Name</strong></td>
                                    <td><c:out value="${ad.last_name}" /></td>
                                </tr>
                                <tr>
                                    <td><strong>Phone</strong></td>
                                    <td><c:out value="${ad.phone}" /></td>
                                </tr>
                                <tr>
                                    <td><strong>Email</strong></td>
                                    <td><c:out value="${ad.email}" /></td>
                                </tr>
                                <tr>
                                    <td><strong>Password</strong></td>
                                    <td><c:out value="${ad.password}" /></td>
                                </tr>                                
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </c:if>
        <c:if test="${empty adminDetails}">
            <div class="alert alert-danger text-center mt-5">No admin details found.</div>
        </c:if>
    </div>
</div>
 <!-- Include Bootstrap JS -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
