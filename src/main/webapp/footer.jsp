<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer Section</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
	    body {
		    padding-top: 60px;
		}
	    
        footer {
            background-color: #004d00;
            color: white;
            padding: 20px 0;
        }

        .contact-info p {
            margin: 5px 0;
        }

        .social-media-links a {
            transition: transform 0.3s ease-in-out;
        }

        .social-media-links a:hover {
            transform: scale(1.2);
        }
    </style>
</head>

<body>

    <!-- Footer Section -->
    <footer class="text-center py-3">
        <div class="container">

            <!-- Contact Information -->
            <div class="contact-info mb-3">
                <p><i class="fas fa-phone-alt"></i> Phone: +94701234567</p>
                <p><i class="fas fa-map-marker-alt"></i> Address: Colombo, Sri Lanka</p>
            </div>

            <!-- Social Media Links -->
            <div class="social-media-links">
                <a href="https://facebook.com" target="_blank" class="mx-3">
                    <i class="fab fa-facebook fa-2x text-primary"></i>
                </a>
                <a href="https://twitter.com" target="_blank" class="mx-3">
                    <i class="fab fa-twitter fa-2x text-info"></i>
                </a>
                <a href="https://instagram.com" target="_blank" class="mx-3">
                    <i class="fab fa-instagram fa-2x text-danger"></i>
                </a>
                <a href="https://linkedin.com" target="_blank" class="mx-3">
                    <i class="fab fa-linkedin fa-2x text-primary"></i>
                </a>
            </div>

            <!-- Footer Copyright -->
            <p class="mt-3">&copy; 2025 GOS. All rights reserved.</p>
        </div>
    </footer>
</body>

</html>