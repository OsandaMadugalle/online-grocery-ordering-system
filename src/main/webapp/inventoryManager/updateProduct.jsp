<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<c:if test="${product == null}">
    <c:redirect url="${pageContext.request.contextPath}/manageProducts" />
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
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --danger-color: #f72585;
            --border-radius: 12px;
            --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }
        
        body {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .form-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2.5rem;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            background: white;
            border-top: 4px solid var(--primary-color);
            animation: fadeIn 0.5s ease-out;
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 2rem;
            color: var(--dark-color);
        }
        
        .form-header h2 {
            font-weight: 600;
            position: relative;
            display: inline-block;
            padding-bottom: 10px;
        }
        
        .form-header h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: var(--accent-color);
            border-radius: 3px;
        }
        
        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
        }
        
        .form-control {
            padding: 0.75rem 1rem;
            border-radius: 8px;
            border: 1px solid #ced4da;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.15);
        }
        
        .btn-submit {
            background-color: var(--primary-color);
            border: none;
            padding: 0.75rem;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            margin-top: 1.5rem;
        }
        
        .btn-submit:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(63, 55, 201, 0.2);
        }
        
        .back-link {
            color: var(--primary-color);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            margin-bottom: 1.5rem;
            transition: all 0.2s;
            font-weight: 500;
        }
        
        .back-link:hover {
            color: var(--secondary-color);
            transform: translateX(-3px);
        }
        
        .image-upload-container {
            margin-top: 1rem;
            border: 2px dashed #dee2e6;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            text-align: center;
            transition: all 0.3s;
            background-color: #f8f9fa;
        }
        
        .image-upload-container:hover {
            border-color: var(--accent-color);
            background-color: rgba(72, 149, 239, 0.05);
        }
        
        .preview-container {
            position: relative;
            display: inline-block;
            margin-top: 1rem;
        }
        
        .preview-image {
            max-width: 200px;
            max-height: 200px;
            border-radius: 8px;
            border: 1px solid #dee2e6;
            padding: 5px;
            background: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            object-fit: contain;
        }
        
        .upload-btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 1rem;
        }
        
        .upload-btn:hover {
            background-color: var(--secondary-color);
        }
        
        .file-input {
            display: none;
        }
        
        .image-actions {
            position: absolute;
            top: -10px;
            right: -10px;
            display: flex;
            gap: 5px;
        }
        
        .image-action-btn {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            border: none;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .image-action-btn:hover {
            transform: scale(1.1);
        }
        
        .btn-remove {
            background: var(--danger-color);
            color: white;
        }
        
        .btn-change {
            background: var(--accent-color);
            color: white;
        }
        
        @media (max-width: 768px) {
            .form-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .preview-image {
                max-width: 150px;
                max-height: 150px;
            }
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="form-container">
            <a href="${pageContext.request.contextPath}/manageProducts" class="back-link">
                <i class="fas fa-arrow-left me-2"></i> Back to Products
            </a>
            
            <div class="form-header">
                <h2><i class="fas fa-edit me-2"></i>Update Product</h2>
                <p class="text-muted">Edit the product details below</p>
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
                        <div class="preview-container" id="previewContainer" style="${empty product.imagePath ? 'display:none' : ''}">
                            <div class="image-actions">
                                <button type="button" class="image-action-btn btn-change" onclick="document.getElementById('imageFile').click()">
                                    <i class="fas fa-sync-alt"></i>
                                </button>
                                <button type="button" class="image-action-btn btn-remove" onclick="removeImage()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                            <img src="${not empty product.imagePath ? product.imagePath : ''}" 
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
                            <i class="fas fa-info-circle"></i> Recommended size: 500x500px, JPG/PNG format
                        </div>
                    </div>
                </div>
                
                <button type="submit" class="btn btn-primary btn-submit w-100">
                    <i class="fas fa-save me-2"></i>Update Product
                </button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Preview uploaded image
        function previewUploadedImage(input) {
            const previewContainer = document.getElementById('previewContainer');
            const previewImage = document.getElementById('previewImage');
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
        
        // Remove image
        function removeImage() {
            const previewContainer = document.getElementById('previewContainer');
            const uploadBtn = document.getElementById('uploadBtn');
            const fileInput = document.getElementById('imageFile');
            
            previewContainer.style.display = 'none';
            uploadBtn.style.display = 'inline-flex';
            fileInput.value = '';
            document.getElementById('existingImagePath').value = '';
        }
        
        // Initialize with existing image
        document.addEventListener('DOMContentLoaded', function() {
            if (document.getElementById('previewImage').src) {
                document.getElementById('uploadBtn').style.display = 'none';
            }
        });
    </script>
</body>
</html>