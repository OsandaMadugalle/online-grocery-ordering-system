<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shop</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
    
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        :root {
            --header-height: 160px;
            --primary-color: #2c3e50;
            --accent-color: #3498db;
        }
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            padding-top: var(--header-height);
            background-color: #f4f4f4;
            transition: margin-left 0.3s ease;
        }
        
        .main-content {
            padding: 20px;
            min-height: calc(100vh - var(--header-height) - 60px);
        }
        
        .grid-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            padding-top: 20px;
            padding-left: 30px;
        }
        
        .product-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 15px;
            text-align: center;
            transition: transform 0.3s ease;
        }
        
        .product-card:hover {
            transform: scale(1.05);
        }
        
        .product-card img {
            max-width: 150px;
            height: 150px;
            object-fit: contain;
        }
        
        .product-card h3 {
            margin: 10px 0;
            color: #333;
        }
        
        .product-card p {
            color: #666;
            font-size: 0.9em;
        }
        
        .main-content h1 {
            margin-top: 20px;
            padding-left: 30px;
        }
        
        @media (max-width: 992px) {
            .grid-container {
                grid-template-columns: repeat(3, 1fr);
            }
        }
        
        @media (max-width: 768px) {
            .grid-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 576px) {
            .grid-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <%@ include file="/header.jsp" %>

    <div class="main-content" id="mainContent">
        <h1><i class="fas fa-shopping-basket"></i> Grocery Products</h1>
        <div id="productGrid" class="grid-container"></div>
    </div>

    <%@ include file="/footer.jsp" %>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Product data - general grocery items
        const products = [
            { name: 'Bread', price: '$2.49', image: 'images/productImages/default-product.png' },
            { name: 'Eggs', price: '$3.99', image: 'images/grocery/eggs.jpg' },
            { name: 'Milk', price: '$2.79', image: 'images/grocery/milk.jpg' },
            { name: 'Butter', price: '$1.99', image: 'images/grocery/butter.jpg' },
            { name: 'Cereal', price: '$4.29', image: 'images/grocery/cereal.jpg' },
            { name: 'Coffee', price: '$5.49', image: 'images/grocery/coffee.jpg' },
            { name: 'Tea', price: '$3.59', image: 'images/grocery/tea.jpg' },
            { name: 'Peanut Butter', price: '$2.99', image: 'images/grocery/peanutbutter.jpg' },
            { name: 'Jam', price: '$2.49', image: 'images/grocery/jam.jpg' },
            { name: 'Toilet Paper', price: '$6.99', image: 'images/grocery/toiletpaper.jpg' }
        ];

        function renderProducts() {
            const gridContainer = document.getElementById('productGrid');
            gridContainer.innerHTML = '';

            products.forEach(product => {
                const card = document.createElement('div');
                card.classList.add('product-card');
                card.innerHTML = `
                    <img src="${product.image}" alt="${product.name}" class="img-fluid">
                    <h3>${product.name}</h3>
                    <p>${product.price}</p>
                    <button class="btn btn-primary btn-sm mt-2" onclick="addToCart('${product.name}')">
                        <i class="fas fa-cart-plus"></i> Add to Cart
                    </button>
                `;
                gridContainer.appendChild(card);
            });
        }

        function addToCart(productName) {
            alert(`${productName} added to cart!`);
            // Real cart logic goes here
        }

        $(document).ready(function() {
            renderProducts();
        });
    </script>
</body>
</html>
