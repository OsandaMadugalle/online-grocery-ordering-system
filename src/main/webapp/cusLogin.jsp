<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Log In</title>
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    
    <style>
        body {
            background-color: #013220;
            font-family: 'Poppins', sans-serif;
            display: flex;
            height: 100vh;
        }

        .left-side {
            flex: 1; 
            background-color: #006700;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 24px;
            text-align: center;
            padding: 20px;
        }

        .form-container {
            flex: 1;
            background-color: rgba(255, 255, 255, 0.13);
            box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
            padding: 50px 35px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            animation: fadeIn 0.5s ease-in-out;
        }

        .form-container h3 {
            font-size: 32px;
            font-weight: 500;
            line-height: 42px;
            text-align: center;
            color: white;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.07);
            color: white;
        }

        .form-control::placeholder {
            color: #e5e5e5;
        }

        .btn-custom {
            background-color: white;
            color: #080710;
            font-size: 18px;
            font-weight: 600;
        }

        .btn-custom:hover {
            background-color: grey; 
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

        .error-message {
            color: red;
            font-size: 12px;
            display: none;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        .left-side {
		    position: relative; /* Ensures absolute positioning works inside */
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

        .role-buttons .btn:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
    </style>

</head>

<body>

    <div class="left-side">
    
	    <a href="./index.jsp" class="home-icon">
	        <i class="fas fa-home"></i>
	    </a>
    
    	<div>
            <h1>Welcome Back!</h1>
            <p>Log in to continue your shopping.</p>
        </div>
    </div>

    <div class="form-container">
    	
    	<div class="role-buttons">
			 <a href="./cusLogin.jsp" class="btn">Customer</a>
			    <a href="./staffLogin.jsp" class="btn">Staff</a>
			</div>
    
        <form action="LoginServlet" method="post">
			

        <div class="d-flex align-items-center mb-4" style="margin-top: 20px; margin-bottom: 20px;">
		        <hr class="flex-grow-1 me-3" style="border: 1px solid white; margin: 0 10px;">
		        <h2 class="text-center mb-0" style="color: white;"><b>Log In</b></h2>
		        <hr class="flex-grow-1 ms-3" style="border: 1px solid white; margin: 0 10px;">
		    </div>   
            
            <div class="form-group">
                <label class="text-white">Username</label>
                <input type="text" class="form-control" name="username" placeholder="Username" id="username" required>
            </div>

            <div class="form-group">
                <label class="text-white">Password</label>
                <input type="password" class="form-control" name="password" placeholder="Password" id="password" required>
            </div>

            <div class="mt-5">
                <button type="submit" class="btn btn-custom btn-block" >Log In</button>
            </div>

            <div class="mt-2">
                <a href="./cusSignup.jsp" class="btn btn-signup btn-block text-center d-block">Sign Up</a>
            </div>

        </form>
    </div>
    
</body>
</html>