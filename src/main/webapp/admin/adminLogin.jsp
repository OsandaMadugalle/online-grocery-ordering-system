<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        body {
            background: linear-gradient(135deg, #1b1b2f, #162447);
            font-family: 'Poppins', sans-serif;
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            width: 350px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            animation: fadeIn 0.5s ease-in-out;
        }

        .login-container h3 {
            color: white;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: none;
            padding: 12px;
        }

        .form-control::placeholder {
            color: #e0e0e0;
        }

        .btn-custom {
            background: #ff4c29;
            color: white;
            font-size: 18px;
            font-weight: 600;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background: #e03e1a;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .home-icon {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 28px;
            color: white;
            text-decoration: none;
        }

        .home-icon:hover {
            color: #ddd;
        }
    </style>
</head>

<body>

    <a href="index.jsp" class="home-icon">
        <i class="fas fa-home"></i>
    </a>

    <div class="login-container">
        <h3>Admin Login</h3>
        <form action="../adminLoginServlet" method="post">
            <div class="form-group">
                <input type="text" class="form-control" name="username" placeholder="Admin Username" required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-custom">Login</button>
        </form>
    </div>

</body>
</html>
