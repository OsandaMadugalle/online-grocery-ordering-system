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
    	html, body {
		    height: 100%;
		    margin: 0;
		    padding: 0;
		}   
		.container {
		    margin-bottom: 0;
		    padding-bottom: 0;
		}
				 
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
       <div class="container-fluid mt-4" style="width: 25%; height:100vh;">

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
				    <h2>Admin Dashboard</h2>                    
				    <a href="LogoutServlet" class="btn btn-danger" style="position: absolute; top: 10px; right: 10px; margin-top:10px; margin-right:40px;">Logout</a>
				</div>

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
				                    <tr>
				                        <td colspan="2" class="text-center">
				                            <a href="editProfile.jsp" class="btn btn-primary btn-sm">Edit Profile</a>
				                        </td>
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
