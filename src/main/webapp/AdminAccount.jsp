<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Session validation to check if the user is logged in
    if (session == null || session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
        // Redirect to login.jsp if the user is not logged in
        response.sendRedirect("login.jsp");
        return;
    }

    // Retrieve logoutMessage if exists
    String logoutMessage = (String) session.getAttribute("logoutMessage");
    if (logoutMessage != null) {
%>
    <!-- Display logout success message -->
    <div class="alert alert-success text-center" role="alert" style="margin-top: 20px;">
        <%= logoutMessage %>
    </div>
<%
        // Remove the message from the session after displaying it
        session.removeAttribute("logoutMessage");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Include Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .d-flex {
            background-color: #36454F;
            color: white;
        }

        .custom-list li {
            padding: 10px;
            transition: all 0.3s;
        }

        .custom-list li:hover {
            background-color: grey;
        }

        .home-icon {
            position: absolute;
            top: 10px;
            left: 10px;
            color: white;
            font-size: 1.5rem;
            text-decoration: none;
        }

        .home-icon:hover {
            color: #f8f9fa;
        }

        .vr {
            width: 5px;
            background-color: white;
        }
    </style>
</head>
<body>
    <!-- Home Icon -->
    <a href="index.jsp" class="home-icon" style="margin-left:20px;">
        <i class="bi bi-house-fill"></i> <!-- Bootstrap's Home Icon -->
    </a>

    <div class="d-flex">
        <!-- Left Section -->
        <div class="container mt-4" style="width: 25%;">
            <ul class="list-unstyled custom-list">
                <br>
                <hr>
                <li><a href="#" style="text-decoration: none; color: inherit;">Customer Details</a></li>
                <hr>
                <li><a href="#" style="text-decoration: none; color: inherit;">Staff Details</a></li>
                <hr>
                <li><a href="#" style="text-decoration: none; color: inherit;">Delivery Person Details</a></li>
                <hr>
            </ul>
        </div>

        <!-- Vertical Divider -->
        <div class="vr mx-3"></div>

        <!-- Right Section -->
        <div class="container mt-4" style="width: 75%;">
            <c:if test="${not empty adminDetails}">
                <div class="text-center mb-4">
                    <h2>My Profile</h2>
                </div>
                <c:forEach var="ad" items="${adminDetails}">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h3 class="card-title text-center">${ad.first_name} ${ad.last_name}</h3>
                            <hr style="height:2px; color:black;">
                            
                            <p><strong>Admin ID:</strong> <c:out value="${ad.admin_id}" /></p>
                            <p><strong>Username:</strong> <c:out value="${ad.username}" /></p>
                            <p><strong>First Name:</strong> <c:out value="${ad.first_name}" /></p>
                            <p><strong>Last Name:</strong> <c:out value="${ad.last_name}" /></p>
                            <p><strong>Phone:</strong> <c:out value="${ad.phone}" /></p>
                            <p><strong>Email:</strong> <c:out value="${ad.email}" /></p>
                            <p><strong>Password:</strong> <c:out value="${ad.password}" /></p>
                            <a href="editProfile.jsp" class="btn btn-primary">Edit Profile</a>
                        </div>
                    </div>
                </c:forEach>
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
