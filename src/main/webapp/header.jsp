<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Header</title>

    <!-- Bootstrap CSS (Version 4.5.2) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <!-- FontAwesome (Version 5.15.4) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            padding-top: 60px;
        }

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

        .navbar,
        footer {
            background-color: #004d00;
        }

        footer {
            color: white;
        }

        .btn,
        .dropdown-item:hover {
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

        .search-bar-container form {
            width: auto;
            max-width: 100%;
        }
    </style>
</head>

<body>

    <!-- Header Section -->
    <header style="position: fixed; top: 0; width: 100%; z-index: 1030;">
        <!-- Top Bar -->
        <div class="d-flex justify-content-end p-2" style="background-color: #013220;">
            <c:if test="${not sessionScope.loggedIn}">
                <a href="./customer/cusLogin.jsp" class="btn btn-outline-primary mx-2">Log In</a>
                <a href="./customer/cusSignup.jsp" class="btn btn-outline-secondary mx-2">Sign Up</a>
            </c:if>

            <c:if test="${sessionScope.loggedIn}">
                <a href="#" class="btn btn-outline-info mx-2">Track My Order</a>
                <a href="customer/customerAccount.jsp" class="btn btn-light mx-2">
                    <i class="bi bi-person-circle"></i> Profile
                </a>
                <a href="customerLogoutServlet" class="btn btn-danger">Logout</a>
            </c:if>
        </div>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark px-5" style="background-color: #004d00; height: 60px;">
            <a class="navbar-brand mx-0" href="#">
                <img src="images/logo.png" alt="Website Logo" style="height: 40px; width: 100px;">
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto p-2">
                    <li class="nav-item active mx-4">
                        <a class="nav-link" href="index.jsp" aria-current="page">HOME</a>
                    </li>
                    <li class="nav-item dropdown mx-4">
                        <a class="nav-link dropdown-toggle" href="#" id="catalogDropdown" role="button"
                            data-toggle="dropdown">
                            CATALOG
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="catalogDropdown" style="background-color: #004d00;">
                            <li><a class="dropdown-item" href="#">Vegetables</a></li>
                            <li><a class="dropdown-item" href="#">Fruits</a></li>
                            <li><a class="dropdown-item" href="#">Rice</a></li>
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
                        <a class="nav-link" href="feedback.jsp">FEEDBACK</a>
                    </li>
                    <li class="nav-item mx-4">
                        <a class="nav-link" href="contact.jsp">CONTACT</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="customer/cart.jsp"><i class="bi bi-cart4"></i> CART</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Search Bar -->
		<div class="search-bar-container d-flex justify-content-center align-items-center px-3 py-2"
		     style="background-color: #004d00; text-align: center; border-bottom-left-radius: 15px; border-bottom-right-radius: 15px;">
		    <form class="form-inline w-100 d-flex justify-content-center">
		        <input id="searchInput" class="form-control mr-2" type="search" placeholder="Search..." aria-label="Search"
		            style="max-width: 400px; width: 100%;">
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

    <!-- Bootstrap JS (Version 4.5.2) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js" defer></script>
</body>

</html>
