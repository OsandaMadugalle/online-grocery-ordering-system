<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Add Product</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        :root {
            --primary-bg: #0f0f1a;
            --secondary-bg: #1a1a2a;
            --accent-color: #7CFC00;
            --accent-hover: #66cc00;
            --text-color: #f0f0f0;
            --error-color: #ff4d4f;
            --form-bg: rgba(255, 255, 255, 0.08);
            --border-radius: 10px;
            --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-bg);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-image: linear-gradient(to bottom right, var(--primary-bg), var(--secondary-bg));
        }

        .form-container {
            background: var(--form-bg);
            backdrop-filter: blur(12px);
            padding: 40px;
            width: 100%;
            max-width: 800px;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            border: 1px solid rgba(255, 255, 255, 0.1);
            animation: fadeIn 0.6s ease;
        }

        .form-title {
            font-size: 1.8rem;
            margin-bottom: 30px;
            text-align: center;
            color: var(--accent-color);
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.15);
            color: var(--text-color);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 14px 20px;
            border-radius: var(--border-radius);
            margin-bottom: 20px;
            transition: all 0.3s ease;
            font-size: 15px;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 0 0 0.2rem rgba(124, 252, 0, 0.3);
            border-color: var(--accent-color);
            outline: none;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .btn-submit {
            background: var(--accent-color);
            color: #0a0a0a;
            font-size: 1rem;
            font-weight: 600;
            border: none;
            padding: 14px;
            width: 100%;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
            margin-top: 20px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .btn-submit:hover {
            background: var(--accent-hover);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(124, 252, 0, 0.3);
        }

        .home-icon {
            position: fixed;
            top: 25px;
            left: 25px;
            font-size: 1.3rem;
            color: white;
            text-decoration: none;
            z-index: 100;
            background: rgba(124, 252, 0, 0.2);
            padding: 10px 15px;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
            border: 1px solid rgba(124, 252, 0, 0.3);
        }

        .home-icon:hover {
            background: rgba(124, 252, 0, 0.3);
            transform: translateY(-2px);
        }

        .image-preview-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }

        .image-preview {
            max-width: 250px;
            max-height: 250px;
            border-radius: var(--border-radius);
            border: 2px dashed rgba(255, 255, 255, 0.3);
            padding: 10px;
            margin-bottom: 15px;
            object-fit: contain;
            background-color: rgba(0, 0, 0, 0.2);
        }

        .file-input-label {
            display: inline-block;
            padding: 10px 20px;
            background: rgba(124, 252, 0, 0.1);
            color: var(--accent-color);
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: all 0.3s ease;
            border: 1px dashed var(--accent-color);
            text-align: center;
            margin-bottom: 15px;
            width: 100%;
        }

        .file-input-label:hover {
            background: rgba(124, 252, 0, 0.2);
        }

        .file-input {
            display: none;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--accent-color);
        }

        .enhanced-dropdown {
            background: rgba(255, 255, 255, 0.15);
            color: var(--text-color);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 14px 20px;
            border-radius: var(--border-radius);
            margin-bottom: 20px;
            transition: all 0.3s ease;
            font-size: 15px;
            appearance: none;
            position: relative;
        }

        .enhanced-dropdown:focus {
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 0 0 0.2rem rgba(124, 252, 0, 0.3);
            border-color: var(--accent-color);
            outline: none;
        }

        .enhanced-dropdown:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 30px;
                margin-top: 60px;
            }
        }

        @media (max-width: 576px) {
            .form-container {
                padding: 25px 20px;
            }

            .image-preview {
                max-width: 200px;
                max-height: 200px;
            }

            .file-input-label {
                width: auto;
                padding: 8px 15px;
            }

            .btn-submit {
                font-size: 0.9rem;
            }
        }
    </style>
</head>

<body>
    <a href="../manageProducts" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="form-container">
        <h3 class="form-title">
            <i class="fas fa-${empty product.id ? 'plus-circle' : 'edit'} mr-2"></i>
            ${empty product.id ? 'Add New Product' : 'Edit Product'}
        </h3>

        <form action="../addProducts" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${product.id}">

            <div class="form-group">
                <label class="form-label">Product Name</label>
                <input type="text" class="form-control" name="productName"
                       placeholder="Enter product name" value="${product.productName}" required>
            </div>

            <div class="form-group">
                <label class="form-label">Category</label>
                <select class="form-control enhanced-dropdown" name="category" required>
                    <option value="" disabled ${empty product.category ? 'selected' : ''}>Select a category</option>
                    <option value="Fruits & Vegetables" ${product.category == 'Fruits & Vegetables' ? 'selected' : ''}>Fruits & Vegetables</option>
                    <option value="Dairy & Eggs" ${product.category == 'Dairy & Eggs' ? 'selected' : ''}>Dairy & Eggs</option>
                    <option value="Meat & Seafood" ${product.category == 'Meat & Seafood' ? 'selected' : ''}>Meat & Seafood</option>
                    <option value="Bakery & Bread" ${product.category == 'Bakery & Bread' ? 'selected' : ''}>Bakery & Bread</option>
                    <option value="Pantry Staples" ${product.category == 'Pantry Staples' ? 'selected' : ''}>Pantry Staples</option>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label">Stock Quantity</label>
                <input type="number" class="form-control" name="stock"
                       placeholder="Enter stock quantity" value="${product.stock}" required min="0">
            </div>

            <div class="form-group">
                <label class="form-label">Price</label>
                <input type="number" step="0.01" class="form-control" name="price"
                       placeholder="Enter price" value="${product.price}" required min="0">
            </div>

            <div class="form-group">
                <label class="form-label">Product Image</label>
                <div class="image-preview-container">
                    <c:if test="${not empty product.imagePath}">
                        <img src="../${product.imagePath}" alt="Current Product Image" class="image-preview" id="currentImagePreview">
                    </c:if>
                    <img src="#" alt="Preview" class="image-preview" id="imagePreview" style="display: none;">

                    <label for="imageFile" class="file-input-label">
                        <i class="fas fa-upload mr-2"></i>
                        ${empty product.imagePath ? 'Upload Product Image' : 'Change Image'}
                    </label>
                    <input type="file" id="imageFile" name="imageFile" accept="image/*" class="file-input">

                    <c:if test="${not empty product.imagePath}">
                        <input type="hidden" name="existingImagePath" value="${product.imagePath}">
                    </c:if>
                </div>
            </div>

            <button type="submit" class="btn-submit">
                <i class="fas fa-${empty product.id ? 'save' : 'sync-alt'} mr-2"></i>
                ${empty product.id ? 'Add Product' : 'Update Product'}
            </button>
        </form>
    </div>

    <script>
        document.getElementById('imageFile').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                const preview = document.getElementById('imagePreview');
                const currentPreview = document.getElementById('currentImagePreview');

                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                    if (currentPreview) currentPreview.style.display = 'none';
                }

                reader.readAsDataURL(file);
            }
        });

        document.querySelector('form').addEventListener('submit', function(e) {
            const stock = document.querySelector('input[name="stock"]').value;
            const price = document.querySelector('input[name="price"]').value;

            if (parseInt(stock) < 0) {
                alert('Stock quantity cannot be negative');
                e.preventDefault();
                return false;
            }

            if (parseFloat(price) <= 0) {
                alert('Price must be greater than 0');
                e.preventDefault();
                return false;
            }
        });
    </script>
</body>
</html>
