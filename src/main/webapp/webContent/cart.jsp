<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart - Online Grocery</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
    
    <!-- FontAwesome -->
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding-top: var(--header-height);
            background-color: var(--light-green);
            margin: 0;
        }
        
        main {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        .cart-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .cart-header {
            background-color: var(--primary-green);
            color: white;
            padding: 25px;
            text-align: center;
        }
        
        .cart-header h2 {
            color: var(--accent-gold);
            margin: 0;
            font-weight: 600;
        }
        
        .cart-items-container {
            padding: 25px;
        }
        
        .cart-item {
            display: flex;
            align-items: center;
            padding: 20px 0;
            border-bottom: 1px solid #eee;
        }
        
        .product-image {
            width: 100px;
            height: 100px;
            background-color: #f5f5f5;
            margin-right: 20px;
            border-radius: 5px;
            background-size: cover;
            background-position: center;
        }
        
        .product-details {
            flex-grow: 1;
        }
        
        .product-title {
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .product-description {
            color: #666;
            font-size: 0.9rem;
        }
        
        .quantity-control {
            display: flex;
            align-items: center;
        }
        
        .quantity-input {
            width: 60px;
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin: 0 10px;
        }
        
        .quantity-btn {
            width: 30px;
            height: 30px;
            border: 1px solid #ddd;
            background: #f9f9f9;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .remove-btn {
            color: #dc3545;
            background: none;
            border: none;
            cursor: pointer;
            margin-left: 20px;
        }
        
        .cart-summary {
            padding: 25px;
            background-color: #f9f9f9;
            border-top: 1px solid #eee;
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            font-size: 1.1rem;
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
        }
        
        .checkout-btn:hover {
            background-color: var(--dark-green);
        }
        
        .empty-cart {
            text-align: center;
            padding: 50px 20px;
        }
        
        .empty-cart i {
            font-size: 3rem;
            color: #ccc;
            margin-bottom: 20px;
        }
        
        @media (max-width: 768px) {
            body {
                padding-top: 180px;
            }
            
            .cart-item {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .product-image {
                margin-bottom: 15px;
            }
            
            .quantity-control {
                margin-top: 15px;
                width: 100%;
                justify-content: space-between;
            }
        }
    </style>
</head>
<body>

    <%@ include file="header.jsp" %>  

    <main>
        <div class="cart-container">
            <div class="cart-header">
                <h2><i class="fas fa-shopping-cart"></i> My Shopping Cart</h2>
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
                <div class="summary-row" style="font-weight: 600;">
                    <span>Total:</span>
                    <span id="total">Rs. 400</span>
                </div>
                <button class="checkout-btn" onclick="proceedToCheckout()">
                    <i class="fas fa-credit-card"></i> Proceed to Checkout
                </button>
            </div>
        </div>
    </main>

    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS -->
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

        // Fix header issues
        $(document).ready(function() {
            // Ensure header height is properly accounted for
            const headerHeight = $('header').outerHeight();
            if (headerHeight) {
                $('body').css('padding-top', headerHeight + 'px');
                $(':root').css('--header-height', headerHeight + 'px');
            }
            
            // Make sure logo link works
            $('.navbar-brand').on('click', function(e) {
                e.preventDefault();
                window.location.href = 'index.jsp';
            });
            
            // Initial render
            renderCartItems();
        });
    </script>
</body>
</html>