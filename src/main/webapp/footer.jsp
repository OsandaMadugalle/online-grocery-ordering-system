<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer Section</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
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
<footer class="text-center py-3 mt-5">
    <div class="container">
        <div class="contact-info mb-3">
            <p><i class="fas fa-phone-alt"></i> Phone: +94700000000</p>
            <p><i class="fas fa-map-marker-alt"></i> Address: 123 Main Street, Colombo, Sri Lanka</p>
        </div>
        <div class="social-media-links">
            <a href="https://facebook.com" target="_blank" class="mx-3 text-decoration-none">
                <i class="fab fa-facebook fa-2x text-primary"></i>
            </a>
            <a href="https://twitter.com" target="_blank" class="mx-3 text-decoration-none">
                <i class="fab fa-twitter fa-2x text-info"></i>
            </a>
            <a href="https://instagram.com" target="_blank" class="mx-3 text-decoration-none">
                <i class="fab fa-instagram fa-2x text-danger"></i>
            </a>
            <a href="https://linkedin.com" target="_blank" class="mx-3 text-decoration-none">
                <i class="fab fa-linkedin fa-2x text-primary"></i>
            </a>
        </div>
        <p class="mt-3">&copy; 2025 GOS. All rights reserved.</p>
    </div>
</footer>

<!-- jQuery (Required for Bootstrap's JavaScript) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
