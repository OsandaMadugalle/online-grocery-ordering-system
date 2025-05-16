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
    <title>Shop</title>
    <link rel="icon" type="image/png" href="../images/fav.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --header-height: 160px; /* Must match header.jsp height */
            --primary-green: #004d00;
            --light-green: #e8f5e9;
            --accent-gold: #FFD700;
            --dark-green: #013220;
        }

        body {
            padding-top: var(--header-height);
            background-color: var(--light-green);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
        }

        .shop-container {
            margin-top: 30px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 77, 0, 0.1);
            padding: 20px;
        }

        .filter-bar {
            margin-bottom: 20px;
        }

        .filter-bar select {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .product-card {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .product-card h5 {
            font-weight: 700;
            color: var(--primary-green);
            margin-top: 15px;
        }

        .product-card p {
            font-style: italic;
            margin-bottom: 15px;
        }

        .product-card .price {
            font-weight: 700;
            color: var(--accent-gold);
            font-size: 1.2rem;
        }

        .btn-add-cart {
            background-color: var(--primary-green);
            color: white;
            padding: 10px;
            font-weight: 600;
            border-radius: 5px;
            text-transform: uppercase;
            width: 100%;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-add-cart:hover {
            background-color: var(--dark-green);
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            body {
                padding-top: 200px; /* Adjust if header height changes on mobile */
            }

            .filter-bar {
                display: flex;
                justify-content: space-between;
                flex-direction: column;
            }

            .product-card {
                padding: 15px;
            }
        }
    </style>
</head>


<body>

    <%@ include file="header.jsp" %>

    <%
        // Get all products from service
        ProductService productService = new ProductService();
        List<Product> allProducts = productService.getAllProducts();
        request.setAttribute("allProducts", allProducts);
    %>

    <main>
        <div class="container my-5">
            <div class="shop-container">
                <!-- Filter Bar -->
                <div class="filter-bar row">
                    <div class="col-md-4">
                        <select class="form-control" id="categoryFilter">
                            <option value="">Filter by Category</option>
                            <option value="fruits">Fruits</option>
                            <option value="vegetables">Vegetables</option>
                            <option value="dairy">Dairy</option>
                            <option value="grains">Grains</option>
                            <option value="snacks">Snacks</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <select class="form-control" id="priceSort">
                            <option value="">Sort by Price</option>
                            <option value="asc">Low to High</option>
                            <option value="desc">High to Low</option>
                        </select>
                    </div>
                </div>

                <!-- Product List -->
                <div class="row" id="productList">
                    <c:choose>
                        <c:when test="${not empty allProducts}">
                            <c:forEach items="${allProducts}" var="product">
                                <div class="col-md-4 col-sm-6 mb-4">
                                    <div class="product-card">
                                        <img src="<%= request.getContextPath() %>/${product.imagePath}" 
                                             alt="${product.productName}"
                                             onerror="this.onerror=null;this.src='<%= request.getContextPath() %>/images/productImages/default-product.png'">
                                        <h5>${product.productName}</h5>
                                        <p>${product.category}</p>
                                        <span class="price">Rs. ${product.price}</span>
                                        <button class="btn-add-cart">Add to Cart</button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-12 text-center">
                                <p>No products available</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS + dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Filter and Sort Logic -->
    <script>
        $(document).ready(function() {
            // Handle filter by category and price
            $('#categoryFilter, #priceSort').change(function() {
                filterProducts();
            });

            function filterProducts() {
                let category = $('#categoryFilter').val().toLowerCase();
                let sortOrder = $('#priceSort').val();
                
                // Get all product cards
                let $products = $('.product-card').parent();
                
                // Filter by category if selected
                if (category) {
                    $products.each(function() {
                        let $card = $(this);
                        let productCategory = $card.find('p').text().toLowerCase();
                        if (productCategory.includes(category)) {
                            $card.show();
                        } else {
                            $card.hide();
                        }
                    });
                } else {
                    $products.show();
                }
                
                // Sort by price if selected
                if (sortOrder) {
                    let $productList = $('#productList');
                    let $sortedProducts = $('.product-card').parent().sort(function(a, b) {
                        let priceA = parseFloat($(a).find('.price').text().replace('Rs. ', '').trim());
                        let priceB = parseFloat($(b).find('.price').text().replace('Rs. ', '').trim());
                        return sortOrder === 'asc' ? priceA - priceB : priceB - priceA;
                    });
                    
                    $productList.empty().append($sortedProducts);
                }
            }
        });
    </script>
</body>
</html>