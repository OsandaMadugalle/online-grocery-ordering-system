<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart - Online Grocery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .cart-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .header {
            display: flex;
            justify-content: space-between;
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        .product-info {
            display: flex;
            align-items: center;
        }
        .product-image {
            width: 80px;
            height: 80px;
            background-color: #e0e0e0;
            margin-right: 15px;
        }
        .product-details {
            flex-grow: 1;
        }
        .quantity-input {
            width: 50px;
            padding: 5px;
            text-align: center;
        }
        .remove-btn {
            color: red;
            cursor: pointer;
            text-decoration: underline;
            border: none;
            background: none;
        }
        .cart-summary {
            padding: 15px;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .checkout-btn {
            width: 100%;
            padding: 15px;
            background-color: #6242ef;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .nav-buttons {
            display: flex;
            gap: 10px;
        }
    </style>
</head>
<body>
    <div class="cart-container">
        <div class="header">
            <h2>My Cart</h2>
            <div class="nav-buttons">
                <button onclick="window.location.href='profile.html'">My Profile</button>
                <button onclick="logout()">Log Out</button>
            </div>
        </div>

        <div id="cart-items">
            <!-- Cart items will be dynamically populated here -->
        </div>

        <div class="cart-summary">
            <div class="summary-row">
                <span>Subtotal:</span>
                <span id="subtotal">Rs. 1,840</span>
            </div>
            <div class="summary-row">
                <span>Delivery Fee:</span>
                <span id="delivery-fee">Rs. 400</span>
            </div>
            <div class="summary-row">
                <strong>Total:</strong>
                <strong id="total">Rs. 2,240</strong>
            </div>
            <button class="checkout-btn" onclick="proceedToCheckout()">Checkout</button>
        </div>
    </div>

    <script>
        // Sample cart data
        const cartItems = [
            { id: 1, name: 'Product', price: 150, quantity: 1 },
            { id: 2, name: 'Product', price: 300, quantity: 1 },
            { id: 3, name: 'Product', price: 310, quantity: 2 },
            { id: 4, name: 'Product', price: 150, quantity: 1 }
        ];

        function renderCartItems() {
            const cartItemsContainer = document.getElementById('cart-items');
            cartItemsContainer.innerHTML = '';

            cartItems.forEach(item => {
                const cartItemElement = document.createElement('div');
                cartItemElement.classList.add('cart-item');
                cartItemElement.innerHTML = `
                    <div class="product-info">
                        <div class="product-image"></div>
                        <div class="product-details">
                            <strong>${item.name}</strong>
                            <p>Product detail</p>
                        </div>
                    </div>
                    <div>
                        <input type="number" min="1" value="${item.quantity}" 
                               class="quantity-input" 
                               onchange="updateQuantity(${item.id}, this.value)">
                        <p>Rs.${item.price * item.quantity}</p>
                        <button class="remove-btn" onclick="removeItem(${item.id})">Remove</button>
                    </div>
                `;
                cartItemsContainer.appendChild(cartItemElement);
            });

            updateTotals();
        }

        function updateQuantity(id, newQuantity) {
            const itemIndex = cartItems.findIndex(item => item.id === id);
            if (itemIndex !== -1) {
                cartItems[itemIndex].quantity = parseInt(newQuantity);
                renderCartItems();
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
            alert('Proceeding to checkout!');
            // Implement checkout logic here
        }

        function logout() {
            alert('Logging out!');
            // Implement logout logic here
        }

        // Initial render
        renderCartItems();
    </script>
</body>
</html>