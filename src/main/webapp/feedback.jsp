<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Feedback - Grocery Ordering System</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

    <!-- FontAwesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- RateYo CSS for Rating Stars -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

    <!-- Custom Styles (Placed after external CSS) -->
    <style>
        :root {
            --primary-color: #013220;
            --accent-color: #ff4c29;
            --text-color: white;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--primary-color);
            color: var(--text-color);
            min-height: 100vh;
            overflow-x: hidden;
        }

        .main-content {
            padding: 30px;
            margin-left: 0;
            transition: all 0.3s ease;
            min-height: 100vh;
        }

        .welcome-message {
            color: white;
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .feedback-card {
            background-color: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 30px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .feedback-title {
            color: white;
            font-size: 22px;
            margin-bottom: 20px;
            font-weight: 600;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding-bottom: 10px;
        }

        .form-label {
            color: #ffcc00;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .form-control,
        .form-select {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .form-control:focus,
        .form-select:focus {
            background-color: rgba(255, 255, 255, 0.15);
            border-color: var(--accent-color);
            color: white;
            box-shadow: 0 0 0 0.25rem rgba(255, 76, 41, 0.25);
        }

        .rating-container {
            margin: 15px 0;
        }

        .jq-ry-container {
            padding: 5px 0;
        }

        .btn-submit-feedback {
            background: linear-gradient(135deg, #ff4c29 0%, #ff6b3d 100%);
            padding: 12px 30px;
            font-size: 16px;
            font-weight: 500;
            border: none;
            border-radius: 5px;
            color: white;
            transition: all 0.3s ease;
            margin-top: 15px;
            width: 100%;
        }

        .btn-submit-feedback:hover {
            background: linear-gradient(135deg, #e03e1a 0%, #e05a2a 100%);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 76, 41, 0.3);
        }

        .feedback-item-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .feedback-user {
            font-weight: 600;
            color: var(--accent-color);
        }

        .feedback-date {
            color: rgba(255, 255, 255, 0.6);
            font-size: 14px;
        }

        .feedback-rating {
            color: #ffcc00;
            margin-bottom: 8px;
        }

        .feedback-comment {
            color: rgba(255, 255, 255, 0.8);
            line-height: 1.6;
        }

        @media (max-width: 768px) {
            .welcome-message {
                font-size: 20px;
            }
        }

        @media (max-width: 576px) {
            .feedback-item-header {
                flex-direction: column;
            }

            .feedback-date {
                margin-top: 5px;
            }
        }
    </style>

</head>

<body>

    <!-- Include header file -->
    <%@ include file="./header.jsp" %>

    <div class="main-content">
        <div class="welcome-message">
            <i class="fas fa-comment-alt"></i> Share Your Feedback
        </div>

        <!-- Sample Feedback -->
        <div class="mb-4" style="background: rgba(255,255,255,0.05); padding: 20px; border-radius: 8px; border-left: 3px solid var(--accent-color);">
            <div class="feedback-item-header">
                <span class="feedback-user">Order #10123</span>
                <span class="feedback-date">2025-04-20</span>
            </div>
            <div class="feedback-rating">
                <i class="fas fa-star text-warning"></i>
                <i class="fas fa-star text-warning"></i>
                <i class="fas fa-star text-warning"></i>
                <i class="fas fa-star text-warning"></i>
                <i class="fas fa-star text-secondary"></i>
                <span style="margin-left: 8px;">4/5</span>
            </div>
            <div class="feedback-comment">
                <strong>DELIVERY:</strong> Delivery was quick and the packaging was secure. Would love a more accurate ETA next time.
            </div>
        </div>

        <!-- Feedback Form -->
        <div class="row">
            <div class="col-lg-8">
                <div class="feedback-card">
                    <h3 class="feedback-title"><i class="fas fa-pencil-alt"></i> Submit Feedback</h3>

                    <form id="feedbackForm" action="${pageContext.request.contextPath}/submitFeedback" method="post">
                        <div class="mb-3">
                            <label for="orderId" class="form-label"><i class="fas fa-receipt"></i> Order Reference</label>
                            <select class="form-select" id="orderId" name="orderId" required>
                                <option value="" selected disabled>Select your order</option>
                                <c:forEach var="order" items="${sessionScope.customerOrders}">
                                    <option value="${order.orderId}">Order #${order.orderId} - ${order.orderDate}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label"><i class="fas fa-star"></i> Overall Rating</label>
                            <div class="rating-container">
                                <div id="ratingStars"></div>
                                <input type="hidden" id="ratingValue" name="rating" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="feedbackType" class="form-label"><i class="fas fa-tag"></i> Feedback Type</label>
                            <select class="form-select" id="feedbackType" name="feedbackType" required>
                                <option value="" selected disabled>Select feedback type</option>
                                <option value="SITE_NAVIGATION">Site Navigation</option>
                                <option value="PRODUCT_QUALITY">Product Quality</option>
                                <option value="DELIVERY">Delivery Experience</option>
                                <option value="CUSTOMER_SERVICE">Customer Service</option>
                                <option value="PAYMENT_PROCESS">Payment Process</option>
                                <option value="OTHER">Other</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="comments" class="form-label"><i class="fas fa-comment-dots"></i> Your Comments</label>
                            <textarea class="form-control" id="comments" name="comments" rows="5" placeholder="Please share your experience with us..." required></textarea>
                        </div>

                        <button type="submit" class="btn btn-submit-feedback">
                            <i class="fas fa-paper-plane"></i> Submit Feedback
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

    <script>
        $(document).ready(function () {
            $("#ratingStars").rateYo({
                rating: 0,
                starWidth: "30px",
                fullStar: true,
                onSet: function (rating) {
                    $("#ratingValue").val(rating);
                }
            });

            $("#feedbackForm").on("submit", function (e) {
                if ($("#ratingValue").val() === "") {
                    e.preventDefault();
                    alert("Please provide a rating before submitting your feedback.");
                }
            });
        });
    </script>

    <!-- Include footer file -->
    <%@ include file="./footer.jsp" %>

</body>

</html>
