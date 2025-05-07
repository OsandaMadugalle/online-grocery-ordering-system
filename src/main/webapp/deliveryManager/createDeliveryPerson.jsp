<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Delivery Person</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

     <style>
        :root {
            --primary-dark: #1a1a2e;
            --secondary-dark: #16213e;
            --accent-color: #0f3460;
            --highlight-color: #e94560;
            --text-color: #ffffff;
            --input-bg: rgba(255, 255, 255, 0.08);
            --input-focus: rgba(255, 255, 255, 0.15);
            --error-color: #ff6b6b;
            --success-color: #4e9f3d;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-dark);
            color: var(--text-color);
            min-height: 100vh;
            padding: 2rem;
        }

        .manager-form-container {
            max-width: 700px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            padding: 2.5rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .form-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .form-header h2 {
            font-weight: 600;
            color: var(--highlight-color);
            margin-bottom: 0.5rem;
            font-size: 1.8rem;
        }

        .form-header p {
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.95rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.9);
        }

        .form-control {
            background-color: var(--input-bg);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--text-color);
            padding: 0.75rem 1rem;
            border-radius: 8px;
            width: 100%;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background-color: var(--input-focus);
            border-color: var(--highlight-color);
            box-shadow: 0 0 0 3px rgba(233, 69, 96, 0.2);
            outline: none;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .password-toggle {
            position: absolute;
            right: 12px;
            top: 38px;
            background: transparent;
            border: none;
            color: rgba(255, 255, 255, 0.6);
            cursor: pointer;
            z-index: 10;
        }

        .btn-submit {
            background: var(--highlight-color);
            color: white;
            border: none;
            padding: 0.75rem;
            width: 100%;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1rem;
            margin-top: 1rem;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn-submit:hover {
            background: #d43a5a;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(233, 69, 96, 0.3);
        }

        .error-message {
            color: var(--error-color);
            font-size: 0.85rem;
            margin-top: 0.25rem;
            display: none;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            margin-bottom: 1.5rem;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: var(--highlight-color);
            text-decoration: none;
        }

        .back-link i {
            margin-right: 0.5rem;
        }

        .input-icon {
            position: absolute;
            left: 12px;
            top: 38px;
            color: rgba(255, 255, 255, 0.6);
        }

        .form-control.with-icon {
            padding-left: 2.5rem;
        }

        @media (max-width: 768px) {
            body {
                padding: 1.5rem;
            }
            
            .manager-form-container {
                padding: 1.5rem;
            }
        }

        @media (max-width: 576px) {
            body {
                padding: 1rem;
            }
            
            .manager-form-container {
                padding: 1.25rem;
            }
            
            .form-header h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <a href="../manageDeliveryPersons" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to Delivery Person List
        </a>

        <div class="manager-form-container">
            <div class="form-header">
                <h2><i class="fas fa-user-plus"></i> Create New Delivery Person</h2>
                <p>Fill in the details below to register a new delivery person</p>
            </div>

            <%-- Display error message if present --%>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>

            <form action="../addDeliveryPerson" method="post" onsubmit="return validateForm()">
                
                <!-- Username -->
                <div class="form-group">
                    <label for="username" class="form-label">Username</label>
                    <div class="position-relative">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" class="form-control with-icon" id="username" name="username" placeholder="Enter username" required>
                    </div>
                </div>

                <!-- First Name -->
                <div class="form-group">
                    <label for="firstName" class="form-label">First Name</label>
                    <div class="position-relative">
                        <i class="fas fa-id-card input-icon"></i>
                        <input type="text" class="form-control with-icon" id="firstName" name="firstName" placeholder="Enter first name">
                    </div>
                </div>

                <!-- Last Name -->
                <div class="form-group">
                    <label for="lastName" class="form-label">Last Name</label>
                    <div class="position-relative">
                        <i class="fas fa-id-card input-icon"></i>
                        <input type="text" class="form-control with-icon" id="lastName" name="lastName" placeholder="Enter last name">
                    </div>
                </div>

                <!-- Phone Number -->
                <div class="form-group">
                    <label for="phone" class="form-label">Phone Number</label>
                    <div class="position-relative">
                        <i class="fas fa-phone input-icon"></i>
                        <input type="tel" class="form-control with-icon" id="phone" name="phone" placeholder="Enter phone number">
                    </div>
                </div>

                <!-- Email Address -->
                <div class="form-group">
                    <label for="email" class="form-label">Email Address</label>
                    <div class="position-relative">
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" class="form-control with-icon" id="email" name="email" placeholder="Enter email">
                    </div>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label for="password" class="form-label">Password</label>
                    <div class="position-relative">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control with-icon" id="password" name="password" placeholder="Enter password" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('password', this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <!-- Confirm Password -->
                <div class="form-group">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <div class="position-relative">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" class="form-control with-icon" id="confirmPassword" placeholder="Confirm password" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword', this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="error-message" id="error-message">
                        <i class="fas fa-exclamation-circle"></i> Passwords do not match
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn-submit">
                    <i class="fas fa-user-plus"></i> Create Delivery Person Account
                </button>
            </form>
        </div>
    </div>

    <script>
        function validateForm() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const errorMessage = document.getElementById("error-message");

            if (password !== confirmPassword) {
                errorMessage.style.display = "block";
                document.getElementById("confirmPassword").focus();
                return false;
            }
            errorMessage.style.display = "none";
            return true;
        }

        function togglePassword(fieldId, button) {
            const field = document.getElementById(fieldId);
            const icon = button.querySelector('i');
            
            if (field.type === "password") {
                field.type = "text";
                icon.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                field.type = "password";
                icon.classList.replace('fa-eye-slash', 'fa-eye');
            }
        }
    </script>
</body>
</html>