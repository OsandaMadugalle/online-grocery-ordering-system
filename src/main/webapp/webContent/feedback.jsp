<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback</title>
    <link rel="icon" type="image/png" href="../images/fav.png">

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
        
        .feedback-container {
            margin-top: 30px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 77, 0, 0.1);
            overflow: hidden;
        }
        
        .testimonials-section {
            background-color: var(--primary-green);
            color: white;
            padding: 30px;
            height: 100%;
        }
        
        .testimonials-section h2 {
            color: var(--accent-gold);
            font-weight: 700;
            margin-bottom: 25px;
            position: relative;
        }
        
        .testimonials-section h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: var(--accent-gold);
        }
        
        .testimonial-card {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
            border-left: 3px solid var(--accent-gold);
        }
        
        .testimonial-card p {
            font-style: italic;
            margin-bottom: 5px;
        }
        
        .testimonial-card small {
            color: #ddd;
            font-size: 0.85rem;
        }
        
        .feedback-form-section {
            padding: 30px;
        }
        
        .feedback-form-section h4 {
            color: var(--primary-green);
            font-weight: 700;
            margin-bottom: 25px;
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
        
        .rating-stars {
            font-size: 24px;
            color: var(--accent-gold);
            margin-bottom: 20px;
        }
        
        .rating-stars i {
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .rating-stars i:hover {
            transform: scale(1.2);
        }
        
        @media (max-width: 768px) {
            body {
                padding-top: 200px; /* Adjust if header height changes on mobile */
            }
            
            .testimonials-section {
                border-radius: 15px 15px 0 0;
            }
            
            .feedback-form-section {
                border-radius: 0 0 15px 15px;
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
            <div class="feedback-container">
                <div class="row no-gutters">
                    <!-- Left: Testimonials -->
                    <div class="col-lg-6">
                        <div class="testimonials-section">
                            <h2>Customer Testimonials</h2>
                            
                            <div class="testimonial-card">
                                <p>"The quality of products is always excellent and delivery is super fast!"</p>
                                <small>- Riya S.</small>
                            </div>
                            
                            <div class="testimonial-card">
                                <p>"I've been using this service for months and never been disappointed."</p>
                                <small>- Arjun P.</small>
                            </div>
                            
                            <div class="testimonial-card">
                                <p>"Customer support resolved my issue within minutes. Highly recommended!"</p>
                                <small>- Maya D.</small>
                            </div>
                            
                            <div class="testimonial-card">
                                <p>"Fresh produce every time, just like from the local market but more convenient."</p>
                                <small>- Zaid K.</small>
                            </div>
                            
                            <div class="mt-4">
                                <h5>Share Your Experience</h5>
                                <p>We value your feedback. Your reviews help us improve our service.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Right: Feedback Form -->
                    <div class="col-lg-6">
                        <div class="feedback-form-section">
                            <h4>Share Your Feedback</h4>
                            <form id="feedbackForm" method="post" action="SubmitFeedbackServlet">
                                <div class="form-group">
                                    <label for="feedbackName">Name</label>
                                    <input type="text" class="form-control" id="feedbackName" name="name" placeholder="Your Name" required>
                                    <small id="nameError" class="form-text text-danger"></small>
                                </div>

                                <div class="form-group">
                                    <label for="feedbackEmail">Email</label>
                                    <input type="email" class="form-control" id="feedbackEmail" name="email" placeholder="you@example.com" required>
                                    <small id="emailError" class="form-text text-danger"></small>
                                </div>

                                <div class="form-group">
                                    <label>Rating</label>
                                    <div class="rating-stars">
                                        <i class="far fa-star" data-rating="1"></i>
                                        <i class="far fa-star" data-rating="2"></i>
                                        <i class="far fa-star" data-rating="3"></i>
                                        <i class="far fa-star" data-rating="4"></i>
                                        <i class="far fa-star" data-rating="5"></i>
                                        <input type="hidden" name="rating" id="ratingValue" value="0">
                                    </div>
                                    <small id="ratingError" class="form-text text-danger"></small>
                                </div>

                                <div class="form-group">
                                    <label for="feedbackMessage">Your Feedback</label>
                                    <textarea class="form-control" id="feedbackMessage" name="message" rows="5" placeholder="Share your experience with us..." required></textarea>
                                    <small id="messageError" class="form-text text-danger"></small>
                                </div>

                                <button type="submit" class="btn btn-primary btn-block">Submit Feedback</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS + dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Star Rating Script -->
    <script>
        $(document).ready(function() {
            $('.rating-stars i').on('click', function() {
                const rating = $(this).data('rating');
                $('#ratingValue').val(rating);
                
                // Update star display
                $('.rating-stars i').each(function(index) {
                    if (index < rating) {
                        $(this).removeClass('far').addClass('fas');
                    } else {
                        $(this).removeClass('fas').addClass('far');
                    }
                });
            });
        });
    </script>

    <!-- Form Validation -->
    <script>
        document.getElementById('feedbackForm').addEventListener('submit', function(e) {
            let valid = true;
            
            // Clear previous errors
            ['name','email','rating','message'].forEach(function(field) {
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

            // Rating validation
            if (this.rating.value === '0') {
                document.getElementById('ratingError').textContent = 'Please select a rating';
                valid = false;
            }

            // Message validation
            if (this.message.value.trim().length < 10) {
                document.getElementById('messageError').textContent = 'Feedback must be at least 10 characters';
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