<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Home</title>	    
	    
	    <!-- Bootstrap Icons -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
	
		<!-- cart icon -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
				
		<!-- Carousel -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">		
		
		
	    <style>  		  
		    
		    .carousel-item img {
			    height: 800px;
			    object-fit: cover;
			}					    
		       
		    body {
		        background-color: white; /* Change background color to white */
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
	    
	    <!-- Include header file -->
  		<%@ include file="./header.jsp" %>  		
		
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
				      	<img src="images/slide1.jpg" class="d-block w-100" alt="Slide 1" >
				    </div>
				    
				    <div class="carousel-item">
				      	<img src="images/slide2.jpg" class="d-block w-100" alt="Slide 2" >
				    </div>
				    
				    <div class="carousel-item">
				      	<img src="images/slide3.jpg" class="d-block w-100" alt="Slide 3" >
				    </div>
				    
				    <div class="carousel-item">
				      	<img src="images/slide4.jpg" class="d-block w-100" alt="Slide 4" >
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
		                <img src="images/banner.png" class="img-fluid w-100 h-100" style="object-fit: cover;" alt="App Banner">
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
		
	    <!-- Include footer file -->
		<%@ include file="./footer.jsp" %>
		
		<!-- Bootstrap Bundle with Popper for Carousel -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>		
	
	</body>
</html>
