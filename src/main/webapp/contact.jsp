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
        body {
            padding-top: 160px;
        }
    </style>
</head>

<body>

    <%@ include file="header.jsp" %>

    <main>
        <div class="container my-5">
            <div class="row">
                <!-- Left: Contact Info -->
                <div class="col-md-6 mb-4">
                    <h2 class="text-primary">Get in Touch</h2>
                    <p><i class="fas fa-phone-alt"></i> +94 70 123 4567</p>
                    <p><i class="fas fa-envelope"></i> support@gosgroceries.lk</p>
                    <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, Colombo, Sri Lanka</p>
                </div>

                <!-- Right: Contact Form -->
                <div class="col-md-6">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h4 class="card-title mb-4">Send Us a Message</h4>
                            <form id="contactForm"
                                  method="post"
                                  action="SubmitContactServlet">

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
            var searchBar = document.querySelector('.search-bar'); // Adjust if your search bar class is different
            var headerHeight = header ? header.offsetHeight : 0;
            var searchHeight = searchBar ? searchBar.offsetHeight : 0;
            var totalHeight = headerHeight + searchHeight + 20; // some margin

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
