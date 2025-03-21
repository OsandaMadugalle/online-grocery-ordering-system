<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    
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

        .form-container {
            flex: 1;
            background-color: rgba(255, 255, 255, 0.13);
            box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
            padding: 50px 35px;
            display: flex;
            flex-direction: column;
            justify-content: center;
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

        .right-side {
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
        
        .form-container-side {
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

    </style>

</head>

<body>

    <div class="form-container">
    
    <a href="index.jsp" class="home-icon">
        <i class="fas fa-home"></i>
    </a>
    
        <form action="signupServlet" method="post" onsubmit="return validateForm()">
            <div class="d-flex align-items-center mb-4" style="margin-top: 20px; margin-bottom: 20px;">
		        <hr class="flex-grow-1 me-3" style="border: 1px solid white; margin: 0 10px;">
		        <h2 class="text-center mb-0" style="color: white;"><b>Sign Up</b></h2>
		        <hr class="flex-grow-1 ms-3" style="border: 1px solid white; margin: 0 10px;">
		    </div>

            <div class="form-group row">
                <label for="username" class="col-sm-4 col-form-label text-white">Username</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Username" id="username" name="username" required>
                </div>
            </div>

            <div class="form-group row">
                <label for="firstName" class="col-sm-4 col-form-label text-white">First Name</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="First Name" id="firstName" name="firstName" required>
                </div>
            </div>

            <div class="form-group row">
                <label for="lastName" class="col-sm-4 col-form-label text-white">Last Name</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Last Name" id="lastName" name="lastName" required>
                </div>
            </div>

            <div class="form-group row">
                <label for="phone" class="col-sm-4 col-form-label text-white">Phone</label>
                <div class="col-sm-8">
                    <input type="tel" class="form-control" placeholder="Phone" id="phone" name="phone" required>
                </div>
            </div>

            <div class="form-group row">
                <label for="email" class="col-sm-4 col-form-label text-white">Email</label>
                <div class="col-sm-8">
                    <input type="email" class="form-control" placeholder="Email" id="email" name="email" required>
                </div>
            </div>

            <div class="form-group row">
			    <label for="password" class="col-sm-4 col-form-label text-white">Password</label>
			    <div class="col-sm-8 d-flex align-items-center">
			        <input type="password" class="form-control" placeholder="Password" id="password" name="password" required onkeyup="validatePasswords()">
			    </div>
			</div>
			
			<div class="form-group row">
			    <label for="retypePassword" class="col-sm-4 col-form-label text-white">Re-type Password</label>
			    <div class="col-sm-8 d-flex align-items-center">
			        <input type="password" class="form-control" placeholder="Re-type Password" id="retypePassword" name="retypePassword" required onkeyup="validatePasswords()">
			        <span id="icon" style="display: none; font-size: 20px; margin-left: 10px;"></span>
			    </div>
			</div>
			
			<script>
			function validatePasswords() {
			    let password = document.getElementById("password").value;
			    let retypePassword = document.getElementById("retypePassword").value;
			    let icon = document.getElementById("icon");
			
			    if (password !== "" && retypePassword !== "") {
			        if (password === retypePassword) {
			            icon.style.display = "inline"; 
			            icon.style.color = "green";
			            icon.innerHTML = "✔️";  // Show tick icon
			        } else {
			            icon.style.display = "inline"; 
			            icon.style.color = "red";
			            icon.innerHTML = "❌";  // Show cross icon
			        }
			    } else {
			        icon.style.display = "none";  // Hide icon if fields are empty
			    }
			}
			</script>



            <!-- Added space before buttons -->
            <div class="mt-5">
                <button type="submit" class="btn btn-custom btn-block">Sign Up</button>
            </div>

            <div class="mt-2">
                <a href="./cusLogin.jsp" class="btn btn-signup btn-block text-center d-block">Log In</a>
            </div>

        </form>
    </div>

    <div class="right-side">
        <div>
            <h1>Join Us Today!</h1>
            <p>Create an account to explore our store!</p>
        </div>
    </div>

    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var retypePassword = document.getElementById("retypePassword").value;

            if (password !== retypePassword) {
                alert("Passwords do not match!");
                return false;
            }

            if (password.length < 6) {
                alert("Password must be at least 6 characters long!");
                return false;
            }

            return true;
        }
    </script>

</body>
</html>
