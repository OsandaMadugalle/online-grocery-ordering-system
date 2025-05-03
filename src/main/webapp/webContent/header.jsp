<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --header-height: 160px; /* Total height of fixed header */
        }

        body {
            padding-top: var(--header-height); /* Prevents content hiding behind header */
        }

        .fixed-header {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1030;
            height: var(--header-height);
            background-color: #004d00;
        }

        /* Top Bar */
        .top-bar {
            background-color: #013220;
            padding: 0.5rem 1rem;
        }

        /* Navbar */
        .navbar {
            padding: 0.5rem 1rem;
            background-color: #004d00 !important;
        }

        /* Search Bar - Now integrated into navbar */
        .navbar .search-form {
            flex-grow: 1;
            max-width: 500px;
            margin: 0 auto;
            padding: 0.5rem 0;
        }

        .navbar .search-input {
            width: 100%;
            max-width: 400px;
        }

        /* Dropdown hover */
        .dropdown:hover > .dropdown-menu {
            display: block;
            margin-top: 0;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .navbar-brand img {
                height: 30px;
            }

            .navbar-nav {
                flex-direction: column;
            }

            .navbar .search-form {
                order: 3;
                width: 100%;
                padding: 0.5rem 1rem;
            }
        }
    </style>
</head>

<body>
    <!-- Header Section -->
    <header class="fixed-header">
        <!-- Top Bar -->
        <div class="d-flex justify-content-end top-bar">
            <c:choose>
                <c:when test="${sessionScope.loggedIn == true}">
                    <a href="#" class="btn btn-outline-info mx-2">Track My Order</a>
                    <a href="customer/customerAccount.jsp" class="btn btn-light mx-2">
                        <i class="bi bi-person-circle"></i> Profile
                    </a>
                    <a href="customerLogoutServlet" class="btn btn-danger">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="../customer/cusLogin.jsp" class="btn btn-outline-primary mx-2">Log In</a>
                    <a href="../customer/cusSignup.jsp" class="btn btn-outline-secondary mx-2">Sign Up</a>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Navbar with integrated search -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">
                    <img src="../images/logo.png" alt="Website Logo" style="height: 40px;">
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item mx-2">
                            <a class="nav-link" href="index.jsp">HOME</a>
                        </li>
                        <li class="nav-item dropdown mx-2">
                            <a class="nav-link dropdown-toggle" href="shop.jsp" id="catalogDropdown">CATALOG</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="vegitables.jsp">Vegetables</a>
                                <a class="dropdown-item" href="fruits.jsp">Fruits</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="shop.jsp">More Categories</a>
                            </div>
                        </li>
                        <li class="nav-item mx-2">
                            <a class="nav-link" href="shop.jsp">SHOP</a>
                        </li>
                        <li class="nav-item mx-2">
                            <a class="nav-link" href="offers.jsp">OFFERS</a>
                        </li>
                        <li class="nav-item mx-2">
                            <a class="nav-link" href="feedback.jsp">FEEDBACK</a>
                        </li>
                        <li class="nav-item mx-2">
                            <a class="nav-link" href="contact.jsp">CONTACT</a>
                        </li>
                    </ul>

                    <!-- Integrated Search Form -->
                    <form class="form-inline search-form" action="searchServlet" method="get">
                        <div class="input-group w-100">
                            <input id="searchInput" class="form-control search-input" type="search" 
                                   placeholder="Search products..." aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-outline-light" type="submit">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <ul class="navbar-nav ml-2">
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp">
                                <i class="bi bi-cart4"></i> CART
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <!-- Animated Placeholder Script -->
    <script>
        const placeholderTexts = ["Search products...", "Find your favorite items...", "Explore offers..."];
        const searchInput = document.getElementById("searchInput");
        let placeholderIndex = 0;
        let charIndex = 0;
        let isDeleting = false;
        let timeout;

        function typePlaceholder() {
            clearTimeout(timeout);
            const currentText = placeholderTexts[placeholderIndex];
            if (isDeleting) {
                searchInput.setAttribute("placeholder", currentText.substring(0, charIndex--));
            } else {
                searchInput.setAttribute("placeholder", currentText.substring(0, charIndex++));
            }

            if (!isDeleting && charIndex > currentText.length) {
                isDeleting = true;
                timeout = setTimeout(typePlaceholder, 1000);
            } else if (isDeleting && charIndex === 0) {
                isDeleting = false;
                placeholderIndex = (placeholderIndex + 1) % placeholderTexts.length;
                timeout = setTimeout(typePlaceholder, 300);
            } else {
                timeout = setTimeout(typePlaceholder, isDeleting ? 50 : 100);
            }
        }

        typePlaceholder();
    </script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>