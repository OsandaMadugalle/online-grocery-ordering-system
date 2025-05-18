<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.gos.service.ProductService" %>
<%@ page import="com.gos.model.Product" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Home</title>	    
	    <link rel="icon" type="image/png" href="../images/fav.png">
	    
	    <!-- Bootstrap Icons -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
		    
		<!-- Include Bootstrap Icons -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	
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
		        background-color: white;
		        padding-top: 60px;
		    }
		     
		    .carousel-item.active img {
		        animation: zoomIn 1.5s ease-in-out;
		    }	
		    
		    .card {
			    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
			    height: 300px;
			}
			
			.card img {
			    height: 150px;
			    object-fit: contain;
			    padding: 10px;
			}
			
			.card:hover {
			    transform: scale(1.05);
			    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
			}
		    
		    .card-body {
		        display: flex;
		        flex-direction: column;
		        justify-content: space-between;
		    }
		    
		    .card-title {
		        font-size: 1rem;
		        margin-bottom: 0.5rem;
		    }
		    
		    .card-text {
		        font-size: 0.9rem;
		    }
		    
		    @keyframes zoomIn {
		        from { transform: scale(1); }
		        to { transform: scale(1.05); }
		    }
		    
		     .offer-card {
		        transition: transform 0.3s ease, box-shadow 0.3s ease;
		        border: none;
		        border-radius: 10px;
		        overflow: hidden;
		        background: #fff;
		    }
		
		    .offer-card:hover {
		        transform: translateY(-5px);
		        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
		    }
		
		    .btn-shop {
		        position: relative;
		        overflow: hidden;
		        z-index: 1;
		        transition: all 0.3s ease;
		    }
		
		    .btn-shop::before {
		        content: '';
		        position: absolute;
		        top: 0;
		        left: -100%;
		        width: 100%;
		        height: 100%;
		        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
		        transition: 0.5s;
		        z-index: -1;
		    }
		
		    .btn-shop:hover::before {
		        left: 100%;
		    }
		
		    .btn-shop:hover {
		        background-color: #c82333;
		        transform: scale(1.05);
		    }
		
		    .card-title {
		        font-size: 1.5rem;
		        font-weight: 600;
		        color: #333;
		    }
		
		    .card-text {
		        color: #555;
		    }
		
		    @media (max-width: 576px) {
		        .card-title {
		            font-size: 1.25rem;
		        }
		
		        .btn-shopiteral: inherit;
		        .offer-card {
		            margin-bottom: 1.5rem;
		        }
		    }
		</style>
	</head>
	
	<body>		    
	<%@ include file="./header.jsp" %>  
	
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
				      	<img src="../images/slide1.jpg" class="d-block w-100" alt="Slide 1" >
				    </div>
				    
				    <div class="carousel-item">
				      	<img src="../images/slide2.jpg" class="d-block w-100" alt="Slide 2" >
				    </div>
				    
				    <div class="carousel-item">
				      	<img src="../images/slide3.jpg" class="d-block w-100" alt="Slide 3" >
				    </div>
				    
				    <div class="carousel-item">
				      	<img src="../images/slide4.jpg" class="d-block w-100" alt="Slide 4" >
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
		 
		<%
		    // Get top products from service
		    ProductService productService = new ProductService();
		    List<Product> topProducts = productService.getTopProducts();
		    request.setAttribute("topProducts", topProducts);
		%>
		 
		<!-- Top Products Section -->
		<div class="container my-5">
		    <!-- Section Header with decorative lines -->
		    <div class="d-flex align-items-center mb-5">
		        <hr class="flex-grow-1" style="border-top: 2px solid rgba(0,0,0,0.1);">
		        <h2 class="text-center mx-4 mb-0 display-5 fw-bold text-uppercase" style="color: #2c3e50;">
		            <i class="bi bi-star-fill me-2 text-warning"></i>Top Products
		        </h2>
		        <hr class="flex-grow-1" style="border-top: 2px solid rgba(0,0,0,0.1);">
		    </div>
		    
		    <!-- Products Grid -->
		    <div class="row g-4">
		        <c:choose>
		            <c:when test="${not empty topProducts}">
		                <c:forEach items="${topProducts}" var="product">
		                    <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
		                        <div class="card h-100 shadow-sm border-0 rounded-3 overflow-hidden hover-shadow">
		                            <!-- Product Image with aspect ratio and hover effect -->
		                            <div class="ratio ratio-1x1 bg-light">
		                                <img src="<%= request.getContextPath() %>/${product.imagePath}" 
		                                     class="card-img-top p-3 object-fit-contain" 
		                                     alt="${product.productName}"
		                                     onerror="this.onerror=null;this.src='<%= request.getContextPath() %>/images/productImages/default-product.png'">
		                            </div>
		                            
		                            <!-- Card Body -->
		                            <div class="card-body d-flex flex-column p-3">
		                                <!-- Product Name with ellipsis for overflow -->
		                                <h5 class="card-title text-center mb-2 fs-6" style="min-height: 3rem; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
		                                    ${product.productName}
		                                </h5>
		                                
		                                <!-- Price with emphasis -->
		                                <p class="card-text text-center text-danger fw-bold mb-3">Rs. ${product.price}</p>
		                                
		                                <!-- Rating Badge (optional) -->
		                                <div class="text-center mb-3">
		                                    <span class="badge bg-warning text-dark">
		                                        <i class="bi bi-star-fill small"></i> 4.8
		                                    </span>
		                                </div>
		                                
		                                <!-- Add to Cart Button -->
		                                <div class="mt-auto text-center">
		                                    <a href="#" class="btn btn-primary btn-sm w-100 py-2 rounded-pill">
		                                        <i class="bi bi-cart-plus me-1"></i> Add to Cart
		                                    </a>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </c:forEach>
		            </c:when>
		            <c:otherwise>
		                <!-- Empty State -->
		                <div class="col-12 text-center py-5">
		                    <img src="<%= request.getContextPath() %>/images/empty-state.svg" alt="No products" class="img-fluid mb-4" style="max-height: 200px;">
		                    <h4 class="text-muted mb-3">No products available</h4>
		                    <a href="#" class="btn btn-outline-primary">Browse Products</a>
		                </div>
		            </c:otherwise>
		        </c:choose>
		    </div>
		    
		    <!-- View More Button -->
		    <div class="text-center mt-4">
		        <a href="#" class="btn btn-outline-dark px-4 rounded-pill">
		            View All Products <i class="bi bi-arrow-right ms-2"></i>
		        </a>
		    </div>
		</div>
		<!-- Featured Offers Section -->
		<div class="container mt-5">
		    <div class="d-flex align-items-center mb-4" style="margin-top: 20px; margin-bottom: 20px;">
		        <hr class="flex-grow-1 me-3" style="border: 1px solid #333; margin: 0 10px;">
		        <h2 class="text-center mb-0" style="color: #333; font-weight: 700;">Featured Offers</h2>
		        <hr class="flex-grow-1 ms-3" style="border: 1px solid #333; margin: 0 10px;">
		    </div>
		
		    <div class="row g-4">
		        <!-- Offer 1 -->
		        <div class="col-md-6">
		            <div class="card offer-card shadow-sm" role="article" aria-labelledby="offer1-title">
		                <div class="card-body text-center">
		                    <i class="bi bi-gift-fill" style="font-size: 2.5rem; color: #dc3545;"></i>
		                    <h5 class="card-title mt-3" id="offer1-title">Buy 1 Get 1 Free</h5>
		                    <p class="card-text">On selected items. Offer valid until <strong>March 10th!</strong></p>
		                    <div id="countdown" class="mb-3" aria-live="polite">
		                        <small>Ends in: <span id="timer"></span></small>
		                    </div>
		                    <a href="#" class="btn btn-danger btn-shop">Shop Now</a>
		                </div>
		            </div>
		        </div>
		
		        <!-- Offer 2 -->
		        <div class="col-md-6">
		            <div class="card offer-card shadow-sm" role="article" aria-labelledby="offer2-title">
		                <div class="card-body text-center">
		                    <i class="bi bi-lightning-charge-fill" style="font-size: 2.5rem; color: #dc3545;"></i>
		                    <h5 class="card-title mt-3" id="offer2-title">Flash Sale</h5>
		                    <p class="card-text">Up to 50% off. Limited stock remaining!</p>
		                    <div class="progress mb-3" style="height: 10px;" role="progressbar" aria-label="Stock remaining" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
		                        <div class="progress-bar bg-danger" style="width: 70%;"></div>
		                    </div>
		                    <a href="#" class="btn btn-danger btn-shop">Browse Sale</a>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	
		<!-- App Banner Section -->
		<section class="app-banner" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);">
		    <div class="container py-5">
		        <div class="row align-items-center">
		            <!-- Left Column - Content -->
		            <div class="col-lg-6 order-lg-1 order-2 py-5">
		                <div class="pe-lg-5">
		                    <h2 class="display-5 fw-bold mb-4">Download Our <span class="text-primary">Mobile App</span> Now!</h2>
		                    <p class="lead mb-4">Get exclusive app-only deals, faster checkout, and personalized recommendations.</p>
		                    
		                    <div class="d-flex flex-wrap gap-3 mt-4">
		                        <a href="#" class="btn btn-dark btn-lg px-4 py-3 d-flex align-items-center">
		                            <i class="bi bi-apple fs-3 me-2"></i>
		                            <div class="text-start">
		                                <small class="d-block">Download on the</small>
		                                <span class="fw-bold">App Store</span>
		                            </div>
		                        </a>
		                        <a href="#" class="btn btn-dark btn-lg px-4 py-3 d-flex align-items-center">
		                            <i class="bi bi-google-play fs-3 me-2"></i>
		                            <div class="text-start">
		                                <small class="d-block">Get it on</small>
		                                <span class="fw-bold">Google Play</span>
		                            </div>
		                        </a>
		                    </div>
		                    
		                    <div class="mt-4 d-flex align-items-center">
		                        <div class="me-3">
		                            <i class="bi bi-shield-check fs-4 text-success"></i>
		                        </div>
		                        <small class="text-muted">Secure and trusted by 500K+ users</small>
		                    </div>
		                </div>
		            </div>
		            
		            <!-- Right Column - Image -->
		            <div class="col-lg-6 order-lg-2 order-1">
		                <div class="position-relative">
		                    <img src="../images/banner.png" class="img-fluid rounded-4 shadow" alt="Mobile App Screenshots" loading="lazy">
		                    <div class="position-absolute top-0 start-0 w-100 h-100 bg-primary bg-opacity-10 rounded-4"></div>
		                </div>
		            </div>
		        </div>
		    </div>
		</section>
		
		<!-- Feedback and Support Section -->
		<section class="support-section py-5 bg-light">
		    <div class="container">
		        <!-- Section Header -->
		        <div class="text-center mb-5">
		            <span class="badge bg-primary bg-opacity-10 text-primary fs-6 fw-normal mb-3 px-3 py-2 rounded-pill">
		                <i class="bi bi-headset me-2"></i>Customer Support
		            </span>
		            <h2 class="display-6 fw-bold mb-3">We're Here to Help</h2>
		            <p class="lead text-muted mx-auto" style="max-width: 700px;">Have questions or feedback? We'd love to hear from you.</p>
		        </div>
		        
		        <div class="row g-5">
		            <!-- Contact Info -->
		            <div class="col-lg-5">
		                <div class="card border-0 shadow-sm h-100">
		                    <div class="card-body p-4 p-lg-5">
		                        <h3 class="h4 fw-bold mb-4">Contact Information</h3>
		                        
		                        <div class="d-flex mb-4">
		                            <div class="me-3 text-primary">
		                                <i class="bi bi-envelope fs-3"></i>
		                            </div>
		                            <div>
		                                <h4 class="h6 fw-bold mb-1">Email Us</h4>
		                                <a href="mailto:support@example.com" class="text-decoration-none">support@example.com</a>
		                            </div>
		                        </div>
		                        
		                        <div class="d-flex mb-4">
		                            <div class="me-3 text-primary">
		                                <i class="bi bi-telephone fs-3"></i>
		                            </div>
		                            <div>
		                                <h4 class="h6 fw-bold mb-1">Call Us</h4>
		                                <a href="tel:+1234567890" class="text-decoration-none">+1 (234) 567-890</a>
		                            </div>
		                        </div>
		                        
		                        <div class="d-flex mb-4">
		                            <div class="me-3 text-primary">
		                                <i class="bi bi-clock fs-3"></i>
		                            </div>
		                            <div>
		                                <h4 class="h6 fw-bold mb-1">Working Hours</h4>
		                                <p class="mb-0">Mon-Fri: 9AM - 6PM<br>Sat: 10AM - 4PM</p>
		                            </div>
		                        </div>
		                        
		                        <div class="mt-4 pt-3">
		                            <h4 class="h6 fw-bold mb-3">Follow Us</h4>
		                            <div class="d-flex gap-3">
		                                <a href="#" class="text-decoration-none text-muted">
		                                    <i class="bi bi-facebook fs-4"></i>
		                                </a>
		                                <a href="#" class="text-decoration-none text-muted">
		                                    <i class="bi bi-twitter fs-4"></i>
		                                </a>
		                                <a href="#" class="text-decoration-none text-muted">
		                                    <i class="bi bi-instagram fs-4"></i>
		                                </a>
		                                <a href="#" class="text-decoration-none text-muted">
		                                    <i class="bi bi-linkedin fs-4"></i>
		                                </a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            
		            <!-- Contact Form -->
		            <div class="col-lg-7">
		                <div class="card border-0 shadow-sm">
		                    <div class="card-body p-4 p-lg-5">
		                        <h3 class="h4 fw-bold mb-4">Send Us a Message</h3>
		                        
		                        <form>
		                            <div class="row g-3">
		                                <div class="col-md-6">
		                                    <label for="name" class="form-label">Your Name</label>
		                                    <div class="input-group">
		                                        <span class="input-group-text bg-light border-end-0">
		                                            <i class="bi bi-person text-muted"></i>
		                                        </span>
		                                        <input type="text" class="form-control" id="name" placeholder="John Doe" required>
		                                    </div>
		                                </div>
		                                
		                                <div class="col-md-6">
		                                    <label for="email" class="form-label">Email Address</label>
		                                    <div class="input-group">
		                                        <span class="input-group-text bg-light border-end-0">
		                                            <i class="bi bi-envelope text-muted"></i>
		                                        </span>
		                                        <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
		                                    </div>
		                                </div>
		                                
		                                <div class="col-12">
		                                    <label for="subject" class="form-label">Subject</label>
		                                    <div class="input-group">
		                                        <span class="input-group-text bg-light border-end-0">
		                                            <i class="bi bi-card-heading text-muted"></i>
		                                        </span>
		                                        <input type="text" class="form-control" id="subject" placeholder="How can we help?" required>
		                                    </div>
		                                </div>
		                                
		                                <div class="col-12">
		                                    <label for="message" class="form-label">Your Message</label>
		                                    <div class="input-group">
		                                        <span class="input-group-text bg-light border-end-0 align-items-start pt-2">
		                                            <i class="bi bi-chat-left-text text-muted"></i>
		                                        </span>
		                                        <textarea class="form-control" id="message" rows="5" placeholder="Type your message here..." required></textarea>
		                                    </div>
		                                </div>
		                                
		                                <div class="col-12">
		                                    <button type="submit" class="btn btn-primary px-4 py-2">
		                                        <i class="bi bi-send me-2"></i> Send Message
		                                    </button>
		                                </div>
		                            </div>
		                        </form>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</section>
		
		<!-- Bootstrap Bundle with Popper for Carousel -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>		
		
	
		<%@ include file="./footer.jsp" %>
		
		<script>
		    // Countdown timer for Offer 1
		    function startCountdown() {
		        const endDate = new Date('2025-03-10T23:59:59');
		        const timerElement = document.getElementById('timer');
		
		        function updateTimer() {
		            const now = new Date();
		            const timeLeft = endDate - now;
		
		            if (timeLeft <= 0) {
		                timerElement.textContent = 'Expired';
		                return;
		            }
		
		            const days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
		            const hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		            const minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
		            const seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);
		
		            timerElement.textContent = `${days}d ${hours}h ${minutes}m ${seconds}s`;
		        }
		
		        updateTimer();
		        setInterval(updateTimer, 1000);
		    }
		
		    // Start the countdown when the page loads
		    window.onload = startCountdown;
		</script>
	</body>
</html>