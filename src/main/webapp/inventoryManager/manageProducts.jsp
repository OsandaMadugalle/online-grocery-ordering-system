<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.gos.model.*" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- Authorization check (session) --%>
<c:if test="${empty sessionScope.loggedIn}">
    <c:redirect url="inventoryManagerLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Inventory Management - Products</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-bg: #1a1a2e;
            --secondary-bg: #16213e;
            --accent-color: #4cc9f0;
            --accent-hover: #3a9ec7;
            --text-color: white;
            --error-color: #e94560;
            --success-color: #4ade80;
            --warning-color: #f59e0b;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-bg);
            color: var(--text-color);
            padding: 20px 0;
            background-image: linear-gradient(to bottom right, var(--primary-bg), var(--secondary-bg));
        }
        
        .container {
            max-width: 95%;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.1);
            margin: 0 auto;
            animation: fadeIn 0.6s ease-out;
        }
        
        /* Header Section */
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .page-title {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--accent-color);
            margin: 0;
        }
        
        .product-count-badge {
            background-color: rgba(76, 201, 240, 0.2);
            color: var(--accent-color);
            padding: 8px 15px;
            border-radius: 20px;
            font-weight: 600;
            border: 1px solid var(--accent-color);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn-add {
            background: var(--accent-color);
            color: #0a192f;
            font-weight: 600;
            border-radius: 8px;
            padding: 10px 20px;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            border: none;
            text-decoration: none;
        }
        
        .btn-add:hover {
            background: var(--accent-hover);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 201, 240, 0.3);
        }
        
        /* Table Styles */
        .table-container {
            overflow-x: auto;
            border-radius: 10px;
            margin-top: 20px;
        }
        
        .product-table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            overflow: hidden;
        }
        
        .product-table thead tr {
            background: rgba(76, 201, 240, 0.2);
        }
        
        .product-table th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            color: var(--accent-color);
            border-bottom: 2px solid var(--accent-color);
        }
        
        .product-table td {
            padding: 12px 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            vertical-align: middle;
        }
        
        .product-table tbody tr {
            transition: all 0.2s ease;
        }
        
        .product-table tbody tr:hover {
            background: rgba(76, 201, 240, 0.1);
        }
        
        .product-table tbody tr:last-child td {
            border-bottom: none;
        }
        
        /* Action Buttons - UPDATED */
        .action-buttons {
            display: flex;
            gap: 8px;
            justify-content: flex-end;
            flex-wrap: wrap;
        }
        
        .btn-action {
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: all 0.2s ease;
            border: none;
            cursor: pointer;
            white-space: nowrap;
            height: 32px;
            box-sizing: border-box;
        }
        
        .btn-edit {
            background: rgba(245, 158, 11, 0.2);
            color: var(--warning-color);
            border: 1px solid var(--warning-color);
        }
        
        .btn-edit:hover {
            background: var(--warning-color);
            color: white;
        }
        
        .btn-delete {
            background: rgba(233, 69, 96, 0.2);
            color: var(--error-color);
            border: 1px solid var(--error-color);
        }
        
        .btn-delete:hover {
            background: var(--error-color);
            color: white;
        }
        
        /* Status Indicators */
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            display: inline-block;
        }
        
        .status-active {
            background: rgba(74, 222, 128, 0.2);
            color: var(--success-color);
            border: 1px solid var(--success-color);
        }
        
        .status-inactive {
            background: rgba(233, 69, 96, 0.2);
            color: var(--error-color);
            border: 1px solid var(--error-color);
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: rgba(255, 255, 255, 0.6);
        }
        
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: rgba(76, 201, 240, 0.3);
        }
        
        /* Navigation */
        .home-icon {
            position: fixed;
            top: 25px;
            left: 25px;
            font-size: 1.3rem;
            color: white;
            text-decoration: none;
            z-index: 100;
            background: rgba(76, 201, 240, 0.2);
            padding: 10px 15px;
            border-radius: 10px;
            transition: all 0.3s ease;
            border: 1px solid rgba(76, 201, 240, 0.3);
        }
        
        .home-icon:hover {
            background: rgba(76, 201, 240, 0.3);
            transform: translateY(-2px);
        }
        
        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            
            .header-container {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .product-table {
                display: block;
                width: 100%;
            }
            
            .product-table thead {
                display: none;
            }
            
            .product-table tbody, 
            .product-table tr, 
            .product-table td {
                display: block;
                width: 100%;
            }
            
            .product-table tr {
                margin-bottom: 15px;
                border: 1px solid rgba(255, 255, 255, 0.2);
                border-radius: 8px;
                padding: 10px;
            }
            
            .product-table td {
                text-align: right;
                padding-left: 50%;
                position: relative;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }
            
            .product-table td:before {
                content: attr(data-label);
                position: absolute;
                left: 15px;
                width: calc(50% - 15px);
                padding-right: 10px;
                font-weight: bold;
                text-align: left;
                color: var(--accent-color);
            }
            
            .product-table td:last-child {
                border-bottom: 0;
            }
            
            .action-buttons {
                justify-content: flex-end;
            }
            
            .home-icon {
                top: 15px;
                left: 15px;
                font-size: 1.1rem;
                padding: 8px 12px;
            }
        }

        @keyframes fadeIn {
            from { 
                opacity: 0; 
                transform: translateY(20px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }
    </style>
</head>

<body>
    <!-- Back Button -->
    <a href="${pageContext.request.contextPath}/inventoryManager/inventoryManagerDashboard.jsp" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="container">
        <!-- Header Section -->
        <div class="header-container">
            <h1 class="page-title">
                <i class="fas fa-boxes mr-2"></i>Product Inventory
            </h1>
            
            <div class="d-flex align-items-center gap-3">
                <c:if test="${not empty products}">
                    <div class="product-count-badge">
                        <i class="fas fa-box"></i> 
                        <span>Total: ${fn:length(products)}</span>
                    </div>
                </c:if>
                
                <a href="${pageContext.request.contextPath}/inventoryManager/createProduct.jsp" class="btn-add">
                    <i class="fas fa-plus"></i> Add Product
                </a>
            </div>
        </div>
        
        <!-- Products Table -->
        <div class="table-container">
            <c:choose>
                <c:when test="${not empty products}">
                    <table class="product-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Image</th>                                
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Stock</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td data-label="ID">${product.id}</td>
                                    <td data-label="Image">
									    <img src="${pageContext.request.contextPath}${product.imagePath}" 
									         alt="${product.productName}" 
									         style="max-width: 60px; max-height: 60px; border-radius: 8px; object-fit: cover;">
									</td>
                                    <td data-label="Product Name">
                                        <strong>${product.productName}</strong>
                                    </td>
                                    									                                    
                                    <td data-label="Category">
                                        <span class="status-badge">${product.category}</span>
                                    </td>
                                    <td data-label="Stock">
                                        <c:choose>
                                            <c:when test="${product.stock > 10}">
                                                <span class="status-badge status-active">
                                                    <i class="fas fa-check-circle"></i> ${product.stock}
                                                </span>
                                            </c:when>
                                            <c:when test="${product.stock > 0}">
                                                <span class="status-badge status-inactive">
                                                    <i class="fas fa-exclamation-circle"></i> ${product.stock} (Low)
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge status-inactive">
                                                    <i class="fas fa-times-circle"></i> Out of Stock
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td data-label="Price">$${product.price}</td>
                                    <td data-label="Actions" class="action-buttons">
                                        <form action="updateProduct" method="get" style="display: inline;">
                                            <input type="hidden" name="id" value="${product.id}">
                                            <button type="submit" class="btn-action btn-edit">
                                                <i class="fas fa-edit"></i> Edit
                                            </button>
                                        </form>
                                        
                                        <form action="deleteProduct" method="POST" style="display: inline;">
                                            <input type="hidden" name="id" value="${product.id}">
                                            <button type="submit" class="btn-action btn-delete" 
                                                    onclick="return confirm('Are you sure you want to delete ${product.productName}?')">
                                                <i class="fas fa-trash"></i> Delete
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="fas fa-box-open"></i>
                        <h3>No Products Found</h3>                       
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script>
        // Simple animation for table rows
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('.product-table tbody tr');
            rows.forEach((row, index) => {
                row.style.opacity = '0';
                row.style.transform = 'translateY(10px)';
                row.style.transition = `all 0.3s ease ${index * 0.05}s`;
                
                setTimeout(() => {
                    row.style.opacity = '1';
                    row.style.transform = 'translateY(0)';
                }, 50);
            });
        });
    </script>
</body>
</html>