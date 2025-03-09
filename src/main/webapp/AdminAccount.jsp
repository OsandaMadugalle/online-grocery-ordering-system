<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <c:if test="${not empty adminDetails}">
        <div class="container mt-5">
            <h2 class="text-center">Admin Profile</h2>
            <c:forEach var="ad" items="${adminDetails}">
                <div class="card mt-3">
                    <div class="card-body">
                        <h5 class="card-title">${ad.first_name} ${ad.last_name}</h5>
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
        </div>
    </c:if>
    <c:if test="${empty adminDetails}">
        <div class="alert alert-danger text-center mt-5">No admin details found.</div>
    </c:if>
</body>
</html>
