<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Manager Log In</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --primary-color: #1f1f3a;
            --accent-color: #ff6f61;
            --highlight-color: #fcd34d;
            --text-color: #ffffff;
        }

        body {
            background-color: var(--primary-color);
            font-family: 'Poppins', sans-serif;
            display: flex;
            height: 100vh;
            color: var(--text-color);
        }

        .form-container {
            flex: 1; 
            background-color: rgba(255, 255, 255, 0.08);
            box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
            padding: 50px 35px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            animation: fadeIn 0.5s ease-in-out;
            position: relative;
        }

        .form-container h3 {
            font-size: 32px;
            font-weight: 500;
            text-align: center;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.07);
            color: white;
            border: none;
        }

        .form-control::placeholder {
            color: #e5e5e5;
        }

        .btn-custom {
            background-color: var(--accent-color);
            color: white;
            font-weight: 600;
        }

        .btn-custom:hover {
            background-color: #e05a4f;
        }

        .btn-signup {
            margin-top: 10px;
            background-color: transparent;
            color: white;
            border: 2px solid white;
        }

        .btn-signup:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .role-buttons {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .role-buttons .btn {
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 500;
            border: 2px solid white;
            color: white;
            background-color: transparent;
            transition: background-color 0.3s ease;
        }

        .role-buttons .btn.active {
            background-color: white;
            color: #080710;
        }

        .delivery-manager-btn {
            border-color: var(--accent-color);
            color: var(--accent-color);
        }

        .delivery-manager-btn:hover {
            background-color: rgba(255, 111, 97, 0.2);
        }

        .delivery-manager-btn.active {
            background-color: var(--accent-color);
            color: white;
        }

        .left-side {
            flex: 1;
            background-color: #292b4d;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
            position: relative;
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

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>

<body>
    <div class="left-side">   
        <a href="../webContent/index.jsp" class="home-icon">
            <i class="fas fa-home"></i>
        </a>     
        <div>
            <h1>Welcome, Delivery Manager!</h1>
            <p>Log in to continue managing deliveries.</p>
        </div>
    </div>

    <div class="form-container">
        <div class="role-buttons">
            <a href="../customer/cusLogin.jsp" class="btn">Customer</a>
            <a href="../admin/adminLogin.jsp" class="btn">Admin</a>
            <a href="../inventoryManager/inventoryManagerLogin.jsp" class="btn">Inventory Manager</a>
            <a href="./delLogin.jsp" class="btn delivery-manager-btn active">Delivery Manager</a>
        </div>

        <form action="../deliveryManagerLoginServlet" method="post">
            <div class="d-flex align-items-center mb-4">
                <hr class="flex-grow-1 me-3" style="border: 1px solid white; margin: 0 10px;">
                <h2 class="text-center mb-0"><b>Log In</b></h2>
                <hr class="flex-grow-1 ms-3" style="border: 1px solid white; margin: 0 10px;">
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="username" placeholder="Username" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>

            <div class="mt-5">
                <button type="submit" class="btn btn-custom btn-block">Log In</button>
            </div>
        </form>
    </div>  
</body>
</html>
