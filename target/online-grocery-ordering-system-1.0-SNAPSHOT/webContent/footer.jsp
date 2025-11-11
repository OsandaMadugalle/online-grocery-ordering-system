<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer Section</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            padding-top: 60px;
        }

        footer {
            background-color: #004d00;
            color: white;
            padding: 40px 0;
        }

        .contact-info p,
        .quick-links a,
        .services p {
            margin: 5px 0;
            color: white;
        }

        .quick-links a:hover {
            text-decoration: underline;
        }

        .social-media-links a {
            transition: transform 0.3s ease-in-out;
        }

        .social-media-links a:hover {
            transform: scale(1.2);
        }

        .footer-heading {
            font-weight: bold;
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        /* Back to Top Button */
        #backToTop {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 50%;
            padding: 10px 15px;
            display: none;
            z-index: 1000;
        }
    </style>
</head>

<body>

    <!-- Footer Section -->
    <footer>
        <div class="container text-center text-md-left">

            <div class="row">

                <!-- Contact Information -->
                <div class="col-md-4 contact-info mb-4">
                    <h5 class="footer-heading">Contact Us</h5>
                    <p><i class="fas fa-phone-alt"></i> +94 70 123 4567</p>
                    <p><i class="fas fa-envelope"></i> support@gosgroceries.lk</p>
                    <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, Colombo, Sri Lanka</p>
                </div>

                <!-- Quick Links -->
                <div class="col-md-4 quick-links mb-4">
                    <h5 class="footer-heading">Quick Links</h5>
                    <a href="<c:url value='shop.jsp'/>">Shop Now</a><br>
                    <a href="<c:url value='3'/>">About Us</a><br>
                    <a href="<c:url value='contact.jsp'/>">Contact</a><br>
                    <a href="<c:url value='feedback.jsp'/>">FAQs</a><br>
                    <a href="<c:url value='3'/>">Terms & Conditions</a>
                </div>

                <!-- Services Offered -->
                <div class="col-md-4 services mb-4">
                    <h5 class="footer-heading">Our Services</h5>
                    <p><i class="fas fa-truck"></i> Same-Day Delivery</p>
                    <p><i class="fas fa-leaf"></i> Fresh Produce Guaranteed</p>
                    <p><i class="fas fa-credit-card"></i> Secure Payments</p>
                    <p><i class="fas fa-sync-alt"></i> Easy Returns</p>
                </div>
            </div>

            <!-- Social Media Links -->
            <div class="text-center social-media-links mt-3">
                <a href="https://facebook.com" target="_blank" rel="noopener noreferrer" class="mx-2">
                    <i class="fab fa-facebook fa-2x text-white"></i>
                </a>
                <a href="https://twitter.com" target="_blank" rel="noopener noreferrer" class="mx-2">
                    <i class="fab fa-twitter fa-2x text-white"></i>
                </a>
                <a href="https://instagram.com" target="_blank" rel="noopener noreferrer" class="mx-2">
                    <i class="fab fa-instagram fa-2x text-white"></i>
                </a>
                <a href="https://linkedin.com" target="_blank" rel="noopener noreferrer" class="mx-2">
                    <i class="fab fa-linkedin fa-2x text-white"></i>
                </a>
            </div>

            <!-- Footer Bottom -->
            <div class="text-center mt-3">
                <p>&copy; 2025 GOS. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Back to Top Button -->
    <button id="backToTop" title="Go to top">
        <i class="fas fa-arrow-up"></i>
    </button>

    <!-- Back to Top Script -->
    <script>
        const backToTopButton = document.getElementById("backToTop");

        window.onscroll = function () {
            if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
                backToTopButton.style.display = "block";
            } else {
                backToTopButton.style.display = "none";
            }
        };

        backToTopButton.addEventListener("click", function () {
            window.scrollTo({
                top: 0,
                behavior: "smooth"
            });
        });
    </script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
