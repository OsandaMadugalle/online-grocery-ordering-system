<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<c:if test="${empty sessionScope.loggedIn}">
    <c:redirect url="inventoryManagerLogin.jsp"/>
</c:if>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product | Inventory Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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

        .form-header h2 {
            font-weight: bold;
            color: var(--accent-color);
            margin-bottom: 10px;
        }

        .form-label {
            font-weight: 500;
            color: var(--text-color);
        }

        .form-control,
        .form-select {
            background-color: #0f0f1c;
            color: var(--text-color);
            border: 1px solid #333;
            border-radius: 6px;
            padding: 0.7rem 1rem;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.2rem rgba(76, 201, 240, 0.25);
        }

        .btn-submit {
            background-color: var(--accent-color);
            color: #0a192f;
            font-weight: 600;
            border: none;
            padding: 0.75rem;
            border-radius: 8px;
            margin-top: 1rem;
            transition: all 0.3s;
        }

        .btn-submit:hover {
            background-color: var(--accent-hover);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(76, 201, 240, 0.2);
        }

        .back-link {
            color: var(--accent-color);
            font-weight: 500;
            margin-bottom: 1rem;
            display: inline-block;
            text-decoration: none;
        }

        .back-link:hover {
            color: var(--accent-hover);
            text-decoration: underline;
        }

        .image-upload-container {
            background-color: #0f0f1c;
            border: 2px dashed #333;
            padding: 1.5rem;
            border-radius: 10px;
            text-align: center;
            margin-top: 1rem;
        }

        .image-upload-container:hover {
            border-color: var(--accent-color);
        }

        .preview-image {
            max-width: 200px;
            max-height: 200px;
            border-radius: 8px;
            border: 1px solid #333;
            background-color: #1a1a2e;
            margin-top: 1rem;
        }

        .upload-btn {
            background-color: var(--accent-color);
            color: #000;
            border: none;
            padding: 0.6rem 1.2rem;
            border-radius: 6px;
            margin-top: 1rem;
            cursor: pointer;
            transition: background 0.3s;
        }

        .upload-btn:hover {
            background-color: var(--accent-hover);
        }

        .image-action-btn {
            background-color: var(--secondary-bg);
            color: var(--text-color);
            border: 1px solid var(--accent-color);
            border-radius: 50%;
            width: 32px;
            height: 32px;
            display: inline-flex;
            justify-content: center;
            align-items: center;
        }

        .btn-remove {
            background-color: var(--error-color);
            color: white;
        }

        .btn-change {
            background-color: var(--accent-color);
            color: black;
        }

        .image-actions {
            position: absolute;
            top: -10px;
            right: -10px;
            display: flex;
            gap: 6px;
        }

        .file-input {
            display: none;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            .preview-image {
                max-width: 140px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="${pageContext.request.contextPath}/manageProducts" class="back-link">
            <i class="fas fa-arrow-left me-2"></i> Back to Products
        </a>

        <div class="form-header text-center">
            <h2><i class="fas fa-edit me-2"></i>Update Product</h2>
            <p class="text-muted">Modify the product details below.</p>
        </div>

        <form action="${pageContext.request.contextPath}/updateProduct" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${product.id}">

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Product ID</label>
                    <input type="text" class="form-control" value="${product.id}" readonly>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Category</label>
                    <select class="form-select" name="category" required>
                        <option value="" disabled>Select a category</option>
                        <option value="Electronics" ${product.category == 'Electronics' ? 'selected' : ''}>Electronics</option>
                        <option value="Clothing" ${product.category == 'Clothing' ? 'selected' : ''}>Clothing</option>
                        <option value="Home & Garden" ${product.category == 'Home & Garden' ? 'selected' : ''}>Home & Garden</option>
                        <option value="Sports" ${product.category == 'Sports' ? 'selected' : ''}>Sports</option>
                        <option value="Other" ${product.category == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Product Name</label>
                <input type="text" class="form-control" name="productName" value="${product.productName}" required>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Stock</label>
                    <input type="number" class="form-control" name="stock" value="${product.stock}" min="0" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Price ($)</label>
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                        <input type="number" step="0.01" class="form-control" name="price" value="${product.price}" min="0" required>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Product Image</label>
                <div class="image-upload-container">
                    <div class="preview-container position-relative" id="previewContainer" style="${empty product.imagePath ? 'display:none' : ''}">
                        <div class="image-actions">
                            <button type="button" class="image-action-btn btn-change" onclick="document.getElementById('imageFile').click()">
                                <i class="fas fa-sync-alt"></i>
                            </button>
                            <button type="button" class="image-action-btn btn-remove" onclick="removeImage()">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                        <img src="${not empty product.imagePath ? product.imagePath : 'productImages/default-product.png'}"
						     alt="Product preview"
						     class="preview-image"
						     id="previewImage">
						 </div>

                    <input type="file" id="imageFile" name="imageFile" accept="image/*" class="file-input" onchange="previewUploadedImage(this)">
                    <input type="hidden" name="existingImagePath" value="${product.imagePath}" id="existingImagePath">

                    <button type="button" class="upload-btn" onclick="document.getElementById('imageFile').click()" id="uploadBtn" ${not empty product.imagePath ? 'style=display:none' : ''}>
                        <i class="fas fa-cloud-upload-alt"></i> Upload Image
                    </button>

                    <div class="mt-2 text-muted small">
                        <i class="fas fa-info-circle"></i> Recommended size: 500x500px, JPG/PNG
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-submit w-100">
                <i class="fas fa-save me-2"></i> Update Product
            </button>
        </form>
    </div>

    <script>
        function previewUploadedImage(input) {
            const previewImage = document.getElementById('previewImage');
            const previewContainer = document.getElementById('previewContainer');
            const uploadBtn = document.getElementById('uploadBtn');
            const file = input.files[0];

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    previewImage.src = e.target.result;
                    previewContainer.style.display = 'inline-block';
                    uploadBtn.style.display = 'none';
                    document.getElementById('existingImagePath').value = '';
                }
                reader.readAsDataURL(file);
            }
        }

        function removeImage() {
            document.getElementById('previewContainer').style.display = 'none';
            document.getElementById('uploadBtn').style.display = 'inline-flex';
            document.getElementById('imageFile').value = '';
            document.getElementById('existingImagePath').value = '';
        }
    </script>
</body>
</html>
