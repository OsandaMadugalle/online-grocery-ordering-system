<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Offers</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --header-height: 160px; /* Must match header.jsp height */
            --primary-green: #004d00;
            --light-green: #e8f5e9;
            --accent-gold: #FFD700;
            --dark-green: #013220;
        }

        body {
            padding-top: var(--header-height);
            background-color: var(--light-green);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
        }

        .offers-container {
            margin-top: 30px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 77, 0, 0.1);
            overflow: hidden;
        }

        .offers-section {
            background-color: var(--primary-green);
            color: white;
            padding: 40px 20px;
            border-radius: 15px 15px 0 0;
        }

        .offers-section h2 {
            color: var(--accent-gold);
            font-weight: 700;
            margin-bottom: 25px;
            position: relative;
            text-align: center;
        }

        .offers-section h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background-color: var(--accent-gold);
        }

        .offer-card {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 3px solid var(--accent-gold);
            transition: transform 0.3s ease;
        }

        .offer-card:hover {
            transform: translateY(-5px);
        }

        .offer-card h5 {
            font-weight: 700;
            color: var(--primary-green);
        }

        .offer-card p {
            font-style: italic;
            margin-bottom: 10px;
        }

        .offer-card .discount {
            color: var(--accent-gold);
            font-weight: bold;
        }

        .offer-card small {
            color: #ddd;
            font-size: 0.85rem;
        }

        .offer-form-section {
            padding: 30px;
            background-color: var(--light-green);
            border-radius: 0 0 15px 15px;
        }

        .offer-form-section h4 {
            color: var(--primary-green);
            font-weight: 700;
            margin-bottom: 25px;
            text-align: center;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ddd;
            padding: 12px 15px;
            margin-bottom: 20px;
        }

        .form-control:focus {
            border-color: var(--primary-green);
            box-shadow: 0 0 0 0.2rem rgba(0, 77, 0, 0.25);
        }

        .btn-primary {
            background-color: var(--primary-green);
            border-color: var(--primary-green);
            padding: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            background-color: var(--dark-green);
            border-color: var(--dark-green);
            transform: translateY(-2px);
        }

        label {
            font-weight: 600;
            color: var(--dark-green);
        }

        @media (max-width: 768px) {
            body {
                padding-top: 200px; /* Adjust if header height changes on mobile */
            }

            .offers-section {
                border-radius: 15px;
                text-align: center;
            }

            .offer-form-section {
                padding: 20px;
                border-radius: 15px;
            }
        }

        /* Ensure content starts below header */
        main {
            margin-top: 20px;
            min-height: calc(100vh - var(--header-height) - 100px);
        }
    </style>
</head>

<body>

    <%@ include file="header.jsp" %>

    <main>
        <div class="container my-5">
            <div class="offers-container">
                <div class="offers-section">
                    <h2>Exclusive Grocery Offers</h2>

                    <!-- Offers Row -->
                    <div class="row">
                        <!-- Offer 1 -->
                        <div class="col-md-6 col-lg-4">
                            <div class="offer-card">
                                <h5>Fresh Produce Discount</h5>
                                <p>"Get 20% off on all fresh vegetables and fruits. Stock up for the week!"</p>
                                <span class="discount">20% Off</span>
                                <small>Valid till: 15th May 2025</small>
                            </div>
                        </div>

                        <!-- Offer 2 -->
                        <div class="col-md-6 col-lg-4">
                            <div class="offer-card">
                                <h5>Bulk Buying Special</h5>
                                <p>"Buy 2 packs of rice, get 1 free. Perfect for stocking up your pantry."</p>
                                <span class="discount">Buy 2 Get 1 Free</span>
                                <small>Valid till: 20th May 2025</small>
                            </div>
                        </div>

                        <!-- Offer 3 -->
                        <div class="col-md-6 col-lg-4">
                            <div class="offer-card">
                                <h5>Discount on Dairy Products</h5>
                                <p>"All dairy products at 15% off. Save more on milk, cheese, and more!"</p>
                                <span class="discount">15% Off</span>
                                <small>Valid till: 30th May 2025</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="offer-form-section">
                    <h4>Subscribe for Exclusive Offers</h4>
                    <form id="offerForm" method="post" action="SubmitOfferSubscriptionServlet">
                        <div class="form-group">
                            <label for="subscriberName">Name</label>
                            <input type="text" class="form-control" id="subscriberName" name="name" placeholder="Your Name" required>
                            <small id="nameError" class="form-text text-danger"></small>
                        </div>

                        <div class="form-group">
                            <label for="subscriberEmail">Email</label>
                            <input type="email" class="form-control" id="subscriberEmail" name="email" placeholder="you@example.com" required>
                            <small id="emailError" class="form-text text-danger"></small>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Subscribe Now</button>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS + dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Form Validation -->
    <script>
        document.getElementById('offerForm').addEventListener('submit', function(e) {
            let valid = true;

            // Clear previous errors
            ['name','email'].forEach(function(field) {
                document.getElementById(field + 'Error').textContent = '';
            });

            // Name validation
            if (!this.name.value.trim()) {
                document.getElementById('nameError').textContent = 'Please enter your name';
                valid = false;
            }

            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(this.email.value.trim())) {
                document.getElementById('emailError').textContent = 'Please enter a valid email';
                valid = false;
            }

            if (!valid) {
                e.preventDefault();
            }
        });
    </script>

    <!-- Dynamic Header Height Adjustment -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const header = document.querySelector('header.fixed-header');
            if (header) {
                // Update CSS variable with actual header height
                document.documentElement.style.setProperty(
                    '--header-height', 
                    header.offsetHeight + 'px'
                );
                
                // Ensure body padding matches header height
                document.body.style.paddingTop = header.offsetHeight + 'px';
            }
        });
    </script>
</body>
</html>
