<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<c:if test="${empty sessionScope.loggedIn or empty sessionScope.inventoryManagerDetails}">
    <c:redirect url="/inventoryManager/inventoryManagerLogin.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary-bg: #1a1a2e;
            --secondary-bg: #16213e;
            --accent-color: #4cc9f0;
            --accent-hover: #3a9ec7;
            --text-color: white;
            --placeholder-color: #b8c2d9;
            --error-color: #e94560;
            --success-color: #4ade80;
            --warning-color: #f59e0b;
            --form-bg: rgba(255, 255, 255, 0.1);
            --border-radius: 10px;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-bg);
            color: var(--text-color);
            min-height: 100vh;
            padding: 20px 0;
            background-image: linear-gradient(to bottom right, var(--primary-bg), var(--secondary-bg));
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            max-width: 90%;
            background: var(--form-bg);
            backdrop-filter: blur(12px);
            padding: 30px;
            border-radius: var(--border-radius);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.1);
            margin: 0 auto;
            animation: fadeIn 0.6s ease-out, float 6s ease-in-out infinite;
        }

        .form-header h2 {
            font-weight: bold;
            color: var(--accent-color);
            margin-bottom: 10px;
        }

        .form-label {
            font-weight: 500;
            color: var(--accent-color);
        }

        .form-control,
        .form-select {
            background: rgba(255, 255, 255, 0.15);
            color: var(--text-color);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--border-radius);
            padding: 12px 20px;
            transition: all 0.3s ease;
            font-size: 15px;
        }

        .form-control:focus,
        .form-select:focus {
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 0 0 0.2rem rgba(76, 201, 240, 0.3);
            border-color: var(--accent-color);
            outline: none;
        }

        .form-control::placeholder {
            color: var(--placeholder-color);
            opacity: 0.7;
        }

        .form-control[readonly] {
            background-color: rgba(128, 128, 128, 0.2);
            color: #ccc;
        }

        .btn-submit {
            background: var(--accent-color);
            color: #0a192f;
            font-size: clamp(0.9rem, 1.2vw, 1rem);
            font-weight: 600;
            border: none;
            padding: 14px;
            width: 100%;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
            margin-top: 25px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .btn-submit:hover {
            background: var(--accent-hover);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(76, 201, 240, 0.3);
        }

        .home-icon {
            position: fixed;
            top: 25px;
            left: 25px;
            font-size: 1.5rem;
            color: white;
            text-decoration: none;
            z-index: 100;
            background: rgba(76, 201, 240, 0.2);
            padding: 10px 15px;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
            border: 1px solid rgba(76, 201, 240, 0.3);
        }
        
        .home-icon:hover {
            background: rgba(76, 201, 240, 0.3);
            transform: translateY(-2px);
        }

        .image-upload-container {
            background-color: #0f0f1c;
            border: 2px dashed #333;
            padding: 1.5rem;
            border-radius: 10px;
            text-align: center;
            margin-top: 1rem;
            position: relative;
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
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        .spinner-border {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: none;
        }

        .loading-btn {
            display: block;
            opacity: 0;
        }

        .loading-btn.active {
            display: inline-block;
            opacity: 1;
        }

        @media (max-width: 768px) {
            .container {
                padding: 30px;
                margin-top: 60px;
            }
            
            .home-icon {
                top: 15px;
                left: 15px;
                font-size: 1.3rem;
                padding: 8px 12px;
            }

            .preview-image {
                max-width: 140px;
            }
        }

        @media (max-width: 576px) {
            .container {
                padding: 25px 20px;
            }
            
            body {
                padding: 15px;
                align-items: flex-start;
            }
            
            .form-control {
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>
    <a href="./manageProducts" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="container">
        <div class="form-header text-center">
            <h2><i class="fas fa-edit me-2"></i>Update Product</h2>
            <p class="text-muted">Modify the product details below.</p>
        </div>

        <form action="./updateProduct" method="post" enctype="multipart/form-data" id="updateForm">
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
                        <option value="Fruits & Vegetables" ${product.category == 'Fruits & Vegetables' ? 'selected' : ''}>Fruits & Vegetables</option>
                        <option value="Dairy & Eggs" ${product.category == 'Dairy & Eggs' ? 'selected' : ''}>Dairy & Eggs</option>
                        <option value="Meat & Seafood" ${product.category == 'Meat & Seafood' ? 'selected' : ''}>Meat & Seafood</option>
                        <option value="Bakery & Bread" ${product.category == 'Bakery & Bread' ? 'selected' : ''}>Bakery & Bread</option>
                        <option value="Pantry Staples" ${product.category == 'Pantry Staples' ? 'selected' : ''}>Pantry Staples</option>
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
                        <img src="./${not empty product.imagePath ? product.imagePath : 'images/default-product.png'}"
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
                <div class="spinner-border spinner-border-sm text-light loading-btn" role="status"></div>
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

        // Optional: Show loading spinner when the form is being submitted
        document.getElementById("updateForm").addEventListener("submit", function() {
            const submitButton = document.querySelector(".btn-submit");
            const spinner = submitButton.querySelector(".spinner-border");
            spinner.classList.add("active");
            submitButton.disabled = true;
        });
    </script>
</body>
</html>