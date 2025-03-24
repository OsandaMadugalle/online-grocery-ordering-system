<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Retrieve the logout message, if it exists
   	String logoutMessage = (String) session.getAttribute("logoutMessage");
	if (logoutMessage != null && !logoutMessage.isEmpty()) {

%>
    
<%
        // Remove the message from the session so it's not shown again
        session.removeAttribute("logoutMessage");
    }
%>

<!-- Bootstrap CSS (Version 4.3) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" 
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- Custom Styles -->
<style>
    input[type="search"]::placeholder {
        color: gray;
        transition: color 0.3s ease;
    }
    
    input[type="search"]:focus::placeholder {
        color: transparent;
    }

    @media (max-width: 768px) {
        .navbar-brand img {
            height: 30px;
        }
        .navbar-nav {
            flex-direction: column;
        }
    } 
    
    body {
        background-color: white;
    }
    
    .navbar, footer {
        background-color: #004d00;
    }
    
    footer {
        color: white;
    }
    
    .btn, .dropdown-item:hover {
        background-color: #28a745;
        color: white;
    }
    
    .navbar-nav .nav-link {
        font-size: 1.25rem;
    }
    
    .dropdown-item {
        color: white;
    }
    
    .card {
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    }
    
    .card:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }
</style>

<!-- Bootstrap JS (Version 4.3) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>

<header style="position: fixed; top: 0; width: 100%; z-index: 1030;">
    <!-- Top Bar -->
    <div class="d-flex justify-content-end p-2" style="background-color: #013220;">
        <c:if test="${not sessionScope.loggedIn}">
            <a href="./customer/cusLogin.jsp" class="btn btn-outline-primary mx-2">Log In</a>
            <a href="./customer/cusSignup.jsp" class="btn btn-outline-secondary mx-2">Sign Up</a>
        </c:if>

        <c:if test="${sessionScope.loggedIn}">
            <a href="trackOrder.jsp" class="btn btn-outline-info mx-2">Track My Order</a>
            <a href="admin/adminAccount.jsp" class="btn btn-light mx-2">
                <i class="bi bi-person-circle"></i> Profile
            </a>
            <a href="LogoutServlet" class="btn btn-danger">Logout</a>
        </c:if>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark px-5" style="background-color: #004d00; height: 60px;">
        <a class="navbar-brand mx-0" href="#">
            <img src="images/logo.png" alt="Logo" style="height: 40px; width: 100px;">
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto p-2">
                <li class="nav-item active mx-4">
                    <a class="nav-link" href="#">HOME</a>
                </li>
                <li class="nav-item dropdown mx-4">
                    <a class="nav-link dropdown-toggle" href="#" id="catalogDropdown" role="button" data-toggle="dropdown">
                        CATALOG
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="catalogDropdown" style="background-color: #004d00;">
                        <li><a class="dropdown-item" href="#">Electronics</a></li>
                        <li><a class="dropdown-item" href="#">Fashion</a></li>
                        <li><a class="dropdown-item" href="#">Home Appliances</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">More Categories</a></li>
                    </ul>
                </li>
                <li class="nav-item mx-4">
                    <a class="nav-link" href="#">SHOP</a>
                </li>
                <li class="nav-item mx-4">
                    <a class="nav-link" href="#">OFFERS</a>
                </li>
                <li class="nav-item mx-4">
                    <a class="nav-link" href="#">FEEDBACK</a>
                </li>
                <li class="nav-item mx-4">
                    <a class="nav-link" href="#">CONTACT</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-cart4"></i> CART</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Search Bar -->
    <div class="search-bar-container d-flex justify-content-center align-items-center p-3 w-50"
         style="background-color: #004d00; text-align: center; height: 60px; margin: 0 auto; border-bottom-left-radius: 15px; border-bottom-right-radius: 15px;">
        <form class="form-inline d-flex justify-content-center w-100">
            <input id="searchInput" class="form-control me-2" type="search" placeholder="Search..." aria-label="Search"
                style="width: 100%; max-width: 400px;">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</header>

<!-- Animated Placeholder Script -->
<script>
    const placeholderTexts = ["Search products...", "Find your favorite items...", "Explore offers..."];
    const searchInput = document.getElementById("searchInput");
    let placeholderIndex = 0;
    let charIndex = 0;
    let timeout;

    function typePlaceholder() {
        clearTimeout(timeout);
        const currentText = placeholderTexts[placeholderIndex];
        searchInput.setAttribute("placeholder", currentText.substring(0, charIndex));
        charIndex++;

        if (charIndex > currentText.length) {
            setTimeout(() => {
                charIndex = 0;
                placeholderIndex = (placeholderIndex + 1) % placeholderTexts.length;
                typePlaceholder();
            }, 1000);
        } else {
            timeout = setTimeout(typePlaceholder, 100);
        }
    }

    typePlaceholder();
</script>
