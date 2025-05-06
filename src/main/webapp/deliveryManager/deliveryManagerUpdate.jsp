<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Update My Profile</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --primary-bg: #1e1e2f;
            --secondary-bg: #2b2b3c;
            --accent-color: #ff9f1c;
            --accent-hover: #e57c04;
            --text-color: #ffffff;
            --placeholder-color: #bfbfbf;
            --error-color: #ff4b5c;
            --form-bg: rgba(255, 255, 255, 0.08);
            --border-radius: 10px;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom right, var(--primary-bg), var(--secondary-bg));
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .form-container {
            background: var(--form-bg);
            backdrop-filter: blur(12px);
            padding: 40px;
            max-width: 800px;
            width: 100%;
            border-radius: var(--border-radius);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: fadeIn 0.6s ease-out, float 6s ease-in-out infinite;
        }

        .form-container h3 {
            text-align: center;
            color: var(--accent-color);
            font-weight: 600;
            margin-bottom: 30px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
            align-items: center;
        }

        .form-label {
            flex: 0 0 180px;
            text-align: right;
            padding-right: 20px;
            color: var(--accent-color);
            font-weight: 500;
        }

        .form-input {
            flex: 1;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 12px 20px;
            border-radius: var(--border-radius);
            width: 100%;
            color: var(--text-color);
        }

        .form-control::placeholder {
            color: var(--placeholder-color);
        }

        .form-control[readonly] {
            background-color: rgba(128, 128, 128, 0.2);
            color: #ccc;
        }

        .btn-submit {
            background: var(--accent-color);
            color: #1e1e1e;
            font-weight: 600;
            padding: 14px;
            width: 100%;
            border: none;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
            margin-top: 25px;
        }

        .btn-submit:hover {
            background: var(--accent-hover);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 159, 28, 0.3);
        }

        .error-message {
            color: var(--error-color);
            font-size: 0.85rem;
            margin-top: 8px;
            display: none;
        }

        .password-wrapper {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--placeholder-color);
            cursor: pointer;
        }

        .home-icon {
            position: fixed;
            top: 25px;
            left: 25px;
            color: white;
            background: rgba(255, 159, 28, 0.2);
            padding: 10px 15px;
            border-radius: var(--border-radius);
            text-decoration: none;
        }

        .home-icon:hover {
            background: rgba(255, 159, 28, 0.3);
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                align-items: flex-start;
            }

            .form-label {
                text-align: left;
                width: 100%;
                margin-bottom: 5px;
            }

            .form-input {
                width: 100%;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
    </style>
</head>

<body>
<%
    String id = request.getParameter("id");
    String username = request.getParameter("username");
    String fName = request.getParameter("fName");
    String lName = request.getParameter("lName");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
%>

<a href="${pageContext.request.contextPath}/deliveryManager/deliveryManagerDashboard.jsp" class="home-icon">
    <i class="fas fa-arrow-left"></i>
</a>

<div class="form-container">
    <h3><i class="fas fa-user-edit mr-2"></i>Update Delivery Manager Profile</h3>

    <form action="../updateDeliveryManager" method="post" onsubmit="return validateForm()">
        <div class="form-row">
            <label class="form-label" for="m_id"><i class="fas fa-id-card mr-2"></i>Manager ID</label>
            <div class="form-input">
                <input type="text" class="form-control" name="m_id" id="m_id" value="<%= id %>" readonly>
            </div>
        </div>

        <div class="form-row">
            <label class="form-label" for="username"><i class="fas fa-user mr-2"></i>Username</label>
            <div class="form-input">
                <input type="text" class="form-control" name="username" id="username" value="<%= username %>" required>
            </div>
        </div>

        <div class="form-row">
            <label class="form-label" for="firstName"><i class="fas fa-signature mr-2"></i>First Name</label>
            <div class="form-input">
                <input type="text" class="form-control" name="firstName" id="firstName" value="<%= fName %>" required>
            </div>
        </div>

        <div class="form-row">
            <label class="form-label" for="lastName"><i class="fas fa-signature mr-2"></i>Last Name</label>
            <div class="form-input">
                <input type="text" class="form-control" name="lastName" id="lastName" value="<%= lName %>" required>
            </div>
        </div>

        <div class="form-row">
            <label class="form-label" for="phone"><i class="fas fa-phone mr-2"></i>Phone</label>
            <div class="form-input">
                <input type="tel" class="form-control" name="phone" id="phone" value="<%= phone %>" required>
            </div>
        </div>

        <div class="form-row">
            <label class="form-label" for="email"><i class="fas fa-envelope mr-2"></i>Email</label>
            <div class="form-input">
                <input type="email" class="form-control" name="email" id="email" value="<%= email %>" required>
            </div>
        </div>

        <div class="form-row">
            <label class="form-label" for="password"><i class="fas fa-lock mr-2"></i>Password</label>
            <div class="form-input">
                <div class="password-wrapper">
                    <input type="password" class="form-control" name="password" id="password" value="<%= password %>" required>
                    <button type="button" class="password-toggle" onclick="togglePassword('password', this)">
                        <i class="fas fa-eye"></i>
                    </button>
                </div>
            </div>
        </div>

        <div class="form-row">
            <label class="form-label" for="confirmPassword"><i class="fas fa-check-circle mr-2"></i>Confirm Password</label>
            <div class="form-input">
                <div class="password-wrapper">
                    <input type="password" class="form-control" id="confirmPassword" value="<%= password %>" required>
                    <button type="button" class="password-toggle" onclick="togglePassword('confirmPassword', this)">
                        <i class="fas fa-eye"></i>
                    </button>
                </div>
                <div class="error-message" id="error-message">
                    <i class="fas fa-exclamation-circle mr-1"></i>Passwords do not match
                </div>
            </div>
        </div>

        <button type="submit" class="btn-submit">
            <i class="fas fa-save mr-2"></i>Update Profile
        </button>
    </form>
</div>

<script>
    function validateForm() {
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmPassword").value;
        const errorMessage = document.getElementById("error-message");

        if (password !== confirmPassword) {
            errorMessage.style.display = "block";
            return false;
        }
        errorMessage.style.display = "none";
        return true;
    }

    function togglePassword(id, btn) {
        const field = document.getElementById(id);
        const icon = btn.querySelector("i");
        if (field.type === "password") {
            field.type = "text";
            icon.classList.replace("fa-eye", "fa-eye-slash");
        } else {
            field.type = "password";
            icon.classList.replace("fa-eye-slash", "fa-eye");
        }
    }

    document.getElementById('confirmPassword').addEventListener('input', () => {
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmPassword").value;
        const errorMessage = document.getElementById("error-message");

        if (password !== confirmPassword) {
            errorMessage.style.display = "block";
        } else {
            errorMessage.style.display = "none";
        }
    });
</script>
</body>
