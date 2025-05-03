<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vegetables - Category</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .category-header {
            background-color: #f8f9fa;
            padding: 20px 0;
            text-align: center;
        }

        .category-header h2 {
            margin-bottom: 10px;
            color: #333;
        }

        .product-card img {
            height: 200px;
            object-fit: cover;
        }

        .card-body h5 {
            font-size: 16px;
            text-align: center;
        }

        .card-body p {
            text-align: center;
            color: #007bff;
            font-weight: bold;
        }

        .product-section {
            margin-top: 30px;
        }

        .quantity-input {
            width: 60px;
            margin-right: 10px;
        }

        .vegetables-header {
            background-color: #f1f1f1;
            padding: 10px;
            margin-bottom: 30px;
            text-align: center;
            border-radius: 5px;
        }

        .vegetables-header h3 {
            color: #333;
            font-size: 24px;
            margin: 0;
        }
    </style>
</head>

<body>
    <%@ include file="./header.jsp" %>

    <div class="category-header">
        <h2>Grocery</h2>
        <p>Browse through our fresh grocery items. Choose your desired groceries and add them to the cart!</p>
    </div>

    <!-- Vegetables Section Header -->
    <div class="vegetables-header">
        <h3>Fresh Vegetables</h3>
    </div>

    <!-- Product Listings -->
    <div class="container product-section">
        <div class="row">
            <!-- Product 1 (Carrot) -->
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card product-card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Carrot">
                    <div class="card-body">
                        <h5 class="card-title">Carrot</h5>
                        <p class="card-text">Rs: 50/kg</p>

                        <!-- Quantity Selector & Add to Cart Button -->
                        <div class="d-flex justify-content-center">
                            <input type="number" class="form-control quantity-input" value="1" min="1">
                            <button class="btn btn-success ms-2">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product 2 (Potato) -->
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card product-card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Potato">
                    <div class="card-body">
                        <h5 class="card-title">Potato</h5>
                        <p class="card-text">Rs: 30/kg</p>

                        <!-- Quantity Selector & Add to Cart Button -->
                        <div class="d-flex justify-content-center">
                            <input type="number" class="form-control quantity-input" value="1" min="1">
                            <button class="btn btn-success ms-2">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product 3 (Onion) -->
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card product-card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Onion">
                    <div class="card-body">
                        <h5 class="card-title">Onion</h5>
                        <p class="card-text">Rs: 40/kg</p>

                        <!-- Quantity Selector & Add to Cart Button -->
                        <div class="d-flex justify-content-center">
                            <input type="number" class="form-control quantity-input" value="1" min="1">
                            <button class="btn btn-success ms-2">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product 4 (Tomato) -->
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card product-card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Tomato">
                    <div class="card-body">
                        <h5 class="card-title">Tomato</h5>
                        <p class="card-text">Rs: 25/kg</p>

                        <!-- Quantity Selector & Add to Cart Button -->
                        <div class="d-flex justify-content-center">
                            <input type="number" class="form-control quantity-input" value="1" min="1">
                            <button class="btn btn-success ms-2">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product 5 (Cucumber) -->
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card product-card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Cucumber">
                    <div class="card-body">
                        <h5 class="card-title">Cucumber</h5>
                        <p class="card-text">Rs: 35/kg</p>

                        <!-- Quantity Selector & Add to Cart Button -->
                        <div class="d-flex justify-content-center">
                            <input type="number" class="form-control quantity-input" value="1" min="1">
                            <button class="btn btn-success ms-2">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product 6 (Spinach) -->
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card product-card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Spinach">
                    <div class="card-body">
                        <h5 class="card-title">Spinach</h5>
                        <p class="card-text">Rs: 40/kg</p>

                        <!-- Quantity Selector & Add to Cart Button -->
                        <div class="d-flex justify-content-center">
                            <input type="number" class="form-control quantity-input" value="1" min="1">
                            <button class="btn btn-success ms-2">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product 7 (Bell Pepper) -->
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card product-card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Bell Pepper">
                    <div class="card-body">
                        <h5 class="card-title">Bell Pepper</h5>
                        <p class="card-text">Rs: 50/kg</p>

                        <!-- Quantity Selector & Add to Cart Button -->
                        <div class="d-flex justify-content-center">
                            <input type="number" class="form-control quantity-input" value="1" min="1">
                            <button class="btn btn-success ms-2">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product 8 (Cauliflower) -->
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card product-card">
                    <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Cauliflower">
                    <div class="card-body">
                        <h5 class="card-title">Cauliflower</h5>
                        <p class="card-text">Rs: 60/kg</p>

                        <!-- Quantity Selector & Add to Cart Button -->
                        <div class="d-flex justify-content-center">
                            <input type="number" class="form-control quantity-input" value="1" min="1">
                            <button class="btn btn-success ms-2">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <%@ include file="./footer.jsp" %>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
