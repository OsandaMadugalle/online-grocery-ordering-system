<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.Customer" %>
<%@ page session="true" %>

<c:if test="${empty sessionScope.loggedIn or empty sessionScope.customerDetails}">
    <c:redirect url="/customer/cusLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart</title>
    <link rel="icon" type="image/png" href="../images/fav.png">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        :root {
            --primary-green: #004d00;
            --light-green: #e8f5e9;
            --accent-gold: #FFD700;
            --dark-green: #013220;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-green);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .content-wrapper {
            flex: 1;
            padding: 30px 0;
        }
        
        main {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .cart-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-top: 20px;
        }
        
        .cart-header {
            background-color: var(--primary-green);
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
        }
        
        .cart-header h2 {
            color: var(--accent-gold);
            margin: 0;
            font-weight: 600;
            font-size: 1.8rem;
        }
        
        .cart-actions {
            display: flex;
            justify-content: space-between;
            padding: 15px 20px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }
        
        .cart-actions .btn {
            padding: 8px 15px;
            font-weight: 500;
            border-radius: 5px;
        }
        
        .cart-actions .btn i {
            margin-right: 8px;
        }
        
        .cart-items-container {
            padding: 20px;
            min-height: 200px;
        }
        
        .cart-item {
            display: flex;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        
        .product-image {
            width: 90px;
            height: 90px;
            background-color: #f5f5f5;
            margin-right: 15px;
            border-radius: 5px;
            background-size: cover;
            background-position: center;
            flex-shrink: 0;
        }
        
        .product-details {
            flex-grow: 1;
        }
        
        .product-title {
            font-weight: 600;
            margin-bottom: 5px;
            font-size: 1.1rem;
        }
        
        .product-description {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }
        
        .quantity-control {
            display: flex;
            align-items: center;
        }
        
        .quantity-input {
            width: 50px;
            padding: 6px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin: 0 8px;
        }
        
        .quantity-btn {
            width: 28px;
            height: 28px;
            border: 1px solid #ddd;
            background: #f9f9f9;
            border-radius: 4px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .remove-btn {
            color: #dc3545;
            background: none;
            border: none;
            cursor: pointer;
            margin-left: 15px;
            font-size: 0.9rem;
        }
        
        .remove-btn i {
            margin-right: 5px;
        }
        
        .cart-summary {
            padding: 20px;
            background-color: #f8f9fa;
            border-top: 1px solid #dee2e6;
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 1rem;
        }
        
        .checkout-btn {
            width: 100%;
            padding: 12px;
            background-color: var(--primary-green);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }
        
        .checkout-btn:hover {
            background-color: var(--dark-green);
        }
        
        .checkout-btn i {
            margin-right: 8px;
        }
        
        .empty-cart {
            text-align: center;
            padding: 40px 20px;
        }
        
        .empty-cart i {
            font-size: 3rem;
            color: #ccc;
            margin-bottom: 15px;
        }
        
        .empty-cart h3 {
            color: #555;
            margin-bottom: 15px;
        }
        
        .empty-cart p {
            color: #777;
            margin-bottom: 20px;
        }
        
        @media (max-width: 768px) {
            .content-wrapper {
                padding: 20px 0;
            }
            
            .cart-item {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .product-image {
                width: 100%;
                height: 150px;
                margin-right: 0;
                margin-bottom: 15px;
            }
            
            .quantity-control {
                margin-top: 15px;
                width: 100%;
                justify-content: space-between;
            }
            
            .cart-actions {
                flex-direction: column;
                gap: 10px;
            }
            
            .cart-actions .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <div class="content-wrapper">
        <main>
            <div class="cart-container">
                <div class="cart-header">
                    <h2><i class="fas fa-shopping-cart"></i>My Shopping Cart</h2>
                </div>
                
                <div class="cart-actions">
                    <button class="btn btn-outline-secondary" onclick="goBack()">
                        <i class="fas fa-arrow-left"></i>Back to Shopping
                    </button>
                    <button class="btn btn-outline-primary" onclick="viewProfile()">
                        <i class="fas fa-user"></i>My Profile
                    </button>
                </div>
                
                <div class="cart-items-container" id="cart-items">
                    <!-- Cart items will be dynamically populated here -->
                </div>
                
                <div class="cart-summary">
                    <div class="summary-row">
                        <span>Subtotal:</span>
                        <span id="subtotal">Rs. 0</span>
                    </div>
                    <div class="summary-row">
                        <span>Delivery Fee:</span>
                        <span id="delivery-fee">Rs. 400</span>
                    </div>
                    <div class="summary-row" style="font-weight: 600; font-size: 1.1rem;">
                        <span>Total:</span>
                        <span id="total">Rs. 400</span>
                    </div>
                    <button class="checkout-btn" onclick="proceedToCheckout()">
                        <i class="fas fa-credit-card"></i> Proceed to Checkout
                    </button>
                </div>
            </div>
        </main>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Sample cart data
        const cartItems = [
            { 
                id: 1, 
                name: 'Fresh Apples', 
                price: 150, 
                quantity: 2, 
                detail: '1kg, Imported',
                image: 'images/products/apples.jpg'
            },
            { 
                id: 2, 
                name: 'Basmati Rice', 
                price: 300, 
                quantity: 1, 
                detail: '5kg pack',
                image: 'images/products/rice.jpg'
            },
            { 
                id: 3, 
                name: 'Organic Milk', 
                price: 310, 
                quantity: 1, 
                detail: '1L, Full Cream',
                image: 'images/products/milk.jpg'
            }
        ];

        function renderCartItems() {
            const cartItemsContainer = document.getElementById('cart-items');
            cartItemsContainer.innerHTML = '';

            if (cartItems.length === 0) {
                cartItemsContainer.innerHTML = `
                    <div class="empty-cart">
                        <i class="fas fa-shopping-cart"></i>
                        <h3>Your cart is empty</h3>
                        <p>Browse our products and add items to your cart</p>
                        <a href="products.jsp" class="btn btn-primary">
                            <i class="fas fa-store"></i> Continue Shopping
                        </a>
                    </div>
                `;
                return;
            }

            cartItems.forEach(item => {
                const cartItemElement = document.createElement('div');
                cartItemElement.classList.add('cart-item');
                cartItemElement.innerHTML = `
                    <div class="product-image" style="background-image: url('${item.image}')"></div>
                    <div class="product-details">
                        <h4 class="product-title">${item.name}</h4>
                        <p class="product-description">${item.detail}</p>
                        <div class="d-flex align-items-center">
                            <button class="quantity-btn" onclick="updateQuantity(${item.id}, ${item.quantity-1})">-</button>
                            <input type="number" class="quantity-input" value="${item.quantity}" 
                                   onchange="updateQuantity(${item.id}, this.value)">
                            <button class="quantity-btn" onclick="updateQuantity(${item.id}, ${item.quantity+1})">+</button>
                            <span class="ml-3 font-weight-bold">Rs. ${item.price * item.quantity}</span>
                            <button class="remove-btn" onclick="removeItem(${item.id})">
                                <i class="fas fa-trash"></i> Remove
                            </button>
                        </div>
                    </div>
                `;
                cartItemsContainer.appendChild(cartItemElement);
            });

            updateTotals();
        }

        function updateQuantity(id, newQuantity) {
            const itemIndex = cartItems.findIndex(item => item.id === id);
            if (itemIndex !== -1) {
                if (newQuantity < 1) {
                    removeItem(id);
                } else {
                    cartItems[itemIndex].quantity = parseInt(newQuantity);
                    renderCartItems();
                }
            }
        }

        function removeItem(id) {
            const itemIndex = cartItems.findIndex(item => item.id === id);
            if (itemIndex !== -1) {
                cartItems.splice(itemIndex, 1);
                renderCartItems();
            }
        }

        function updateTotals() {
            const subtotal = cartItems.reduce((total, item) => total + (item.price * item.quantity), 0);
            const deliveryFee = 400;
            const total = subtotal + deliveryFee;

            document.getElementById('subtotal').textContent = `Rs. ${subtotal.toLocaleString()}`;
            document.getElementById('total').textContent = `Rs. ${total.toLocaleString()}`;
        }

        function proceedToCheckout() {
            if (cartItems.length === 0) {
                alert('Your cart is empty. Please add items before checkout.');
                return;
            }
            window.location.href = 'checkout.jsp';
        }
        
        function goBack() {
            window.history.back();
        }
        
        function viewProfile() {
            window.location.href = 'customerAccount.jsp';
        }

        $(document).ready(function() {
            // Initial render
            renderCartItems();
        });
    </script>
</body>
</html>