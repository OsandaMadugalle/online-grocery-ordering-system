<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --primary-green: #004d00;
            --light-green: #e8f5e9;
            --accent-gold: #FFD700;
            --dark-green: #013220;
        }
        
        body {
            padding-top: 160px;
            background-color: var(--light-green);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .contact-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 77, 0, 0.1);
            overflow: hidden;
        }
        
        .contact-info-section {
            background-color: var(--primary-green);
            color: white;
            padding: 30px;
            height: 100%;
        }
        
        .contact-info-section h2 {
            color: var(--accent-gold);
            font-weight: 700;
            margin-bottom: 25px;
            position: relative;
        }
        
        .contact-info-section h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: var(--accent-gold);
        }
        
        .contact-info-section p {
            margin-bottom: 20px;
            font-size: 1.1rem;
        }
        
        .contact-info-section i {
            color: var(--accent-gold);
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .contact-form-section {
            padding: 30px;
        }
        
        .contact-form-section h4 {
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
        
        @media (max-width: 768px) {
            body {
                padding-top: 200px;
            }
            
            .contact-info-section {
                border-radius: 15px 15px 0 0;
            }
            
            .contact-form-section {
                border-radius: 0 0 15px 15px;
            }
        }
    </style>
</head>

<body>

    <%@ include file="header.jsp" %>

    <main>
        <div class="container my-5">
            <div class="contact-container">
                <div class="row no-gutters">
                    <!-- Left: Contact Info -->
                    <div class="col-lg-6">
                        <div class="contact-info-section">
                            <h2>Get in Touch</h2>
                            <p><i class="fas fa-phone-alt"></i> +94 70 123 4567</p>
                            <p><i class="fas fa-envelope"></i> support@gosgroceries.lk</p>
                            <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, Colombo, Sri Lanka</p>
                            <p><i class="fas fa-clock"></i> Open Daily: 8:00 AM - 10:00 PM</p>
                            
                            <div class="mt-5">
                                <h5 class="mb-3">Follow Us</h5>
                                <a href="#" class="text-white mr-3"><i class="fab fa-facebook-f fa-2x"></i></a>
                                <a href="#" class="text-white mr-3"><i class="fab fa-twitter fa-2x"></i></a>
                                <a href="#" class="text-white mr-3"><i class="fab fa-instagram fa-2x"></i></a>
                                <a href="#" class="text-white"><i class="fab fa-whatsapp fa-2x"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Right: Contact Form -->
                    <div class="col-lg-6">
                        <div class="contact-form-section">
                            <h4>Send Us a Message</h4>
                            <form id="contactForm" method="post" action="SubmitContactServlet">
                                <div class="form-group">
                                    <label for="contactName">Name</label>
                                    <input type="text" class="form-control" id="contactName" name="name" placeholder="Your Name" required>
                                    <small id="nameError" class="form-text text-danger"></small>
                                </div>

                                <div class="form-group">
                                    <label for="contactEmail">Email</label>
                                    <input type="email" class="form-control" id="contactEmail" name="email" placeholder="you@example.com" required>
                                    <small id="emailError" class="form-text text-danger"></small>
                                </div>

                                <div class="form-group">
                                    <label for="contactSubject">Subject</label>
                                    <input type="text" class="form-control" id="contactSubject" name="subject" placeholder="Subject" required>
                                    <small id="subjectError" class="form-text text-danger"></small>
                                </div>

                                <div class="form-group">
                                    <label for="contactMessage">Message</label>
                                    <textarea class="form-control" id="contactMessage" name="message" rows="5" placeholder="How can we help?" required></textarea>
                                    <small id="messageError" class="form-text text-danger"></small>
                                </div>

                                <button type="submit" class="btn btn-primary btn-block">Send Message</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS + dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

    <!-- Dynamic Top Padding Fix Script -->
    <script>
        window.addEventListener('DOMContentLoaded', function() {
            var header = document.querySelector('header');
            var searchBar = document.querySelector('.search-bar');
            var headerHeight = header ? header.offsetHeight : 0;
            var searchHeight = searchBar ? searchBar.offsetHeight : 0;
            var totalHeight = headerHeight + searchHeight + 20;

            document.body.style.paddingTop = totalHeight + 'px';
        });
    </script>

    <!-- Contact Form Validation -->
    <script>
        document.getElementById('contactForm').addEventListener('submit', function(e) {
            ['name','email','subject','message'].forEach(function(field) {
                document.getElementById(field + 'Error').textContent = '';
            });

            let valid = true;
            const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const f  = this;

            if (!f.name.value.trim()) {
                document.getElementById('nameError').textContent = 'Name is required.';
                valid = false;
            }
            if (!re.test(f.email.value.trim())) {
                document.getElementById('emailError').textContent = 'Valid email is required.';
                valid = false;
            }
            if (!f.subject.value.trim()) {
                document.getElementById('subjectError').textContent = 'Subject is required.';
                valid = false;
            }
            if (f.message.value.trim().length < 10) {
                document.getElementById('messageError').textContent = 'Minimum 10 characters.';
                valid = false;
            }
            if (!valid) e.preventDefault();
        });
    </script>

</body>
</html>