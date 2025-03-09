<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Home</title>
	    
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" 
	    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	    
	    <!-- Bootstrap Icons -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
	
		<!-- cart icon -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
		
		<!-- Carousel -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
		
		
	    <style>
	    
		    input[type="search"]::placeholder {
		        color: gray;
		        transition: color 0.3s ease;
		    }
		    
		    input[type="search"]:focus::placeholder {
		        color: transparent;
		    }
	    
		    @media (max-width: 768px) {
		        .navbar-brand img {
		            height: 30px;
		        }
		        .navbar-nav {
		            flex-direction: column; /* Stack nav items vertically */
		        }
		    } 
		       
		    body {
		        background-color: white; /* Change background color to white */
		    }
		    
		    .navbar, footer {
		        background-color: #004d00; /* Dark green color for header and footer */
		    }
		    
		    footer {
		        color: white; /* Footer text color */
		    }
		    
		    .btn, .dropdown-item:hover {
		        background-color: #28a745; /* Change button background on hover */
		        color: white; /* Change text color on hover */
		    }
		    
		    /* Add this to increase navbar font size */
		    .navbar-nav .nav-link {
		        font-size: 1.25rem; /* Adjust font size (e.g., 1.25rem for larger text) */
		    }
		    
		     .dropdown-item{
		     	color: white;
		     }
		     
		    .carousel-item.active img {
		        animation: zoomIn 1.5s ease-in-out;
		    }	
		    
		    .card {
			    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
			}
			
			.card:hover {
			    transform: scale(1.05);
			    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
			}
		    
		    
		</style>
	    
	</head>
	<body>
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	
		<header style="position: fixed; top: 0; width: 100%; z-index: 1030;">
		
		    <!-- Top Bar with Sign In, Sign Up, and Track My Order -->
		    <div class="d-flex justify-content-end p-2" style="background-color: #013220;">
		        <a href="./trackOrder.jsp" class="btn btn-outline-info mx-2">Track My Order</a>
		        <a href="./login.jsp" class="btn btn-outline-primary mx-2">Log In</a>
		        <a href="./signup.jsp" class="btn btn-outline-secondary mx-2">Sign Up</a>
		    </div>
		
		    <!-- Navbar -->
		    <nav class="navbar navbar-expand-lg navbar-dark px-5" style="text-align: center; height:60px;">
		    
		        <!-- Brand Logo -->
		        <a class="navbar-brand mx-0" href="#">
		            <img src="img/logo.png" alt="Logo" style="height: 40px; width:100px; position: left;"> <!-- Replace 'your-logo.png' with your logo path -->
		        </a>
		        
		        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
		            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		            <span class="navbar-toggler-icon"></span>
		        </button>
		
		        <div class="collapse navbar-collapse" id="navbarSupportedContent">
		            <!-- Centered Navigation Links -->
		            <ul class="navbar-nav mx-auto p-2">
		                <li class="nav-item active mx-4">
		                    <a class="nav-link" href="#">HOME <span class="sr-only">(current)</span></a>
		                </li>
		                <li class="nav-item dropdown mx-4">
						    <a class="nav-link dropdown-toggle" href="#" id="catalogDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						        CATALOG
						    </a>
						    <ul class="dropdown-menu" aria-labelledby="catalogDropdown" style="background-color: #004d00;">
						        <li><a class="dropdown-item" href="#">Electronics</a></li>
						        <li><a class="dropdown-item" href="#">Fashion</a></li>
						        <li><a class="dropdown-item" href="#">Home Appliances</a></li>
						        <li><hr class="dropdown-divider"></li>
						        <li><a class="dropdown-item" href="#">More Categories</a></li>
						    </ul>
						</li>
	
		                <li class="nav-item mx-4">
		                    <a class="nav-link" href="#">SHOP</a>
		                </li>
		                <li class="nav-item mx-4">
		                    <a class="nav-link" href="#">OFFERS</a>
		                </li>
		                <li class="nav-item mx-4">
		                    <a class="nav-link" href="#">FEEDBACK</a>
		                </li>
		                <li class="nav-item mx-4">
		                    <a class="nav-link" href="#">CONTACT</a>
		                </li>                   
		            </ul>
		            <!-- Right-aligned Cart -->
		            <ul class="navbar-nav ml-auto">
		                <li class="nav-item">
		                    <a class="nav-link" href="#">
		                        <i class="fas fa-shopping-cart"></i> CART
		                    </a>
		                </li>
		            </ul>
		        </div>
		    </nav>
		
		    <!-- Centered Search Bar -->
		    <div class="search-bar-container d-flex justify-content-center align-items-center p-3 w-50" style="background-color: #004d00; text-align: center; height: 60px; margin: 0 auto; border-bottom-left-radius: 15px; border-bottom-right-radius: 15px;">
			    <form class="form-inline d-flex justify-content-center">
			        <input id="searchInput" class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search" style="width: 25vw; max-width: 100vw;">
			        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			    </form>
			</div>
			
			<script>
			    const placeholderTexts = ["Search products...", "Find your favorite items...", "Explore offers..."];
			    const searchInput = document.getElementById("searchInput");
			    let placeholderIndex = 0;
			    let charIndex = 0;
			
			    function typePlaceholder() {
			        const currentText = placeholderTexts[placeholderIndex];
			        searchInput.setAttribute("placeholder", currentText.substring(0, charIndex));
			        charIndex++;
			
			        if (charIndex > currentText.length) {
			            setTimeout(() => {
			                charIndex = 0;
			                placeholderIndex = (placeholderIndex + 1) % placeholderTexts.length; // Cycle through texts
			                typePlaceholder();
			            }, 1000); // Pause before switching to the next text
			        } else {
			            setTimeout(typePlaceholder, 100); // Typing speed
			        }
			    }
			
			    typePlaceholder();
			</script>
		    
		</header>
	
		<br><br>
	
	    <!-- Bootstrap 5 Carousel -->
		<div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="img/slide1.jpg" class="d-block w-100" alt="Slide 1" style="height: 800px; object-fit: cover;">
		    </div>
		    <div class="carousel-item">
		      <img src="img/slide2.jpg" class="d-block w-100" alt="Slide 2" style="height: 800px; object-fit: cover;">
		    </div>
		    <div class="carousel-item">
		      <img src="img/slide3.jpg" class="d-block w-100" alt="Slide 3" style="height: 800px; object-fit: cover;">
		    </div>
		    <div class="carousel-item">
		      <img src="img/slide4.jpg" class="d-block w-100" alt="Slide 4" style="height: 800px; object-fit: cover;">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		 
		 <!-- Top Products Section -->
		<div class="container mt-5">
		    <div class="d-flex align-items-center mb-4" style="margin-top: 20px; margin-bottom: 20px;">
		        <hr class="flex-grow-1 me-3" style="border: 1px solid black; margin: 0 10px;">
		        <h2 class="text-center mb-0" style="color: black;"><b>Top Products</b></h2>
		        <hr class="flex-grow-1 ms-3" style="border: 1px solid black; margin: 0 10px;">
		    </div>
		    <div class="row">
		        <!-- Product 1 -->
		        <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
		            <div class="card" style="height: 300px;">
		                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Product 1">
		                <div class="card-body">
		                    <h5 class="card-title text-center">Product 1</h5>
		                    <p class="card-text text-center">Price: Rs: 150.00</p>
		                </div>
		            </div>
		        </div>
		
		        <!-- Product 2 -->
		        <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
		            <div class="card" style="height: 300px;">
		                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Product 2">
		                <div class="card-body">
		                    <h5 class="card-title text-center">Product 2</h5>
		                    <p class="card-text text-center">Price: Rs: 150.00</p>
		                </div>
		            </div>
		        </div>
		
		        <!-- Product 3 -->
		        <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
		            <div class="card" style="height: 300px;">
		                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Product 3">
		                <div class="card-body">
		                    <h5 class="card-title text-center">Product 3</h5>
		                    <p class="card-text text-center">Price: Rs: 150.00</p>
		                </div>
		            </div>
		        </div>
		
		        <!-- Product 4 -->
		        <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
		            <div class="card" style="height: 300px;">
		                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Product 4">
		                <div class="card-body">
		                    <h5 class="card-title text-center">Product 4</h5>
		                    <p class="card-text text-center">Price: Rs: 150.00</p>
		                </div>
		            </div>
		        </div>
		
		        <!-- Product 5 -->
		        <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
		            <div class="card" style="height: 300px;">
		                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Product 5">
		                <div class="card-body">
		                    <h5 class="card-title text-center">Product 5</h5>
		                    <p class="card-text text-center">Price: Rs: 150.00</p>
		                </div>
		            </div>
		        </div>
		        
		        <!-- Product 6 -->
		        <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
		            <div class="card" style="height: 300px;">
		                <img src="https://via.placeholder.com/150" class="card-img-top" alt="Product 6">
		                <div class="card-body">
		                    <h5 class="card-title text-center">Product 6</h5>
		                    <p class="card-text text-center">Price: Rs: 150.00</p>
		                </div>
		            </div>
		        </div>      
		    </div>
		</div>
	
		<!-- Featured Offers Section -->
		<div class="container mt-5">
		    <div class="d-flex align-items-center mb-4" style="margin-top: 20px; margin-bottom: 20px;">
		        <hr class="flex-grow-1 me-3" style="border: 1px solid black; margin: 0 10px;">
		        <h2 class="text-center mb-0" style="color: black;"><b>Featured Offers</b></h2>
		        <hr class="flex-grow-1 ms-3" style="border: 1px solid black; margin: 0 10px;">
		    </div>
		    <div class="row">
		        <!-- Offer 1 -->
		        <div class="col-md-6">
		            <div class="card">
		                <div class="card-body text-center">
		                    <h5 class="card-title">Buy 1 Get 1 Free</h5>
		                    <p class="card-text">On selected items. Offer valid until <strong>March 10th!</strong></p>
		                    <a href="#" class="btn btn-danger">Shop Now</a>
		                </div>
		            </div>
		        </div>
		        <!-- Offer 2 -->
		        <div class="col-md-6">
		            <div class="card">
		                <div class="card-body text-center">
		                    <h5 class="card-title">Flash Sale</h5>
		                    <p class="card-text">Up to 50% off. Grab it before it's gone!</p>
		                    <a href="#" class="btn btn-danger">Browse Sale</a>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	
		
	
		
		<!-- App Banner Section -->
		<div class="container-fluid mt-5 p-5" style="background-color: #f8f9fa; height: 60vh;">
		    <div class="row align-items-center h-100">
		        <!-- Left Side: Image -->
		        <div class="col-md-7 order-md-1 order-2">
		            <div style="height: 100%; max-height: 400px;">
		                <img src="img/banner.png" class="img-fluid w-100 h-100" style="object-fit: cover;" alt="App Banner">
		            </div>
		        </div>
		
		        <!-- Right Side: Content -->
		        <div class="col-md-5 order-md-2 order-1 text-center">
		            <h3>Download Our App Now!</h3>
		            <p>Experience the best of our services on mobile.</p>
		            <a href="https://your-app-link.com" target="_blank" class="btn btn-outline-dark btn-lg mt-3">
		                Get the App
		            </a>
		        </div>
		    </div>
		</div>
	
		<!-- Feedback and Support Section -->
		<div class="container mt-5">
		    <div class="d-flex align-items-center mb-4" style="margin-top: 20px; margin-bottom: 20px;">
		        <hr class="flex-grow-1 me-3" style="border: 1px solid black; margin: 0 10px;">
		        <h2 class="text-center mb-0" style="color: black;"><b>Support</b></h2>
		        <hr class="flex-grow-1 ms-3" style="border: 1px solid black; margin: 0 10px;">
		    </div>
		    <div class="row">
		        <div class="col-md-6">
		            <h5>We'd Love to Hear from You!</h5>
		            <p>Tell us about your experience or let us know how we can assist you.</p>
		        </div>
		        <div class="col-md-6">
		            <form>
		                <div class="form-group">
		                    <label for="name">Name</label>
		                    <input type="text" class="form-control" id="name" placeholder="Enter your name" required>
		                </div>
		                <div class="form-group">
		                    <label for="email">Email</label>
		                    <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
		                </div>
		                <div class="form-group">
		                    <label for="feedback">Feedback</label>
		                    <textarea class="form-control" id="feedback" rows="4" placeholder="Your message here..." required></textarea>
		                </div>
		                <button type="submit" class="btn btn-primary">Submit</button>
		            </form>
		        </div>
		    </div>
		</div>
	
	
	    <!-- Footer -->
	    <footer class="text-center py-3 mt-5">
		   
		    <div class="contact-info">
		        <p><i class="fas fa-phone-alt"></i> Phone: +94700000000</p>
		        <p><i class="fas fa-map-marker-alt"></i> Address: 123 Main Street, Colombo, Sri Lanka</p>
		    </div>
		    <div class="social-media-links">
		        <a href="https://facebook.com" target="_blank" class="mx-3">
		            <i class="fab fa-facebook fa-2x" style="color: #4267B2;"></i>
		        </a>
		        <a href="https://twitter.com" target="_blank" class="mx-3">
		            <i class="fab fa-twitter fa-2x" style="color: #1DA1F2;"></i>
		        </a>
		        <a href="https://instagram.com" target="_blank" class="mx-3">
		            <i class="fab fa-instagram fa-2x" style="color: #E1306C;"></i>
		        </a>
		        <a href="https://linkedin.com" target="_blank" class="mx-3">
		            <i class="fab fa-linkedin fa-2x" style="color: #0077b5;"></i>
		        </a>
		    </div>
		     <p>&copy; 2025 GOS. All rights reserved.</p>
		</footer>
	
	    <!-- jQuery (Required for Bootstrap's JavaScript) -->
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	    <!-- Bootstrap JS -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
	
	</body>
</html>
