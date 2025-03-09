<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }
        .profile-container {
            max-width: 500px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .profile-container img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
        }
        .profile-container h2 {
            margin-bottom: 10px;
        }
        .profile-container p {
            font-size: 16px;
            color: #333;
        }
        .profile-container .info {
            text-align: left;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <c:if test="${not empty adminDetails}">
        <c:forEach var="ad" items="${adminDetails}">
            <div class="profile-container">
                <img src="profile-placeholder.jpg" alt="Admin Profile">
                <h2><c:out value="${ad.first_name}" /> <c:out value="${ad.last_name}" /></h2>
                <div class="info">
                    <p><strong>Admin ID:</strong> <c:out value="${ad.admin_id}" /></p>
                    <p><strong>Username:</strong> <c:out value="${ad.username}" /></p>
                    <p><strong>First Name:</strong> <c:out value="${ad.first_name}" /></p>
        	        <p><strong>Last Name:</strong> <c:out value="${ad.last_name}" /></p>
                    <p><strong>Phone:</strong> <c:out value="${ad.phone}" /></p>
                    <p><strong>Email:</strong> <c:out value="${ad.email}" /></p>
                    <p><strong>Password:</strong> <c:out value="${ad.password}" /></p>
                </div>
            </div>
        </c:forEach>
    </c:if>

    <c:if test="${empty adminDetails}">
        <div class="container text-center mt-5">
            <p class="text-danger">No admin details found.</p>
        </div>
    </c:if>

</body>
</html>
